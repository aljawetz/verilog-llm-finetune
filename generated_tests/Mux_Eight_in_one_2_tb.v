`timescale 1ns/1ps

module tb_Mux_Eight_in_one;

  reg [7:0] data;
  reg [2:0] select;
  reg rst;
  reg clk;
  wire out;

  // Instantiate the module under test (uut)
  Mux_Eight_in_one uut (
    .data(data),
    .select(select),
    .rst(rst),
    .clk(clk),
    .out(out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize
    rst = 1;
    data = 8'b00000000;
    select = 3'b000;
    #10; // Wait for a clock cycle

    // Release reset
    rst = 0;
    #10; // Wait for a clock cycle

    // Test case 1: Select each data input
    data = 8'b10101010; // Data inputs
    select = 3'b000; #10; if (out !== 1'b1) $display("FAIL: Expected out=1 for select=000, got out=%b", out);
    select = 3'b001; #10; if (out !== 1'b0) $display("FAIL: Expected out=0 for select=001, got out=%b", out);
    select = 3'b010; #10; if (out !== 1'b1) $display("FAIL: Expected out=1 for select=010, got out=%b", out);
    select = 3'b011; #10; if (out !== 1'b0) $display("FAIL: Expected out=0 for select=011, got out=%b", out);
    select = 3'b100; #10; if (out !== 1'b1) $display("FAIL: Expected out=1 for select=100, got out=%b", out);
    select = 3'b101; #10; if (out !== 1'b0) $display("FAIL: Expected out=0 for select=101, got out=%b", out);
    select = 3'b110; #10; if (out !== 1'b1) $display("FAIL: Expected out=1 for select=110, got out=%b", out);
    select = 3'b111; #10; if (out !== 1'b0) $display("FAIL: Expected out=0 for select=111, got out=%b", out);

    // Test case 2: Assert reset
    rst = 1; #10; // Wait for a clock cycle
    if (out !== 1'b0) $display("FAIL: Expected out=0 after reset, got out=%b", out);
    rst = 0; #10; // Wait for a clock cycle

    // Test case 3: Check default case
    data = 8'b11111111; // Data inputs
    select = 3'bxxx; #10; // Invalid select
    if (out !== 1'b0) $display("FAIL: Expected out=0 for invalid select, got out=%b", out);

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule