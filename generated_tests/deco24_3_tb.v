`timescale 1ns/1ps

module tb_deco24;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire [3:0] p;

  // Instantiate the Unit Under Test (UUT)
  deco24 uut (
    .a(a),
    .b(b),
    .p(p)
  );

  initial begin
    // Test case 1: a=0, b=0 -> p should be 4'b1000
    a = 0; b = 0; #10;
    if (p !== 4'b1000) begin
      $display("FAIL: Test case 1 failed, expected 4'b1000, got %b", p);
      $finish;
    end

    // Test case 2: a=0, b=1 -> p should be 4'b0100
    a = 0; b = 1; #10;
    if (p !== 4'b0100) begin
      $display("FAIL: Test case 2 failed, expected 4'b0100, got %b", p);
      $finish;
    end

    // Test case 3: a=1, b=0 -> p should be 4'b0010
    a = 1; b = 0; #10;
    if (p !== 4'b0010) begin
      $display("FAIL: Test case 3 failed, expected 4'b0010, got %b", p);
      $finish;
    end

    // Test case 4: a=1, b=1 -> p should be 4'b0001
    a = 1; b = 1; #10;
    if (p !== 4'b0001) begin
      $display("FAIL: Test case 4 failed, expected 4'b0001, got %b", p);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule