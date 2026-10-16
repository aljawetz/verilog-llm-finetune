`timescale 1ns/1ps

module tb_mux_2_to_1;

  reg [3:0] a;
  reg [3:0] b;
  reg sel;
  wire [3:0] y;

  // Instantiate the module under test (uut)
  mux_2_to_1 uut (
    .a(a),
    .b(b),
    .sel(sel),
    .y(y)
  );

  initial begin
    // Test case 1: sel = 0, expect y = a
    a = 4'b1010; // a = 10
    b = 4'b0101; // b = 5
    sel = 0;
    #10; // Wait for 10 time units
    if (y !== a) begin
      $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", a, y);
      $finish;
    end

    // Test case 2: sel = 1, expect y = b
    sel = 1;
    #10; // Wait for 10 time units
    if (y !== b) begin
      $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", b, y);
      $finish;
    end

    // Test case 3: sel = 0, different values
    a = 4'b1111; // a = 15
    b = 4'b0000; // b = 0
    sel = 0;
    #10; // Wait for 10 time units
    if (y !== a) begin
      $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", a, y);
      $finish;
    end

    // Test case 4: sel = 1, different values
    sel = 1;
    #10; // Wait for 10 time units
    if (y !== b) begin
      $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", b, y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule