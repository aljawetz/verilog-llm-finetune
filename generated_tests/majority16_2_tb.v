`timescale 1ns/1ps

module tb_majority16;

  reg [15:0] Data;
  wire Out;
  
  // Instantiate the module under test
  majority16 uut (
    .Out(Out),
    .Data(Data)
  );

  initial begin
    // Test case 1: Majority is not reached (8 bits set)
    Data = 16'b0000000000000000; // 0 bits set
    #10;
    if (Out !== 0) begin
      $display("FAIL: Test case 1 failed, expected Out = 0, got Out = %b", Out);
      $finish;
    end

    // Test case 2: Majority is not reached (8 bits set)
    Data = 16'b1111111100000000; // 8 bits set
    #10;
    if (Out !== 0) begin
      $display("FAIL: Test case 2 failed, expected Out = 0, got Out = %b", Out);
      $finish;
    end

    // Test case 3: Majority is reached (9 bits set)
    Data = 16'b1111111110000000; // 9 bits set
    #10;
    if (Out !== 1) begin
      $display("FAIL: Test case 3 failed, expected Out = 1, got Out = %b", Out);
      $finish;
    end

    // Test case 4: Majority is reached (10 bits set)
    Data = 16'b1111111111000000; // 10 bits set
    #10;
    if (Out !== 1) begin
      $display("FAIL: Test case 4 failed, expected Out = 1, got Out = %b", Out);
      $finish;
    end

    // Test case 5: Majority is reached (15 bits set)
    Data = 16'b1111111111111110; // 15 bits set
    #10;
    if (Out !== 1) begin
      $display("FAIL: Test case 5 failed, expected Out = 1, got Out = %b", Out);
      $finish;
    end

    // Test case 6: Majority is not reached (7 bits set)
    Data = 16'b1111111000000000; // 7 bits set
    #10;
    if (Out !== 0) begin
      $display("FAIL: Test case 6 failed, expected Out = 0, got Out = %b", Out);
      $finish;
    end

    // Test case 7: Majority is reached (8 bits set, but one more)
    Data = 16'b1111111111111111; // 16 bits set
    #10;
    if (Out !== 1) begin
      $display("FAIL: Test case 7 failed, expected Out = 1, got Out = %b", Out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule