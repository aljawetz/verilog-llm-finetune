`timescale 1ns/1ps

module tb_mux_2x1;

  reg i0, i1, s0;
  wire y;

  // Instantiate the module under test (uut)
  mux_2x1 uut (
    .i0(i0),
    .i1(i1),
    .s0(s0),
    .y(y)
  );

  initial begin
    // Test case 1: s0 = 0, expect y = i0
    i0 = 1; i1 = 0; s0 = 0;
    #10;
    if (y !== 1) begin
      $display("FAIL: Test case 1 failed, expected y = 1, got y = %b", y);
      $finish;
    end

    // Test case 2: s0 = 1, expect y = i1
    i0 = 0; i1 = 1; s0 = 1;
    #10;
    if (y !== 1) begin
      $display("FAIL: Test case 2 failed, expected y = 1, got y = %b", y);
      $finish;
    end

    // Test case 3: s0 = 0, expect y = i0
    i0 = 0; i1 = 1; s0 = 0;
    #10;
    if (y !== 0) begin
      $display("FAIL: Test case 3 failed, expected y = 0, got y = %b", y);
      $finish;
    end

    // Test case 4: s0 = 1, expect y = i1
    i0 = 1; i1 = 0; s0 = 1;
    #10;
    if (y !== 0) begin
      $display("FAIL: Test case 4 failed, expected y = 0, got y = %b", y);
      $finish;
    end

    // Test case 5: s0 = 0, expect y = i0
    i0 = 1; i1 = 1; s0 = 0;
    #10;
    if (y !== 1) begin
      $display("FAIL: Test case 5 failed, expected y = 1, got y = %b", y);
      $finish;
    end

    // Test case 6: s0 = 1, expect y = i1
    i0 = 0; i1 = 1; s0 = 1;
    #10;
    if (y !== 1) begin
      $display("FAIL: Test case 6 failed, expected y = 1, got y = %b", y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule