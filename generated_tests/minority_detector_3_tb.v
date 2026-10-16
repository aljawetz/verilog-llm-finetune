`timescale 1ns/1ps

module tb_minority_detector;

  reg a;
  reg b;
  reg c;
  wire detected_output;

  // Instantiate the module under test (uut)
  minority_detector uut (
    .a(a),
    .b(b),
    .c(c),
    .detected_output(detected_output)
  );

  initial begin
    // Test case 1: All inputs low
    a = 0; b = 0; c = 0; #10;
    if (detected_output !== 1) begin
      $display("FAIL: Test case 1 failed (000)");
      $finish;
    end

    // Test case 2: One input high
    a = 1; b = 0; c = 0; #10;
    if (detected_output !== 1) begin
      $display("FAIL: Test case 2 failed (100)");
      $finish;
    end

    // Test case 3: One input high
    a = 0; b = 1; c = 0; #10;
    if (detected_output !== 1) begin
      $display("FAIL: Test case 3 failed (010)");
      $finish;
    end

    // Test case 4: One input high
    a = 0; b = 0; c = 1; #10;
    if (detected_output !== 1) begin
      $display("FAIL: Test case 4 failed (001)");
      $finish;
    end

    // Test case 5: Two inputs high
    a = 1; b = 1; c = 0; #10;
    if (detected_output !== 0) begin
      $display("FAIL: Test case 5 failed (110)");
      $finish;
    end

    // Test case 6: Two inputs high
    a = 1; b = 0; c = 1; #10;
    if (detected_output !== 0) begin
      $display("FAIL: Test case 6 failed (101)");
      $finish;
    end

    // Test case 7: Two inputs high
    a = 0; b = 1; c = 1; #10;
    if (detected_output !== 0) begin
      $display("FAIL: Test case 7 failed (011)");
      $finish;
    end

    // Test case 8: All inputs high
    a = 1; b = 1; c = 1; #10;
    if (detected_output !== 0) begin
      $display("FAIL: Test case 8 failed (111)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule