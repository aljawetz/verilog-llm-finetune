`timescale 1ns/1ps

module tb_cla_1;
  reg [3:0] a;
  reg [3:0] b;
  reg cin;
  wire [3:0] s;
  wire cout;

  // Instantiate the Unit Under Test (UUT)
  cla_1 uut (
    .a(a),
    .b(b),
    .cin(cin),
    .s(s),
    .cout(cout)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0
    a = 4'b0000; b = 4'b0000; cin = 1'b0;
    #10;
    if (s !== 4'b0000 || cout !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: 1 + 1 + 0 = 2
    a = 4'b0001; b = 4'b0001; cin = 1'b0;
    #10;
    if (s !== 4'b0010 || cout !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: 3 + 3 + 0 = 6
    a = 4'b0011; b = 4'b0011; cin = 1'b0;
    #10;
    if (s !== 4'b0110 || cout !== 1'b0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: 7 + 1 + 0 = 8
    a = 4'b0111; b = 4'b0001; cin = 1'b0;
    #10;
    if (s !== 4'b1000 || cout !== 1'b0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: 7 + 1 + 1 = 9 (with carry)
    a = 4'b0111; b = 4'b0001; cin = 1'b1;
    #10;
    if (s !== 4'b1001 || cout !== 1'b0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: 8 + 8 + 0 = 0 (overflow)
    a = 4'b1000; b = 4'b1000; cin = 1'b0;
    #10;
    if (s !== 4'b0000 || cout !== 1'b1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: 15 + 1 + 0 = 0 (overflow)
    a = 4'b1111; b = 4'b0001; cin = 1'b0;
    #10;
    if (s !== 4'b0000 || cout !== 1'b1) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule