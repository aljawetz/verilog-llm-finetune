`timescale 1ns/1ps

module tb_CELL_TYPE_MUL;

  parameter PARAM_WIDTH = 4; // Change this as needed for testing
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN0;
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN1;
  wire [PARAM_WIDTH - 1 : 0] PORT_ID_OUT;

  // Instantiate the module under test
  CELL_TYPE_MUL #(PARAM_WIDTH) uut (
    .PORT_ID_IN0(PORT_ID_IN0),
    .PORT_ID_IN1(PORT_ID_IN1),
    .PORT_ID_OUT(PORT_ID_OUT)
  );

  initial begin
    // Test case 1: 2 * 3 = 6
    PORT_ID_IN0 = 4'b0010; // 2
    PORT_ID_IN1 = 4'b0011; // 3
    #10;
    if (PORT_ID_OUT !== 4'b0110) begin
      $display("FAIL: Test case 1 failed, expected 6 but got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 2: 4 * 5 = 20
    PORT_ID_IN0 = 4'b0100; // 4
    PORT_ID_IN1 = 4'b0101; // 5
    #10;
    if (PORT_ID_OUT !== 4'b10100) begin
      $display("FAIL: Test case 2 failed, expected 20 but got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 3: 0 * 7 = 0
    PORT_ID_IN0 = 4'b0000; // 0
    PORT_ID_IN1 = 4'b0111; // 7
    #10;
    if (PORT_ID_OUT !== 4'b0000) begin
      $display("FAIL: Test case 3 failed, expected 0 but got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 4: 6 * 6 = 36
    PORT_ID_IN0 = 4'b0110; // 6
    PORT_ID_IN1 = 4'b0110; // 6
    #10;
    if (PORT_ID_OUT !== 4'b100100) begin
      $display("FAIL: Test case 4 failed, expected 36 but got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 5: 3 * 3 = 9
    PORT_ID_IN0 = 4'b0011; // 3
    PORT_ID_IN1 = 4'b0011; // 3
    #10;
    if (PORT_ID_OUT !== 4'b1001) begin
      $display("FAIL: Test case 5 failed, expected 9 but got %b", PORT_ID_OUT);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule