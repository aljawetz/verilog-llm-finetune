`timescale 1ns/1ps

module tb_mux_2x1;

  reg [3:0] a;
  reg [3:0] b;
  reg s;
  wire [3:0] y;

  // Instantiate the module under test (uut)
  mux_2x1 uut (
    .a(a),
    .b(b),
    .s(s),
    .y(y)
  );

  initial begin
    // Test case 1: s = 0, expect y = a
    a = 4'b1010; // a = 10
    b = 4'b0101; // b = 5
    s = 0;      // select a
    #10;        // wait for 10 time units
    if (y !== a) begin
      $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", a, y);
      $finish;
    end

    // Test case 2: s = 1, expect y = b
    a = 4'b1010; // a = 10
    b = 4'b0101; // b = 5
    s = 1;      // select b
    #10;        // wait for 10 time units
    if (y !== b) begin
      $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", b, y);
      $finish;
    end

    // Test case 3: Change inputs and test again
    a = 4'b1111; // a = 15
    b = 4'b0000; // b = 0
    s = 0;      // select a
    #10;        // wait for 10 time units
    if (y !== a) begin
      $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", a, y);
      $finish;
    end

    // Test case 4: s = 1, expect y = b
    a = 4'b1111; // a = 15
    b = 4'b0000; // b = 0
    s = 1;      // select b
    #10;        // wait for 10 time units
    if (y !== b) begin
      $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", b, y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule