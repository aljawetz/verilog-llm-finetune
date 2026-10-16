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
    rxin = 0;
    dout1 = 8'hAA; // Test data

    // Release reset
    #10 reset = 0;

    // Test case 1: Check stop bit error when rxin is low
    checkstop = 1;
    rxin = 0; // Should flag stopbiterror
    #10;
    if (stopbiterror !== 1) begin
      $display("FAIL: Expected stopbiterror to be 1 when rxin is low");
      $finish;
    end

    // Test case 2: Check valid stop bit detection
    rxin = 1; // Start counting
    #10; // 1 clock cycle
    if (stopbiterror !== 0 || rxdataout !== dout1) begin
      $display("FAIL: Expected stopbiterror to be 0 and rxdataout to be dout1");
      $finish;
    end

    // Simulate 14 more clock cycles with rxin high
    repeat (14) begin
      #10; // 1 clock cycle
      if (stopbiterror !== 0 || rxdataout !== dout1) begin
        $display("FAIL: Expected stopbiterror to be 0 and rxdataout to be dout1");
        $finish;
      end
    end

    // Test case 3: Check valid stop bit detection at 15 cycles
    #10; // 15th clock cycle
    if (stopbiterror !== 0 || rxdataout !== dout1) begin
      $display("FAIL: Expected stopbiterror to be 0 and rxdataout to be dout1");
      $finish;
    end

    // Check that counter resets and outputs dout1
    if (uut.x !== 0) begin
      $display("FAIL: Expected counter to reset to 0 after 15 cycles");
      $finish;
    end

    // Test case 4: Check stop bit error when rxin goes low again
    rxin = 0; // Should flag stopbiterror
    #10;
    if (stopbiterror !== 1) begin
      $display("FAIL: Expected stopbiterror to be 1 when rxin is low");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule