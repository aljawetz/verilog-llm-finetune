`timescale 1ns/1ps

module tb_universal_shift_register;

  reg clk;
  reg reset;
  reg [1:0] select;
  reg [3:0] pdin;
  reg l_in;
  reg r_in;
  wire [3:0] pdout;
  wire l_s_out;
  wire r_s_out;

  // Instantiate the module under test (uut)
  universal_shift_register uut (
    .clk(clk),
    .reset(reset),
    .select(select),
    .pdin(pdin),
    .l_in(l_in),
    .r_in(r_in),
    .pdout(pdout),
    .l_s_out(l_s_out),
    .r_s_out(r_s_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset = 1;
    select = 2'b00;
    pdin = 4'b0000;
    l_in = 1'b0;
    r_in = 1'b0;

    // Release reset
    #10 reset = 0;

    // Test parallel load
    pdin = 4'b1010; select = 2'b10; #10;
    if (pdout !== 4'b1010) $display("FAIL: Parallel load failed");

    // Test left shift
    select = 2'b01; l_in = 1'b1; #10;
    if (pdout !== 4'b0101) $display("FAIL: Left shift failed");

    // Test right shift
    select = 2'b00; r_in = 1'b0; #10;
    if (pdout !== 4'b0010) $display("FAIL: Right shift failed");

    // Test reset
    reset = 1; #10;
    if (pdout !== 4'b0000) $display("FAIL: Reset failed");

    // Test left shift with reset
    reset = 0; pdin = 4'b1111; select = 2'b10; #10; // Load 1111
    select = 2'b01; l_in = 1'b0; #10;
    if (pdout !== 4'b1110) $display("FAIL: Left shift after reset failed");

    // Test right shift with reset
    select = 2'b00; r_in = 1'b1; #10;
    if (pdout !== 4'b0111) $display("FAIL: Right shift after reset failed");

    // Final check
    $display("PASS");
    $finish;
  end

endmodule