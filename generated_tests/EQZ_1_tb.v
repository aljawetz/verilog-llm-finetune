`timescale 1ns/1ps

module tb_EQZ;

  reg [15:0] data;
  wire eqz;

  // Instantiate the module under test (uut)
  EQZ uut (
    .data(data),
    .eqz(eqz)
  );

  initial begin
    // Test case 1: Check when data is zero
    data = 16'b0000000000000000; // 0
    #10;
    if (eqz !== 1'b1) begin
      $display("FAIL: Test case 1 failed, expected eqz = 1 for data = 0");
      $finish;
    end

    // Test case 2: Check when data is non-zero
    data = 16'b0000000000000001; // 1
    #10;
    if (eqz !== 1'b0) begin
      $display("FAIL: Test case 2 failed, expected eqz = 0 for data = 1");
      $finish;
    end

    // Test case 3: Check when data is negative (two's complement)
    data = 16'b1111111111111111; // -1
    #10;
    if (eqz !== 1'b0) begin
      $display("FAIL: Test case 3 failed, expected eqz = 0 for data = -1");
      $finish;
    end

    // Test case 4: Check when data is a positive number
    data = 16'b0000000000000010; // 2
    #10;
    if (eqz !== 1'b0) begin
      $display("FAIL: Test case 4 failed, expected eqz = 0 for data = 2");
      $finish;
    end

    // Test case 5: Check when data is a large positive number
    data = 16'b0111111111111111; // 32767
    #10;
    if (eqz !== 1'b0) begin
      $display("FAIL: Test case 5 failed, expected eqz = 0 for data = 32767");
      $finish;
    end

    // Test case 6: Check when data is a large negative number
    data = 16'b1000000000000000; // -32768
    #10;
    if (eqz !== 1'b0) begin
      $display("FAIL: Test case 6 failed, expected eqz = 0 for data = -32768");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule