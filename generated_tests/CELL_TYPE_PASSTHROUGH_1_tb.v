`timescale 1ns/1ps

module tb_CELL_TYPE_PASSTHROUGH;

  parameter PARAM_WIDTH = 8;
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN;
  wire [PARAM_WIDTH - 1 : 0] PORT_ID_OUT;

  // Instantiate the module under test (uut)
  CELL_TYPE_PASSTHROUGH #(PARAM_WIDTH) uut (
    .PORT_ID_IN(PORT_ID_IN),
    .PORT_ID_OUT(PORT_ID_OUT)
  );

  // Clock and reset signals
  reg clk;
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  initial begin
    // Test sequence
    PORT_ID_IN = 8'b00000000; // Test case 1: all zeros
    #10;
    if (PORT_ID_OUT !== PORT_ID_IN) begin
      $display("FAIL: Output does not match input for all zeros");
      $finish;
    end

    PORT_ID_IN = 8'b11111111; // Test case 2: all ones
    #10;
    if (PORT_ID_OUT !== PORT_ID_IN) begin
      $display("FAIL: Output does not match input for all ones");
      $finish;
    end

    PORT_ID_IN = 8'b10101010; // Test case 3: alternating bits
    #10;
    if (PORT_ID_OUT !== PORT_ID_IN) begin
      $display("FAIL: Output does not match input for alternating bits");
      $finish;
    end

    PORT_ID_IN = 8'b01010101; // Test case 4: another pattern
    #10;
    if (PORT_ID_OUT !== PORT_ID_IN) begin
      $display("FAIL: Output does not match input for another pattern");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule