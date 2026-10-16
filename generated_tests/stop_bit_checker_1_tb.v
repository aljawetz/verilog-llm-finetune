`timescale 1ns/1ps

module tb_stop_bit_checker;

  reg [7:0] dout1;
  wire [7:0] rxdataout;
  wire stopbiterror;
  reg rxin;
  reg checkstop;
  reg reset;
  reg clk;

  // Instantiate the module under test (uut)
  stop_bit_checker uut (
    .dout1(dout1),
    .rxdataout(rxdataout),
    .stopbiterror(stopbiterror),
    .rxin(rxin),
    .checkstop(checkstop),
    .reset(reset),
    .clk(clk)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    checkstop = 0;
    dout1 = 8'hAA; // Example data
    rxin = 0;

    // Release reset
    #10 reset = 0;

    // Test case 1: checkstop is low, expect rxdataout to be dout1 and stopbiterror to be 0
    #10 checkstop = 0; rxin = 1; // rxin doesn't matter here
    #10;
    if (rxdataout !== dout1 || stopbiterror !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: checkstop is high, rxin is high, expect rxdataout to be dout1 and stopbiterror to be 0
    #10 checkstop = 1; rxin = 1;
    #10;
    if (rxdataout !== dout1 || stopbiterror !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: checkstop is high, rxin is low, expect stopbiterror to be 1
    #10 rxin = 0;
    #10;
    if (stopbiterror !== 1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: checkstop is high, rxin is high, and x reaches 15
    #10 rxin = 1; 
    for (integer i = 0; i < 15; i = i + 1) begin
      #10; // Wait for the clock
    end
    if (rxdataout !== dout1 || stopbiterror !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: checkstop is high, rxin is low after x reaches 15, expect stopbiterror to be 1
    #10 rxin = 0;
    #10;
    if (stopbiterror !== 1) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule