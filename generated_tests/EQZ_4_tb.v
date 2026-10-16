`timescale 1ns/1ps

module tb_EQZ;

  reg [15:0] data;
  wire eqz;

  // Instantiate the module under test (uut)
  EQZ uut (
    .eqz(eqz),
    .data(data)
  );

  initial begin
    // Test case 1: Check when data is 0
    data = 16'b0000000000000000; // data = 0
    #10;
    if (eqz !== 1'b1) begin
      $display("FAIL: Test case 1 failed, expected eqz = 1 for data = 0");
      $finish;
    end

    // Test case 2: Check when data is non-zero
    data = 16'b0000000000000001; // data = 1
    #10;
    if (eqz !== 1'b0) begin
      $display("FAIL: Test case 2 failed, expected eqz = 0 for data = 1");
      $finish;
    end

    // Test case 3: Check when data is a large number
    data = 16'b0111111111111111; // data = 32767
    #10;
    if (eqz !== 1'b0) begin
      $display("FAIL: Test case 3 failed, expected eqz = 0 for data = 32767");
      $finish;
    end

    // Test case 4: Check when data is another non-zero value
    data = 16'b1111111111111111; // data = 65535
    #10;
    if (eqz !== 1'b0) begin
      $display("FAIL: Test case 4 failed, expected eqz = 0 for data = 65535");
      $finish;
    end

    // Test case 5: Check when data is again 0
    data = 16'b0000000000000000; // data = 0
    #10;
    if (eqz !== 1'b1) begin
      $display("FAIL: Test case 5 failed, expected eqz = 1 for data = 0");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule