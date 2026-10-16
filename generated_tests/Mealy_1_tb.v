`timescale 1ns/1ps

module tb_Mealy;

  reg clk;
  reg rst;
  reg data_in;
  wire data_out;
  wire [5:0] state;
  wire [5:0] next_state;

  // Instantiate the Mealy module
  Mealy uut (
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .data_out(data_out),
    .state(state),
    .next_state(next_state)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    data_in = 0;
    #10;
    
    // Release reset
    rst = 0;
    #10;

    // Test sequence: 0 -> 1 -> 1 -> 0 -> 1 -> 1 (should produce output)
    data_in = 0; #10; // State S0
    if (state !== 6'b000000) $display("FAIL: Expected state S0 after reset");
    
    data_in = 1; #10; // State S1
    if (state !== 6'b000001) $display("FAIL: Expected state S1");
    
    data_in = 1; #10; // State S2
    if (state !== 6'b000010) $display("FAIL: Expected state S2");
    
    data_in = 0; #10; // State S3
    if (state !== 6'b000011) $display("FAIL: Expected state S3");
    
    data_in = 1; #10; // State S4
    if (state !== 6'b000100) $display("FAIL: Expected state S4");
    if (data_out !== 1'b1) $display("FAIL: Expected data_out to be 1 at state S4");
    
    data_in = 0; #10; // Back to State S0
    if (state !== 6'b000000) $display("FAIL: Expected state S0 after output");

    // Check for a sequence that does not produce output
    data_in = 0; #10; // State S0
    if (data_out !== 1'b0) $display("FAIL: Expected data_out to be 0 at state S0");

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule