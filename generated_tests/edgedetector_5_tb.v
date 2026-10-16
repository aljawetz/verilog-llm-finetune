`timescale 1ns/1ps

module tb_edgedetector;

  reg clk;
  reg reset;
  reg level;
  wire moore;

  // Instantiate the module under test
  edgedetector uut (
    .clk(clk),
    .reset(reset),
    .level(level),
    .moore(moore)
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
    level = 0;
    #10; // Wait for 10ns
    reset = 0;

    // Test case 1: No level change, moore should remain low
    #10;
    if (moore !== 1'b0) $display("FAIL: moore should be low when level is low");

    // Test case 2: Rising edge detected
    level = 1;
    #10;
    if (moore !== 1'b1) $display("FAIL: moore should be high after rising edge detected");

    // Test case 3: Level remains high, moore should go low after one cycle
    #10;
    if (moore !== 1'b0) $display("FAIL: moore should be low after one cycle with level high");

    // Test case 4: Level goes low, moore should remain low
    level = 0;
    #10;
    if (moore !== 1'b0) $display("FAIL: moore should remain low when level is low");

    // Test case 5: Rising edge again
    level = 1;
    #10;
    if (moore !== 1'b1) $display("FAIL: moore should be high after rising edge detected again");

    // Test case 6: Level stays high, moore should go low after one cycle
    #10;
    if (moore !== 1'b0) $display("FAIL: moore should be low after one cycle with level high");

    // Test case 7: Reset the module
    reset = 1;
    #10;
    reset = 0;
    if (moore !== 1'b0) $display("FAIL: moore should be low after reset");

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule