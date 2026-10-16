`timescale 1ns/1ps

module tb_CELL_TYPE_NOT;

  parameter PARAM_WIDTH = 8;
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN;
  wire [PARAM_WIDTH - 1 : 0] PORT_ID_OUT;

  // Instantiate the module under test (uut)
  CELL_TYPE_NOT #(PARAM_WIDTH) uut (
    .PORT_ID_IN(PORT_ID_IN),
    .PORT_ID_OUT(PORT_ID_OUT)
  );

  initial begin
    // Test case 1: All bits 0
    PORT_ID_IN = 8'b00000000;
    #10;
    if (PORT_ID_OUT !== 8'b11111111) begin
      $display("FAIL: Test case 1 failed. Expected 11111111, got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 2: All bits 1
    PORT_ID_IN = 8'b11111111;
    #10;
    if (PORT_ID_OUT !== 8'b00000000) begin
      $display("FAIL: Test case 2 failed. Expected 00000000, got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 3: Alternating bits
    PORT_ID_IN = 8'b10101010;
    #10;
    if (PORT_ID_OUT !== 8'b01010101) begin
      $display("FAIL: Test case 3 failed. Expected 01010101, got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 4: Random bits
    PORT_ID_IN = 8'b11001100;
    #10;
    if (PORT_ID_OUT !== 8'b00110011) begin
      $display("FAIL: Test case 4 failed. Expected 00110011, got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 5: All bits 0xAA
    PORT_ID_IN = 8'b10101010;
    #10;
    if (PORT_ID_OUT !== 8'b01010101) begin
      $display("FAIL: Test case 5 failed. Expected 01010101, got %b", PORT_ID_OUT);
      $finish;
    end

    // Test case 6: All bits 0x55
    PORT_ID_IN = 8'b01010101;
    #10;
    if (PORT_ID_OUT !== 8'b10101010) begin
      $display("FAIL: Test case 6 failed. Expected 10101010, got %b", PORT_ID_OUT);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule