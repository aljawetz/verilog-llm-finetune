`timescale 1ns/1ps

module tb_CELL_TYPE_UGE;

  parameter PARAM_WIDTH = 4;
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN0;
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN1;
  wire [0 : 0] PORT_ID_OUT;

  // Instantiate the module under test (uut)
  CELL_TYPE_UGE #(PARAM_WIDTH) uut (
    .PORT_ID_IN0(PORT_ID_IN0),
    .PORT_ID_IN1(PORT_ID_IN1),
    .PORT_ID_OUT(PORT_ID_OUT)
  );

  initial begin
    // Test case 1: Equal values
    PORT_ID_IN0 = 4'b1010; // 10
    PORT_ID_IN1 = 4'b1010; // 10
    #10;
    if (PORT_ID_OUT !== 1'b1) $display("FAIL: Test case 1 failed (equal values)");

    // Test case 2: First value greater
    PORT_ID_IN0 = 4'b1100; // 12
    PORT_ID_IN1 = 4'b1010; // 10
    #10;
    if (PORT_ID_OUT !== 1'b1) $display("FAIL: Test case 2 failed (first value greater)");

    // Test case 3: First value less
    PORT_ID_IN0 = 4'b1000; // 8
    PORT_ID_IN1 = 4'b1010; // 10
    #10;
    if (PORT_ID_OUT !== 1'b0) $display("FAIL: Test case 3 failed (first value less)");

    // Test case 4: First value equal to second
    PORT_ID_IN0 = 4'b0111; // 7
    PORT_ID_IN1 = 4'b0111; // 7
    #10;
    if (PORT_ID_OUT !== 1'b1) $display("FAIL: Test case 4 failed (first value equal to second)");

    // Test case 5: First value less than second
    PORT_ID_IN0 = 4'b0010; // 2
    PORT_ID_IN1 = 4'b0100; // 4
    #10;
    if (PORT_ID_OUT !== 1'b0) $display("FAIL: Test case 5 failed (first value less than second)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule