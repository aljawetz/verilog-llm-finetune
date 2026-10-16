`timescale 1ns/1ps

module tb_CELL_TYPE_LSHR;

  parameter PARAM_WIDTH = 8;
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN0;
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN1;
  wire [PARAM_WIDTH - 1 : 0] PORT_ID_OUT;

  // Instantiate the module under test (uut)
  CELL_TYPE_LSHR #(PARAM_WIDTH) uut (
    .PORT_ID_IN0(PORT_ID_IN0),
    .PORT_ID_IN1(PORT_ID_IN1),
    .PORT_ID_OUT(PORT_ID_OUT)
  );

  initial begin
    // Test case 1: Shift by 0
    PORT_ID_IN0 = 8'b10101010; // 0xAA
    PORT_ID_IN1 = 8'b00000000; // Shift by 0
    #10;
    if (PORT_ID_OUT !== 8'b10101010) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Shift by 1
    PORT_ID_IN0 = 8'b10101010; // 0xAA
    PORT_ID_IN1 = 8'b00000001; // Shift by 1
    #10;
    if (PORT_ID_OUT !== 8'b01010101) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Shift by 2
    PORT_ID_IN0 = 8'b10101010; // 0xAA
    PORT_ID_IN1 = 8'b00000010; // Shift by 2
    #10;
    if (PORT_ID_OUT !== 8'b00101010) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Shift by 3
    PORT_ID_IN0 = 8'b10101010; // 0xAA
    PORT_ID_IN1 = 8'b00000011; // Shift by 3
    #10;
    if (PORT_ID_OUT !== 8'b00010101) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Shift by 7
    PORT_ID_IN0 = 8'b10101010; // 0xAA
    PORT_ID_IN1 = 8'b00000111; // Shift by 7
    #10;
    if (PORT_ID_OUT !== 8'b00000001) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: Shift by 8 (should result in 0)
    PORT_ID_IN0 = 8'b10101010; // 0xAA
    PORT_ID_IN1 = 8'b00001000; // Shift by 8
    #10;
    if (PORT_ID_OUT !== 8'b00000000) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: Shift by more than width (should still result in 0)
    PORT_ID_IN0 = 8'b10101010; // 0xAA
    PORT_ID_IN1 = 8'b00001111; // Shift by 15
    #10;
    if (PORT_ID_OUT !== 8'b00000000) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule