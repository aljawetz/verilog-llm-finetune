`timescale 1ns/1ps

module tb_cmp_n;
  reg [15:0] a;
  reg [15:0] b;
  wire l, g, e;

  // Instantiate the module under test (uut)
  cmp_n uut (
    .a(a),
    .b(b),
    .l(l),
    .g(g),
    .e(e)
  );

  initial begin
    // Test case 1: a < b
    a = 16'h0001; 
    b = 16'h0002; 
    #10;
    if (l !== 1'b1 || g !== 1'b0 || e !== 1'b0) begin
      $display("FAIL: Test case 1 failed (a < b)");
      $finish;
    end

    // Test case 2: a > b
    a = 16'h0003; 
    b = 16'h0002; 
    #10;
    if (l !== 1'b0 || g !== 1'b1 || e !== 1'b0) begin
      $display("FAIL: Test case 2 failed (a > b)");
      $finish;
    end

    // Test case 3: a == b
    a = 16'h0002; 
    b = 16'h0002; 
    #10;
    if (l !== 1'b0 || g !== 1'b0 || e !== 1'b1) begin
      $display("FAIL: Test case 3 failed (a == b)");
      $finish;
    end

    // Test case 4: a < b (edge case)
    a = 16'h0000; 
    b = 16'h0001; 
    #10;
    if (l !== 1'b1 || g !== 1'b0 || e !== 1'b0) begin
      $display("FAIL: Test case 4 failed (a < b edge case)");
      $finish;
    end

    // Test case 5: a > b (edge case)
    a = 16'hFFFF; 
    b = 16'hFFFE; 
    #10;
    if (l !== 1'b0 || g !== 1'b1 || e !== 1'b0) begin
      $display("FAIL: Test case 5 failed (a > b edge case)");
      $finish;
    end

    // Test case 6: a == b (edge case)
    a = 16'hFFFF; 
    b = 16'hFFFF; 
    #10;
    if (l !== 1'b0 || g !== 1'b0 || e !== 1'b1) begin
      $display("FAIL: Test case 6 failed (a == b edge case)");
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule