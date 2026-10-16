`timescale 1ns/1ps

module tb_decoder_behav;
  reg [2:0] a;
  wire [7:0] y;

  // Instantiate the module under test (uut)
  decoder_behav uut (
    .a(a),
    .y(y)
  );

  initial begin
    // Test case 1: Check output for input 3'b000
    a = 3'b000; #10;
    if (y !== 8'b00000001) begin
      $display("FAIL: Test case 1 failed for input 3'b000");
      $finish;
    end

    // Test case 2: Check output for input 3'b001
    a = 3'b001; #10;
    if (y !== 8'b00000010) begin
      $display("FAIL: Test case 2 failed for input 3'b001");
      $finish;
    end

    // Test case 3: Check output for input 3'b010
    a = 3'b010; #10;
    if (y !== 8'b00000100) begin
      $display("FAIL: Test case 3 failed for input 3'b010");
      $finish;
    end

    // Test case 4: Check output for input 3'b011
    a = 3'b011; #10;
    if (y !== 8'b00001000) begin
      $display("FAIL: Test case 4 failed for input 3'b011");
      $finish;
    end

    // Test case 5: Check output for input 3'b100
    a = 3'b100; #10;
    if (y !== 8'b00010000) begin
      $display("FAIL: Test case 5 failed for input 3'b100");
      $finish;
    end

    // Test case 6: Check output for input 3'b101
    a = 3'b101; #10;
    if (y !== 8'b00100000) begin
      $display("FAIL: Test case 6 failed for input 3'b101");
      $finish;
    end

    // Test case 7: Check output for input 3'b110
    a = 3'b110; #10;
    if (y !== 8'b01000000) begin
      $display("FAIL: Test case 7 failed for input 3'b110");
      $finish;
    end

    // Test case 8: Check output for input 3'b111
    a = 3'b111; #10;
    if (y !== 8'b10000000) begin
      $display("FAIL: Test case 8 failed for input 3'b111");
      $finish;
    end

    // Test case 9: Check output for an invalid input (default case)
    a = 3'bxxx; #10; // Invalid input
    if (y !== 8'b00000000) begin
      $display("FAIL: Test case 9 failed for invalid input 3'bxxx");
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule