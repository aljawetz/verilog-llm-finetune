`timescale 1ns/1ps

module tb_cmp_n;
  reg [15:0] a;
  reg [15:0] b;
  wire l, g, e;

  // Instantiate the module under test
  cmp_n uut (
    .a(a),
    .b(b),
    .l(l),
    .g(g),
    .e(e)
  );

  initial begin
    // Test case 1: a < b
    a = 16'h0001; // 1
    b = 16'h0002; // 2
    #10;
    if (l !== 1'b1 || g !== 1'b0 || e !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a > b
    a = 16'h0003; // 3
    b = 16'h0002; // 2
    #10;
    if (l !== 1'b0 || g !== 1'b1 || e !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a == b
    a = 16'h0002; // 2
    b = 16'h0002; // 2
    #10;
    if (l !== 1'b0 || g !== 1'b0 || e !== 1'b1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a < b with maximum values
    a = 16'h7FFF; // 32767
    b = 16'h8000; // 32768
    #10;
    if (l !== 1'b1 || g !== 1'b0 || e !== 1'b0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: a > b with maximum values
    a = 16'h8000; // 32768
    b = 16'h7FFF; // 32767
    #10;
    if (l !== 1'b0 || g !== 1'b1 || e !== 1'b0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: a == b with maximum values
    a = 16'hFFFF; // 65535
    b = 16'hFFFF; // 65535
    #10;
    if (l !== 1'b0 || g !== 1'b0 || e !== 1'b1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule