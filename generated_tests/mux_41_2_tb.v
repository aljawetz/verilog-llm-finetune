`timescale 1ns/1ps

module tb_mux_41;

  // Inputs
  reg a;
  reg b;
  reg c;
  reg d;
  reg [1:0] sel;

  // Output
  wire y;

  // Instantiate the Unit Under Test (UUT)
  mux_41 uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .sel(sel),
    .y(y)
  );

  initial begin
    // Initialize inputs
    a = 0; b = 0; c = 0; d = 0; sel = 2'b00;

    // Test case 1: sel = 00, expect y = a
    a = 1; b = 0; c = 0; d = 0; sel = 2'b00;
    #10;
    if (y !== a) begin
      $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", a, y);
      $finish;
    end

    // Test case 2: sel = 01, expect y = b
    a = 0; b = 1; c = 0; d = 0; sel = 2'b01;
    #10;
    if (y !== b) begin
      $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", b, y);
      $finish;
    end

    // Test case 3: sel = 10, expect y = c
    a = 0; b = 0; c = 1; d = 0; sel = 2'b10;
    #10;
    if (y !== c) begin
      $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", c, y);
      $finish;
    end

    // Test case 4: sel = 11, expect y = d
    a = 0; b = 0; c = 0; d = 1; sel = 2'b11;
    #10;
    if (y !== d) begin
      $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", d, y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule