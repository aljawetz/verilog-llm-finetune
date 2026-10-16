`timescale 1ns/1ps

module tb_CELL_TYPE_PORT;

  parameter PARAM_OUT_WIDTH = 8;
  
  reg [PARAM_OUT_WIDTH - 1 : 0] PORT_ID_IN;
  wire [PARAM_OUT_WIDTH - 1 : 0] PORT_ID_OUT;

  // Instantiate the module under test (uut)
  CELL_TYPE_PORT #(0, PARAM_OUT_WIDTH) uut (
    .PORT_ID_IN(PORT_ID_IN),
    .PORT_ID_OUT(PORT_ID_OUT)
  );

  initial begin
    // Test sequence
    PORT_ID_IN = 8'b00000000; // Test with all zeros
    #10;
    if (PORT_ID_OUT !== PORT_ID_IN) begin
      $display("FAIL: Output does not match input for all zeros");
      $finish;
    end

    PORT_ID_IN = 8'b11111111; // Test with all ones
    #10;
    if (PORT_ID_OUT !== PORT_ID_IN) begin
      $display("FAIL: Output does not match input for all ones");
      $finish;
    end

    PORT_ID_IN = 8'b10101010; // Test with alternating bits
    #10;
    if (PORT_ID_OUT !== PORT_ID_IN) begin
      $display("FAIL: Output does not match input for alternating bits");
      $finish;
    end

    PORT_ID_IN = 8'b01010101; // Test with another pattern
    #10;
    if (PORT_ID_OUT !== PORT_ID_IN) begin
      $display("FAIL: Output does not match input for another pattern");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule