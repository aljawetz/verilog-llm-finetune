`timescale 1ns/1ps

module tb_comparator1bit;

  reg a;
  reg b;
  wire gt;
  wire eq;
  wire lt;

  // Instantiate the module under test (uut)
  comparator1bit uut (
    .a(a),
    .b(b),
    .gt(gt),
    .eq(eq),
    .lt(lt)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (gt !== 0 || eq !== 0 || lt !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (gt !== 0 || eq !== 1 || lt !== 1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (gt !== 1 || eq !== 1 || lt !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (gt !== 0 || eq !== 0 || lt !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule