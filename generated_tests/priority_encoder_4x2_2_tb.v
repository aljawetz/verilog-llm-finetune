`timescale 1ns/1ps

module tb_priority_encoder_4x2;

  reg [3:0] Y;
  wire [1:0] A;

  // Instantiate the module under test (uut)
  priority_encoder_4x2 uut (
    .Y(Y),
    .A(A)
  );

  initial begin
    // Test case 1: Only the highest bit is set
    Y = 4'b1000; #10;
    if (A !== 2'b11) begin
      $display("FAIL: Test case 1 failed, expected A=11, got A=%b", A);
      $finish;
    end

    // Test case 2: Second highest bit is set
    Y = 4'b0100; #10;
    if (A !== 2'b10) begin
      $display("FAIL: Test case 2 failed, expected A=10, got A=%b", A);
      $finish;
    end

    // Test case 3: Third highest bit is set
    Y = 4'b0010; #10;
    if (A !== 2'b01) begin
      $display("FAIL: Test case 3 failed, expected A=01, got A=%b", A);
      $finish;
    end

    // Test case 4: Lowest bit is set
    Y = 4'b0001; #10;
    if (A !== 2'b00) begin
      $display("FAIL: Test case 4 failed, expected A=00, got A=%b", A);
      $finish;
    end

    // Test case 5: All bits are low
    Y = 4'b0000; #10;
    if (A !== 2'b00) begin
      $display("FAIL: Test case 5 failed, expected A=00, got A=%b", A);
      $finish;
    end

    // Test case 6: Multiple bits set (highest priority should win)
    Y = 4'b0110; #10;
    if (A !== 2'b10) begin
      $display("FAIL: Test case 6 failed, expected A=10, got A=%b", A);
      $finish;
    end

    // Test case 7: Multiple bits set (highest priority should win)
    Y = 4'b1100; #10;
    if (A !== 2'b11) begin
      $display("FAIL: Test case 7 failed, expected A=11, got A=%b", A);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule