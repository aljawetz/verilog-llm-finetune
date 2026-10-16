`timescale 1ns/1ps

module tb_decoder_38;

  reg [2:0] in;
  reg en;
  wire [7:0] out;

  // Instantiate the module under test (uut)
  decoder_38 uut (
    .in(in),
    .out(out),
    .en(en)
  );

  initial begin
    // Initialize inputs
    en = 0;
    in = 3'b000;

    // Test case 1: Enable decoder and check output for in = 000
    en = 1;
    in = 3'b000;
    #10;
    if (out !== 8'b00000001) begin
      $display("FAIL: Test case 1 failed for input 000");
      $finish;
    end

    // Test case 2: Check output for in = 001
    in = 3'b001;
    #10;
    if (out !== 8'b00000010) begin
      $display("FAIL: Test case 2 failed for input 001");
      $finish;
    end

    // Test case 3: Check output for in = 010
    in = 3'b010;
    #10;
    if (out !== 8'b00000100) begin
      $display("FAIL: Test case 3 failed for input 010");
      $finish;
    end

    // Test case 4: Check output for in = 011
    in = 3'b011;
    #10;
    if (out !== 8'b00001000) begin
      $display("FAIL: Test case 4 failed for input 011");
      $finish;
    end

    // Test case 5: Check output for in = 100
    in = 3'b100;
    #10;
    if (out !== 8'b00010000) begin
      $display("FAIL: Test case 5 failed for input 100");
      $finish;
    end

    // Test case 6: Check output for in = 101
    in = 3'b101;
    #10;
    if (out !== 8'b00100000) begin
      $display("FAIL: Test case 6 failed for input 101");
      $finish;
    end

    // Test case 7: Check output for in = 110
    in = 3'b110;
    #10;
    if (out !== 8'b01000000) begin
      $display("FAIL: Test case 7 failed for input 110");
      $finish;
    end

    // Test case 8: Check output for in = 111
    in = 3'b111;
    #10;
    if (out !== 8'b10000000) begin
      $display("FAIL: Test case 8 failed for input 111");
      $finish;
    end

    // Test case 9: Disable decoder and check output
    en = 0;
    in = 3'b101; // arbitrary input
    #10;
    if (out !== 8'b00000000) begin
      $display("FAIL: Test case 9 failed when disabled");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule