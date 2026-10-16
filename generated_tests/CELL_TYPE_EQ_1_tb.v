`timescale 1ns/1ps

module tb_CELL_TYPE_EQ;
  parameter PARAM_WIDTH = 4;
  
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN0;
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN1;
  wire [0 : 0] PORT_ID_OUT;

  // Instantiate the module under test (uut)
  CELL_TYPE_EQ #(PARAM_WIDTH) uut (
    .PORT_ID_IN0(PORT_ID_IN0),
    .PORT_ID_IN1(PORT_ID_IN1),
    .PORT_ID_OUT(PORT_ID_OUT)
  );

  initial begin
    // Test case 1: Equal inputs
    PORT_ID_IN0 = 4'b1010;
    PORT_ID_IN1 = 4'b1010;
    #10;
    if (PORT_ID_OUT !== 1'b1) begin
      $display("FAIL: Test case 1 failed, expected 1 but got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 2: Unequal inputs
    PORT_ID_IN0 = 4'b1010;
    PORT_ID_IN1 = 4'b0101;
    #10;
    if (PORT_ID_OUT !== 1'b0) begin
      $display("FAIL: Test case 2 failed, expected 0 but got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 3: All bits equal
    PORT_ID_IN0 = 4'b1111;
    PORT_ID_IN1 = 4'b1111;
    #10;
    if (PORT_ID_OUT !== 1'b1) begin
      $display("FAIL: Test case 3 failed, expected 1 but got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 4: All bits unequal
    PORT_ID_IN0 = 4'b0000;
    PORT_ID_IN1 = 4'b1111;
    #10;
    if (PORT_ID_OUT !== 1'b0) begin
      $display("FAIL: Test case 4 failed, expected 0 but got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 5: Mixed bits
    PORT_ID_IN0 = 4'b1100;
    PORT_ID_IN1 = 4'b1100;
    #10;
    if (PORT_ID_OUT !== 1'b1) begin
      $display("FAIL: Test case 5 failed, expected 1 but got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 6: Different lengths (should not happen but testing)
    PORT_ID_IN0 = 4'b0011;
    PORT_ID_IN1 = 4'b0010;
    #10;
    if (PORT_ID_OUT !== 1'b0) begin
      $display("FAIL: Test case 6 failed, expected 0 but got %b", PORT_ID_OUT);
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule