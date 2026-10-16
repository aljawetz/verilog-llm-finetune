`timescale 1ns/1ps

module tb_posedge_detector;

  reg in;
  reg clk;
  reg reset;
  wire out;

  // Instantiate the module under test (uut)
  posedge_detector uut (
    .in(in),
    .clk(clk),
    .reset(reset),
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
    reset = 1;
    in = 0;
    #10; // Wait for 10ns

    // Release reset
    reset = 0;
    #10;

    // Test case 1: No rising edge
    in = 0;
    #10;
    if (out !== 0) begin
      $display("FAIL: Expected out = 0 when in = 0");
      $finish;
    end

    // Test case 2: Rising edge detected
    in = 1; // Rising edge
    #10;
    if (out !== 1) begin
      $display("FAIL: Expected out = 1 on rising edge");
      $finish;
    end

    // Test case 3: No change, out should remain high
    #10;
    if (out !== 0) begin
      $display("FAIL: Expected out = 0 after one cycle of high input");
      $finish;
    end

    // Test case 4: Falling edge
    in = 0; // Falling edge
    #10;
    if (out !== 0) begin
      $display("FAIL: Expected out = 0 after falling edge");
      $finish;
    end

    // Test case 5: Rising edge again
    in = 1; // Rising edge
    #10;
    if (out !== 1) begin
      $display("FAIL: Expected out = 1 on second rising edge");
      $finish;
    end

    // Test case 6: Reset functionality
    reset = 1; // Assert reset
    #10;
    if (out !== 0) begin
      $display("FAIL: Expected out = 0 after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule