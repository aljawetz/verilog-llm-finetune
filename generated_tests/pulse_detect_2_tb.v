`timescale 1ns/1ps

module tb_pulse_detect;

  reg clk;
  reg rst_n;
  reg data_in;
  wire data_out;

  // Instantiate the module under test (uut)
  pulse_detect uut (
    .clk(clk),
    .rst_n(rst_n),
    .data_in(data_in),
    .data_out(data_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst_n = 0;
    data_in = 0;

    // Apply reset
    #10;
    rst_n = 1;

    // Test case 1: No pulses
    #10;
    if (data_out !== 1'b0) $display("FAIL: Expected data_out = 0 after no pulses");
    
    // Test case 2: One pulse
    data_in = 1; #10;
    data_in = 0; #10;
    if (data_out !== 1'b0) $display("FAIL: Expected data_out = 0 after one pulse");

    // Test case 3: Two pulses
    data_in = 1; #10;
    data_in = 0; #10;
    data_in = 1; #10;
    data_in = 0; #10;
    if (data_out !== 1'b0) $display("FAIL: Expected data_out = 0 after two pulses");

    // Test case 4: Three pulses
    data_in = 1; #10;
    data_in = 0; #10;
    data_in = 1; #10;
    data_in = 0; #10;
    data_in = 1; #10;
    #10;
    if (data_out !== 1'b1) $display("FAIL: Expected data_out = 1 after three consecutive pulses");

    // Test case 5: Reset after three pulses
    rst_n = 0; #10;
    rst_n = 1; #10;
    if (data_out !== 1'b0) $display("FAIL: Expected data_out = 0 after reset");

    // Test case 6: Three pulses again
    data_in = 1; #10;
    data_in = 0; #10;
    data_in = 1; #10;
    data_in = 0; #10;
    data_in = 1; #10;
    #10;
    if (data_out !== 1'b1) $display("FAIL: Expected data_out = 1 after three consecutive pulses again");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule