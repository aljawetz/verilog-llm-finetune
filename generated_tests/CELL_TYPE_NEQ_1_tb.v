`timescale 1ns/1ps

module tb_CELL_TYPE_NEQ;

  parameter PARAM_WIDTH = 4;
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN0;
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN1;
  wire [0 : 0] PORT_ID_OUT;

  // Instantiate the module under test
  CELL_TYPE_NEQ #(PARAM_WIDTH) uut (
    .PORT_ID_IN0(PORT_ID_IN0),
    .PORT_ID_IN1(PORT_ID_IN1),
    .PORT_ID_OUT(PORT_ID_OUT)
  );

  initial begin
    // Test case 1: Identical inputs
    PORT_ID_IN0 = 4'b0000;
    PORT_ID_IN1 = 4'b0000;
    #10;
    if (PORT_ID_OUT !== 1'b0) begin
      $display("FAIL: Test case 1 failed, expected 0 but got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 2: Different inputs
    PORT_ID_IN0 = 4'b0000;
    PORT_ID_IN1 = 4'b0001;
    #10;
    if (PORT_ID_OUT !== 1'b1) begin
      $display("FAIL: Test case 2 failed, expected 1 but got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 3: Different inputs
    PORT_ID_IN0 = 4'b1111;
    PORT_ID_IN1 = 4'b1110;
    #10;
    if (PORT_ID_OUT !== 1'b1) begin
      $display("FAIL: Test case 3 failed, expected 1 but got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 4: Identical inputs
    PORT_ID_IN0 = 4'b1010;
    PORT_ID_IN1 = 4'b1010;
    #10;
    if (PORT_ID_OUT !== 1'b0) begin
      $display("FAIL: Test case 4 failed, expected 0 but got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 5: Different inputs
    PORT_ID_IN0 = 4'b1100;
    PORT_ID_IN1 = 4'b0011;
    #10;
    if (PORT_ID_OUT !== 1'b1) begin
      $display("FAIL: Test case 5 failed, expected 1 but got %b", PORT_ID_OUT);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule