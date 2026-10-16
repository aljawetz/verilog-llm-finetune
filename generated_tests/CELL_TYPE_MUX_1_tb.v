`timescale 1ns/1ps

module tb_CELL_TYPE_MUX;

  parameter PARAM_WIDTH = 4;
  reg PORT_ID_SEL;
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN0;
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN1;
  wire [PARAM_WIDTH - 1 : 0] PORT_ID_OUT;

  // Instantiate the module under test
  CELL_TYPE_MUX #(PARAM_WIDTH) uut (
    .PORT_ID_SEL(PORT_ID_SEL),
    .PORT_ID_IN0(PORT_ID_IN0),
    .PORT_ID_IN1(PORT_ID_IN1),
    .PORT_ID_OUT(PORT_ID_OUT)
  );

  initial begin
    // Test case 1: Select input 0
    PORT_ID_IN0 = 4'b1010; // Input 0
    PORT_ID_IN1 = 4'b0101; // Input 1
    PORT_ID_SEL = 1'b0;    // Select input 0
    #10; // Wait for 10 time units
    if (PORT_ID_OUT !== PORT_ID_IN0) begin
      $display("FAIL: Test case 1 failed, expected %b, got %b", PORT_ID_IN0, PORT_ID_OUT);
      $finish;
    end

    // Test case 2: Select input 1
    PORT_ID_SEL = 1'b1;    // Select input 1
    #10; // Wait for 10 time units
    if (PORT_ID_OUT !== PORT_ID_IN1) begin
      $display("FAIL: Test case 2 failed, expected %b, got %b", PORT_ID_IN1, PORT_ID_OUT);
      $finish;
    end

    // Test case 3: Change inputs
    PORT_ID_IN0 = 4'b1111; // New Input 0
    PORT_ID_IN1 = 4'b0000; // New Input 1
    PORT_ID_SEL = 1'b0;    // Select input 0
    #10; // Wait for 10 time units
    if (PORT_ID_OUT !== PORT_ID_IN0) begin
      $display("FAIL: Test case 3 failed, expected %b, got %b", PORT_ID_IN0, PORT_ID_OUT);
      $finish;
    end

    PORT_ID_SEL = 1'b1;    // Select input 1
    #10; // Wait for 10 time units
    if (PORT_ID_OUT !== PORT_ID_IN1) begin
      $display("FAIL: Test case 4 failed, expected %b, got %b", PORT_ID_IN1, PORT_ID_OUT);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule