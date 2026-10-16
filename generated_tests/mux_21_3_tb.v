`timescale 1ns/1ps

module tb_mux_21;

  reg [1:0] a;
  reg s;
  wire y;

  // Instantiate the module under test (uut)
  mux_21 uut (
    .a(a),
    .s(s),
    .y(y)
  );

  initial begin
    // Test case 1: s = 0, expect y = a[0]
    a = 2'b01; s = 0; #10;
    if (y !== a[0]) begin
      $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", a[0], y);
      $finish;
    end

    // Test case 2: s = 1, expect y = a[1]
    a = 2'b10; s = 1; #10;
    if (y !== a[1]) begin
      $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", a[1], y);
      $finish;
    end

    // Test case 3: s = 0, expect y = a[0]
    a = 2'b11; s = 0; #10;
    if (y !== a[0]) begin
      $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", a[0], y);
      $finish;
    end

    // Test case 4: s = 1, expect y = a[1]
    a = 2'b00; s = 1; #10;
    if (y !== a[1]) begin
      $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", a[1], y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule