`timescale 1ns/1ps

module tb_CELL_TYPE_XOR;

  parameter PARAM_WIDTH = 4; // Change width as needed
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN0;
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN1;
  wire [PARAM_WIDTH - 1 : 0] PORT_ID_OUT;

  // Instantiate the module under test
  CELL_TYPE_XOR #(PARAM_WIDTH) uut (
    .PORT_ID_IN0(PORT_ID_IN0),
    .PORT_ID_IN1(PORT_ID_IN1),
    .PORT_ID_OUT(PORT_ID_OUT)
  );

  initial begin
    // Test case 1: Basic XOR operation
    PORT_ID_IN0 = 4'b0000; PORT_ID_IN1 = 4'b0000; #10;
    if (PORT_ID_OUT !== 4'b0000) $display("FAIL: Test case 1 failed");

    PORT_ID_IN0 = 4'b0000; PORT_ID_IN1 = 4'b1111; #10;
    if (PORT_ID_OUT !== 4'b1111) $display("FAIL: Test case 2 failed");

    PORT_ID_IN0 = 4'b1111; PORT_ID_IN1 = 4'b0000; #10;
    if (PORT_ID_OUT !== 4'b1111) $display("FAIL: Test case 3 failed");

    PORT_ID_IN0 = 4'b1010; PORT_ID_IN1 = 4'b0101; #10;
    if (PORT_ID_OUT !== 4'b1111) $display("FAIL: Test case 4 failed");

    PORT_ID_IN0 = 4'b1100; PORT_ID_IN1 = 4'b1010; #10;
    if (PORT_ID_OUT !== 4'b0110) $display("FAIL: Test case 5 failed");

    PORT_ID_IN0 = 4'b1111; PORT_ID_IN1 = 4'b1111; #10;
    if (PORT_ID_OUT !== 4'b0000) $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule