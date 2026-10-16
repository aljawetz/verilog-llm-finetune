`timescale 1ns/1ps

module tb_decoder;

  reg a;
  reg b;
  wire [3:0] Q;

  // Instantiate the module under test (uut)
  decoder uut (
    .a(a),
    .b(b),
    .Q(Q)
  );

  initial begin
    // Test all valid input combinations
    // Test case 1: a = 0, b = 0
    a = 0; b = 0; #10;
    if (Q !== 4'b1000) begin
      $display("FAIL: Test case a=0, b=0 failed. Expected 1000, got %b", Q);
      $finish;
    end

    // Test case 2: a = 0, b = 1
    a = 0; b = 1; #10;
    if (Q !== 4'b1000) begin
      $display("FAIL: Test case a=0, b=1 failed. Expected 1000, got %b", Q);
      $finish;
    end

    // Test case 3: a = 1, b = 0
    a = 1; b = 0; #10;
    if (Q !== 4'b1000) begin
      $display("FAIL: Test case a=1, b=0 failed. Expected 1000, got %b", Q);
      $finish;
    end

    // Test case 4: a = 1, b = 1
    a = 1; b = 1; #10;
    if (Q !== 4'b1000) begin
      $display("FAIL: Test case a=1, b=1 failed. Expected 1000, got %b", Q);
      $finish;
    end

    // Test case 5: Invalid input (not defined in the decoder)
    a = 1'bx; b = 1'bx; #10;
    if (Q !== 4'bzzzz) begin
      $display("FAIL: Test case a=x, b=x failed. Expected zzzz, got %b", Q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule