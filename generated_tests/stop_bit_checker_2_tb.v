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
    forever #5 clk = ~clk; // 100MHz clock
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

    // Test case 2: Check valid stop bit
    rxin = 1; // Start counting
    #10;
    if (stopbiterror !== 0) begin
      $display("FAIL: Expected stopbiterror to be 0 when rxin is high");
      $finish;
    end

    // Simulate clock cycles to reach count of 15
    repeat (15) begin
      #10;
      if (stopbiterror !== 0) begin
        $display("FAIL: Expected stopbiterror to be 0 during counting");
        $finish;
      end
    end

    // Check output after reaching count of 15
    #10;
    if (rxdataout !== dout1) begin
      $display("FAIL: Expected rxdataout to be dout1 after counting to 15");
      $finish;
    end

    // Test case 3: Check stop bit error after count reset
    rxin = 0; // Should flag stopbiterror
    #10;
    if (stopbiterror !== 1) begin
      $display("FAIL: Expected stopbiterror to be 1 when rxin is low after counting");
      $finish;
    end

    // Test case 4: Check behavior when checkstop is low
    checkstop = 0;
    #10;
    if (stopbiterror !== 0) begin
      $display("FAIL: Expected stopbiterror to be 0 when checkstop is low");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule