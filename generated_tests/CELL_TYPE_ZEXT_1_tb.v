`timescale 1ns/1ps

module tb_CELL_TYPE_ZEXT;

  parameter PARAM_IN_WIDTH = 2;
  parameter PARAM_OUT_WIDTH = 4;

  reg [PARAM_IN_WIDTH - 1 : 0] PORT_ID_IN;
  wire [PARAM_OUT_WIDTH - 1 : 0] PORT_ID_OUT;

  // Instantiate the module under test (uut)
  CELL_TYPE_ZEXT #(PARAM_IN_WIDTH, PARAM_OUT_WIDTH) uut (
    .PORT_ID_IN(PORT_ID_IN),
    .PORT_ID_OUT(PORT_ID_OUT)
  );

  initial begin
    // Test case 1: Input is 00
    PORT_ID_IN = 2'b00;
    #10;
    if (PORT_ID_OUT !== 4'b0000) begin
      $display("FAIL: Test case 1 failed, expected 0000, got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 2: Input is 01
    PORT_ID_IN = 2'b01;
    #10;
    if (PORT_ID_OUT !== 4'b0001) begin
      $display("FAIL: Test case 2 failed, expected 0001, got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 3: Input is 10
    PORT_ID_IN = 2'b10;
    #10;
    if (PORT_ID_OUT !== 4'b0010) begin
      $display("FAIL: Test case 3 failed, expected 0010, got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 4: Input is 11
    PORT_ID_IN = 2'b11;
    #10;
    if (PORT_ID_OUT !== 4'b0011) begin
      $display("FAIL: Test case 4 failed, expected 0011, got %b", PORT_ID_OUT);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule