`timescale 1ns/1ps

module tb_CELL_TYPE_AND;

  parameter PARAM_WIDTH = 4;
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN0;
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN1;
  wire [PARAM_WIDTH - 1 : 0] PORT_ID_OUT;

  // Instantiate the module under test
  CELL_TYPE_AND #(PARAM_WIDTH) uut (
    .PORT_ID_IN0(PORT_ID_IN0),
    .PORT_ID_IN1(PORT_ID_IN1),
    .PORT_ID_OUT(PORT_ID_OUT)
  );

  initial begin
    // Test case 1: Both inputs are 0
    PORT_ID_IN0 = 4'b0000;
    PORT_ID_IN1 = 4'b0000;
    #10;
    if (PORT_ID_OUT !== 4'b0000) begin
      $display("FAIL: Test case 1 failed, expected 0000, got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 2: One input is 1
    PORT_ID_IN0 = 4'b0001;
    PORT_ID_IN1 = 4'b0000;
    #10;
    if (PORT_ID_OUT !== 4'b0000) begin
      $display("FAIL: Test case 2 failed, expected 0000, got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 3: Both inputs are 1
    PORT_ID_IN0 = 4'b1111;
    PORT_ID_IN1 = 4'b1111;
    #10;
    if (PORT_ID_OUT !== 4'b1111) begin
      $display("FAIL: Test case 3 failed, expected 1111, got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 4: Mixed inputs
    PORT_ID_IN0 = 4'b1010;
    PORT_ID_IN1 = 4'b1100;
    #10;
    if (PORT_ID_OUT !== 4'b1000) begin
      $display("FAIL: Test case 4 failed, expected 1000, got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 5: All inputs are 0 except one
    PORT_ID_IN0 = 4'b0101;
    PORT_ID_IN1 = 4'b0011;
    #10;
    if (PORT_ID_OUT !== 4'b0001) begin
      $display("FAIL: Test case 5 failed, expected 0001, got %b", PORT_ID_OUT);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule