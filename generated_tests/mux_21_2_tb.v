`timescale 1ns/1ps

module tb_mux_21;

  reg s;
  reg I;
  wire y;

  // Instantiate the module under test (uut)
  mux_21 uut (
    .s(s),
    .I(I),
    .y(y)
  );

  initial begin
    // Test case 1: s = 0, I = 0
    s = 0; I = 0;
    #10;
    if (y !== 0) begin
      $display("FAIL: Test case 1 failed, expected y = 0, got y = %b", y);
      $finish;
    end

    // Test case 2: s = 0, I = 1
    s = 0; I = 1;
    #10;
    if (y !== 0) begin
      $display("FAIL: Test case 2 failed, expected y = 0, got y = %b", y);
      $finish;
    end

    // Test case 3: s = 1, I = 0
    s = 1; I = 0;
    #10;
    if (y !== 0) begin
      $display("FAIL: Test case 3 failed, expected y = 0, got y = %b", y);
      $finish;
    end

    // Test case 4: s = 1, I = 1
    s = 1; I = 1;
    #10;
    if (y !== 1) begin
      $display("FAIL: Test case 4 failed, expected y = 1, got y = %b", y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule