`timescale 1ns/1ps

module tb_encode_shift_module;

  reg [7:0] iu_shift_e;
  wire [2:0] encod_shift_e;

  // Instantiate the module under test (uut)
  encode_shift_module uut (
    .iu_shift_e(iu_shift_e),
    .encod_shift_e(encod_shift_e)
  );

  initial begin
    // Test case 1: Check for input 8'b00000001 (should match 8'b0000000x)
    iu_shift_e = 8'b00000001; #10;
    if (encod_shift_e !== 3'b000) begin
      $display("FAIL: Expected 3'b000 for input 8'b00000001, got %b", encod_shift_e);
      $finish;
    end

    // Test case 2: Check for input 8'b00000010
    iu_shift_e = 8'b00000010; #10;
    if (encod_shift_e !== 3'b001) begin
      $display("FAIL: Expected 3'b001 for input 8'b00000010, got %b", encod_shift_e);
      $finish;
    end

    // Test case 3: Check for input 8'b00000100
    iu_shift_e = 8'b00000100; #10;
    if (encod_shift_e !== 3'b010) begin
      $display("FAIL: Expected 3'b010 for input 8'b00000100, got %b", encod_shift_e);
      $finish;
    end

    // Test case 4: Check for input 8'b00001000
    iu_shift_e = 8'b00001000; #10;
    if (encod_shift_e !== 3'b011) begin
      $display("FAIL: Expected 3'b011 for input 8'b00001000, got %b", encod_shift_e);
      $finish;
    end

    // Test case 5: Check for input 8'b00010000
    iu_shift_e = 8'b00010000; #10;
    if (encod_shift_e !== 3'b100) begin
      $display("FAIL: Expected 3'b100 for input 8'b00010000, got %b", encod_shift_e);
      $finish;
    end

    // Test case 6: Check for input 8'b00100000
    iu_shift_e = 8'b00100000; #10;
    if (encod_shift_e !== 3'b101) begin
      $display("FAIL: Expected 3'b101 for input 8'b00100000, got %b", encod_shift_e);
      $finish;
    end

    // Test case 7: Check for input 8'b01000000
    iu_shift_e = 8'b01000000; #10;
    if (encod_shift_e !== 3'b110) begin
      $display("FAIL: Expected 3'b110 for input 8'b01000000, got %b", encod_shift_e);
      $finish;
    end

    // Test case 8: Check for input 8'b10000000
    iu_shift_e = 8'b10000000; #10;
    if (encod_shift_e !== 3'b111) begin
      $display("FAIL: Expected 3'b111 for input 8'b10000000, got %b", encod_shift_e);
      $finish;
    end

    // Test case 9: Check for input 8'b00000000 (should match 8'b0000000x)
    iu_shift_e = 8'b00000000; #10;
    if (encod_shift_e !== 3'b000) begin
      $display("FAIL: Expected 3'b000 for input 8'b00000000, got %b", encod_shift_e);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule