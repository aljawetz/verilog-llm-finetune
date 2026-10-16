`timescale 1ns/1ps

module tb_CELL_TYPE_ANDR;

  parameter PARAM_WIDTH = 4;
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN;
  wire [0 : 0] PORT_ID_OUT;

  // Instantiate the module under test (uut)
  CELL_TYPE_ANDR #(PARAM_WIDTH) uut (
    .PORT_ID_IN(PORT_ID_IN),
    .PORT_ID_OUT(PORT_ID_OUT)
  );

  initial begin
    // Test case 1: All bits are high
    PORT_ID_IN = 4'b1111; // Expect PORT_ID_OUT = 1
    #10;
    if (PORT_ID_OUT !== 1'b1) begin
      $display("FAIL: Test case 1 failed, expected 1 but got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 2: One bit is low
    PORT_ID_IN = 4'b1110; // Expect PORT_ID_OUT = 0
    #10;
    if (PORT_ID_OUT !== 1'b0) begin
      $display("FAIL: Test case 2 failed, expected 0 but got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 3: All bits are low
    PORT_ID_IN = 4'b0000; // Expect PORT_ID_OUT = 0
    #10;
    if (PORT_ID_OUT !== 1'b0) begin
      $display("FAIL: Test case 3 failed, expected 0 but got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 4: Mixed bits
    PORT_ID_IN = 4'b1011; // Expect PORT_ID_OUT = 0
    #10;
    if (PORT_ID_OUT !== 1'b0) begin
      $display("FAIL: Test case 4 failed, expected 0 but got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 5: All bits are high again
    PORT_ID_IN = 4'b1111; // Expect PORT_ID_OUT = 1
    #10;
    if (PORT_ID_OUT !== 1'b1) begin
      $display("FAIL: Test case 5 failed, expected 1 but got %b", PORT_ID_OUT);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule