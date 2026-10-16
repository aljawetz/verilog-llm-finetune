`timescale 1ns/1ps

module tb_CLA_8;
  reg [7:0] in1;
  reg [7:0] in2;
  wire [7:0] sum;
  wire cout;

  CLA_8 uut (
    .sum(sum),
    .cout(cout),
    .in1(in1),
    .in2(in2)
  );

  initial begin
    // Test case 1: 0 + 0 = 0
    in1 = 8'b00000000; 
    in2 = 8'b00000000; 
    #10;
    if (sum !== 8'b00000000 || cout !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: 1 + 1 = 2
    in1 = 8'b00000001; 
    in2 = 8'b00000001; 
    #10;
    if (sum !== 8'b00000010 || cout !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: 255 + 1 = 0 with carry
    in1 = 8'b11111111; 
    in2 = 8'b00000001; 
    #10;
    if (sum !== 8'b00000000 || cout !== 1'b1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: 15 + 16 = 31
    in1 = 8'b00001111; 
    in2 = 8'b00010000; 
    #10;
    if (sum !== 8'b00011111 || cout !== 1'b0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: 127 + 128 = 255
    in1 = 8'b01111111; 
    in2 = 8'b10000000; 
    #10;
    if (sum !== 8'b11111111 || cout !== 1'b0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: 100 + 100 = 200
    in1 = 8'b01100100; 
    in2 = 8'b01100100; 
    #10;
    if (sum !== 8'b11001000 || cout !== 1'b0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: 64 + 64 = 128
    in1 = 8'b01000000; 
    in2 = 8'b01000000; 
    #10;
    if (sum !== 8'b10000000 || cout !== 1'b0) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: 32 + 32 = 64
    in1 = 8'b00100000; 
    in2 = 8'b00100000; 
    #10;
    if (sum !== 8'b01000000 || cout !== 1'b0) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule