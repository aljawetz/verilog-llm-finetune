`timescale 1ns/1ps

module tb_Binary_to_onehot;

  reg [3:0] dat1;
  wire [15:0] result1;

  // Instantiate the module under test (uut)
  Binary_to_onehot uut (
    .dat1(dat1),
    .result1(result1)
  );

  initial begin
    // Test case 1: Input 0
    dat1 = 4'b0000; #10;
    if (result1 !== 16'b0000000000000001) begin
      $display("FAIL: Test case 1 failed for input 0");
      $finish;
    end

    // Test case 2: Input 1
    dat1 = 4'b0001; #10;
    if (result1 !== 16'b0000000000000010) begin
      $display("FAIL: Test case 2 failed for input 1");
      $finish;
    end

    // Test case 3: Input 2
    dat1 = 4'b0010; #10;
    if (result1 !== 16'b0000000000000100) begin
      $display("FAIL: Test case 3 failed for input 2");
      $finish;
    end

    // Test case 4: Input 3
    dat1 = 4'b0011; #10;
    if (result1 !== 16'b0000000000001000) begin
      $display("FAIL: Test case 4 failed for input 3");
      $finish;
    end

    // Test case 5: Input 4
    dat1 = 4'b0100; #10;
    if (result1 !== 16'b0000000000010000) begin
      $display("FAIL: Test case 5 failed for input 4");
      $finish;
    end

    // Test case 6: Input 5
    dat1 = 4'b0101; #10;
    if (result1 !== 16'b0000000000100000) begin
      $display("FAIL: Test case 6 failed for input 5");
      $finish;
    end

    // Test case 7: Input 6
    dat1 = 4'b0110; #10;
    if (result1 !== 16'b0000000001000000) begin
      $display("FAIL: Test case 7 failed for input 6");
      $finish;
    end

    // Test case 8: Input 7
    dat1 = 4'b0111; #10;
    if (result1 !== 16'b0000000010000000) begin
      $display("FAIL: Test case 8 failed for input 7");
      $finish;
    end

    // Test case 9: Input 8
    dat1 = 4'b1000; #10;
    if (result1 !== 16'b0000000100000000) begin
      $display("FAIL: Test case 9 failed for input 8");
      $finish;
    end

    // Test case 10: Input 9
    dat1 = 4'b1001; #10;
    if (result1 !== 16'b0000001000000000) begin
      $display("FAIL: Test case 10 failed for input 9");
      $finish;
    end

    // Test case 11: Input 10
    dat1 = 4'b1010; #10;
    if (result1 !== 16'b0000010000000000) begin
      $display("FAIL: Test case 11 failed for input 10");
      $finish;
    end

    // Test case 12: Input 11
    dat1 = 4'b1011; #10;
    if (result1 !== 16'b0000100000000000) begin
      $display("FAIL: Test case 12 failed for input 11");
      $finish;
    end

    // Test case 13: Input 12
    dat1 = 4'b1100; #10;
    if (result1 !== 16'b0001000000000000) begin
      $display("FAIL: Test case 13 failed for input 12");
      $finish;
    end

    // Test case 14: Input 13
    dat1 = 4'b1101; #10;
    if (result1 !== 16'b0010000000000000) begin
      $display("FAIL: Test case 14 failed for input 13");
      $finish;
    end

    // Test case 15: Input 14
    dat1 = 4'b1110; #10;
    if (result1 !== 16'b0100000000000000) begin
      $display("FAIL: Test case 15 failed for input 14");
      $finish;
    end

    // Test case 16: Input 15
    dat1 = 4'b1111; #10;
    if (result1 !== 16'b1000000000000000) begin
      $display("FAIL: Test case 16 failed for input 15");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule