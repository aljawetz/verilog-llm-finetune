`timescale 1ns/1ps

module tb_mux_2x1;

  // Inputs
  reg m0;
  reg m1;
  reg s;

  // Output
  wire y;

  // Instantiate the Unit Under Test (UUT)
  mux_2x1 uut (
    .m0(m0),
    .m1(m1),
    .s(s),
    .y(y)
  );

  initial begin
    // Initialize Inputs
    m0 = 0;
    m1 = 0;
    s = 0;

    // Test case 1: s = 0, expect y = m0
    m0 = 1; m1 = 0; s = 0; #10;
    if (y !== 1) begin
      $display("FAIL: Test case 1 failed, expected y = 1, got y = %b", y);
      $finish;
    end

    // Test case 2: s = 0, expect y = m0
    m0 = 0; m1 = 1; s = 0; #10;
    if (y !== 0) begin
      $display("FAIL: Test case 2 failed, expected y = 0, got y = %b", y);
      $finish;
    end

    // Test case 3: s = 1, expect y = m1
    m0 = 1; m1 = 0; s = 1; #10;
    if (y !== 0) begin
      $display("FAIL: Test case 3 failed, expected y = 0, got y = %b", y);
      $finish;
    end

    // Test case 4: s = 1, expect y = m1
    m0 = 0; m1 = 1; s = 1; #10;
    if (y !== 1) begin
      $display("FAIL: Test case 4 failed, expected y = 1, got y = %b", y);
      $finish;
    end

    // Test case 5: s = 0, m0 = 0, m1 = 0, expect y = 0
    m0 = 0; m1 = 0; s = 0; #10;
    if (y !== 0) begin
      $display("FAIL: Test case 5 failed, expected y = 0, got y = %b", y);
      $finish;
    end

    // Test case 6: s = 1, m0 = 0, m1 = 0, expect y = 0
    m0 = 0; m1 = 0; s = 1; #10;
    if (y !== 0) begin
      $display("FAIL: Test case 6 failed, expected y = 0, got y = %b", y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule