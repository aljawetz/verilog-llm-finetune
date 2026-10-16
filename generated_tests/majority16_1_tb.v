`timescale 1ns/1ps

module tb_majority16;

  reg [15:0] Data;
  wire Out;
  
  // Instantiate the module under test (uut)
  majority16 uut (
    .Data(Data),
    .Out(Out)
  );

  initial begin
    // Test case 1: Majority is present (10 ones)
    Data = 16'b1111111111000000; // 10 ones
    #10;
    if (Out !== 1) begin
      $display("FAIL: Test case 1 failed, expected Out=1, got Out=%b", Out);
      $finish;
    end

    // Test case 2: Majority is present (9 ones)
    Data = 16'b1111111110000000; // 9 ones
    #10;
    if (Out !== 1) begin
      $display("FAIL: Test case 2 failed, expected Out=1, got Out=%b", Out);
      $finish;
    end

    // Test case 3: No majority (8 ones)
    Data = 16'b1111111100000000; // 8 ones
    #10;
    if (Out !== 0) begin
      $display("FAIL: Test case 3 failed, expected Out=0, got Out=%b", Out);
      $finish;
    end

    // Test case 4: No majority (7 ones)
    Data = 16'b1111111000000000; // 7 ones
    #10;
    if (Out !== 0) begin
      $display("FAIL: Test case 4 failed, expected Out=0, got Out=%b", Out);
      $finish;
    end

    // Test case 5: All zeros
    Data = 16'b0000000000000000; // 0 ones
    #10;
    if (Out !== 0) begin
      $display("FAIL: Test case 5 failed, expected Out=0, got Out=%b", Out);
      $finish;
    end

    // Test case 6: All ones
    Data = 16'b1111111111111111; // 16 ones
    #10;
    if (Out !== 1) begin
      $display("FAIL: Test case 6 failed, expected Out=1, got Out=%b", Out);
      $finish;
    end

    // Test case 7: Exactly 8 ones and 8 zeros
    Data = 16'b1111111100000000; // 8 ones
    #10;
    if (Out !== 0) begin
      $display("FAIL: Test case 7 failed, expected Out=0, got Out=%b", Out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule