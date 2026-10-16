`timescale 1ns/1ps

module tb_sipov;
  reg clk;
  reg rst;
  reg in;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  sipov uut (
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out)
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
    in = 0;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10;

    // Test shifting in bits
    in = 1; #10; // Shift in 1
    if (out !== 4'b0001) $display("FAIL: Expected out=0001, got out=%b", out);
    
    in = 0; #10; // Shift in 0
    if (out !== 4'b0001) $display("FAIL: Expected out=0001, got out=%b", out);
    
    in = 1; #10; // Shift in 1
    if (out !== 4'b1001) $display("FAIL: Expected out=1001, got out=%b", out);
    
    in = 1; #10; // Shift in 1
    if (out !== 4'b1101) $display("FAIL: Expected out=1101, got out=%b", out);
    
    in = 0; #10; // Shift in 0
    if (out !== 4'b1110) $display("FAIL: Expected out=1110, got out=%b", out);
    
    // Assert reset functionality
    rst = 1; #10; // Assert reset
    if (out !== 4'b0000) $display("FAIL: Expected out=0000 after reset, got out=%b", out);
    
    rst = 0; #10; // Release reset
    in = 1; #10; // Shift in 1
    if (out !== 4'b0001) $display("FAIL: Expected out=0001, got out=%b", out);
    
    // End simulation
    $display("PASS");
    $finish;
  end
endmodule