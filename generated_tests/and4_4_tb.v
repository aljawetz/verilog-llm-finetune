`timescale 1ns/1ps

module tb_and4;
  reg v, w, x, y;
  wire z;

  // Instantiate the module under test (uut)
  and4 uut (
    .z(z),
    .v(v),
    .w(w),
    .x(x),
    .y(y)
  );

  initial begin
    // Test case 1: All inputs high
    v = 1; w = 1; x = 1; y = 1;
    #10;
    if (z !== 1) begin
      $display("FAIL: Test case 1 failed, expected z=1, got z=%b", z);
      $finish;
    end

    // Test case 2: One input low
    v = 1; w = 1; x = 1; y = 0;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 2 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 3: Two inputs low
    v = 1; w = 0; x = 0; y = 1;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 3 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 4: All inputs low
    v = 0; w = 0; x = 0; y = 0;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 4 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 5: Three inputs high, one low
    v = 0; w = 1; x = 1; y = 1;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 5 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 6: Random combination
    v = 1; w = 0; x = 1; y = 0;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 6 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule