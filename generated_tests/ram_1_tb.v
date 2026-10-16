`timescale 1ns/1ps

module tb_ram;

  reg we;
  reg re;
  reg clk;
  reg rst;
  reg [3:0] wr;
  reg [3:0] rd;
  reg [7:0] din;
  wire [7:0] dout;

  // Instantiate the RAM module
  ram uut (
    .din(din),
    .dout(dout),
    .we(we),
    .re(re),
    .clk(clk),
    .wr(wr),
    .rd(rd),
    .rst(rst)
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
    we = 0;
    re = 0;
    din = 8'b0;
    wr = 4'b0;
    rd = 4'b0;

    // Release reset
    #10 rst = 0;

    // Test writing to RAM
    we = 1; 
    wr = 4'b0001; 
    din = 8'hAA; 
    #10; // Wait for one clock cycle

    // Test reading from RAM
    we = 0; 
    re = 1; 
    rd = 4'b0001; 
    #10; // Wait for one clock cycle
    if (dout !== 8'hAA) begin
      $display("FAIL: Expected dout = 8'hAA, got dout = %h", dout);
      $finish;
    end

    // Test writing another value
    we = 1; 
    wr = 4'b0010; 
    din = 8'h55; 
    #10; // Wait for one clock cycle

    // Test reading the new value
    we = 0; 
    re = 1; 
    rd = 4'b0010; 
    #10; // Wait for one clock cycle
    if (dout !== 8'h55) begin
      $display("FAIL: Expected dout = 8'h55, got dout = %h", dout);
      $finish;
    end

    // Test reset functionality
    rst = 1; 
    #10; // Wait for one clock cycle
    rst = 0; 

    // Test reading after reset
    re = 1; 
    rd = 4'b0001; 
    #10; // Wait for one clock cycle
    if (dout !== 8'b0) begin
      $display("FAIL: Expected dout = 8'b0 after reset, got dout = %h", dout);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule