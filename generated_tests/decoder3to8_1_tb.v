`timescale 1ns/1ps

module tb_decoder3to8;

  reg [2:0] Data_in;
  reg en;
  wire [7:0] Data_out;

  // Instantiate the module under test (uut)
  decoder3to8 uut (
    .Data_in(Data_in),
    .en(en),
    .Data_out(Data_out)
  );

  initial begin
    // Test case 1: Enable decoder with input 000
    en = 1;
    Data_in = 3'b000;
    #10;
    if (Data_out !== 8'b00000001) begin
      $display("FAIL: Test case 1 failed. Expected 00000001, got %b", Data_out);
      $finish;
    end

    // Test case 2: Enable decoder with input 001
    Data_in = 3'b001;
    #10;
    if (Data_out !== 8'b00000010) begin
      $display("FAIL: Test case 2 failed. Expected 00000010, got %b", Data_out);
      $finish;
    end

    // Test case 3: Enable decoder with input 010
    Data_in = 3'b010;
    #10;
    if (Data_out !== 8'b00000100) begin
      $display("FAIL: Test case 3 failed. Expected 00000100, got %b", Data_out);
      $finish;
    end

    // Test case 4: Enable decoder with input 011
    Data_in = 3'b011;
    #10;
    if (Data_out !== 8'b00001000) begin
      $display("FAIL: Test case 4 failed. Expected 00001000, got %b", Data_out);
      $finish;
    end

    // Test case 5: Enable decoder with input 100
    Data_in = 3'b100;
    #10;
    if (Data_out !== 8'b00010000) begin
      $display("FAIL: Test case 5 failed. Expected 00010000, got %b", Data_out);
      $finish;
    end

    // Test case 6: Enable decoder with input 101
    Data_in = 3'b101;
    #10;
    if (Data_out !== 8'b00100000) begin
      $display("FAIL: Test case 6 failed. Expected 00100000, got %b", Data_out);
      $finish;
    end

    // Test case 7: Enable decoder with input 110
    Data_in = 3'b110;
    #10;
    if (Data_out !== 8'b01000000) begin
      $display("FAIL: Test case 7 failed. Expected 01000000, got %b", Data_out);
      $finish;
    end

    // Test case 8: Enable decoder with input 111
    Data_in = 3'b111;
    #10;
    if (Data_out !== 8'b10000000) begin
      $display("FAIL: Test case 8 failed. Expected 10000000, got %b", Data_out);
      $finish;
    end

    // Test case 9: Disable decoder
    en = 0;
    Data_in = 3'b101; // Input should not matter when disabled
    #10;
    if (Data_out !== 8'b00000000) begin
      $display("FAIL: Test case 9 failed. Expected 00000000, got %b", Data_out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule