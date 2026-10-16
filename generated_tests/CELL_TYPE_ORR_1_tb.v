`timescale 1ns/1ps

module tb_CELL_TYPE_ORR;

  parameter PARAM_WIDTH = 4; // Change this to test different widths
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN;
  wire PORT_ID_OUT;

  // Instantiate the module under test
  CELL_TYPE_ORR #(PARAM_WIDTH) uut (
    .PORT_ID_IN(PORT_ID_IN),
    .PORT_ID_OUT(PORT_ID_OUT)
  );

  initial begin
    // Test case 1: All zeros
    PORT_ID_IN = 4'b0000;
    #10;
    if (PORT_ID_OUT !== 1'b0) begin
      $display("FAIL: Test case 1 failed, expected 0, got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 2: One bit set
    PORT_ID_IN = 4'b0001;
    #10;
    if (PORT_ID_OUT !== 1'b1) begin
      $display("FAIL: Test case 2 failed, expected 1, got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 3: Multiple bits set
    PORT_ID_IN = 4'b1010;
    #10;
    if (PORT_ID_OUT !== 1'b1) begin
      $display("FAIL: Test case 3 failed, expected 1, got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 4: All ones
    PORT_ID_IN = 4'b1111;
    #10;
    if (PORT_ID_OUT !== 1'b1) begin
      $display("FAIL: Test case 4 failed, expected 1, got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 5: All zeros again
    PORT_ID_IN = 4'b0000;
    #10;
    if (PORT_ID_OUT !== 1'b0) begin
      $display("FAIL: Test case 5 failed, expected 0, got %b", PORT_ID_OUT);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule