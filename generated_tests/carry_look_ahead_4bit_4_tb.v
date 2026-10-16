`timescale 1ns/1ps

module tb_carry_look_ahead_4bit;
  reg [3:0] a;
  reg [3:0] b;
  reg c_in;
  wire [3:0] sum;
  wire c_out;

  // Instantiate the module under test (uut)
  carry_look_ahead_4bit uut (
    .a(a),
    .b(b),
    .c_in(c_in),
    .sum(sum),
    .c_out(c_out)
  );

  initial begin
    // Test case 1: 0 + 0 + 0
    a = 4'b0000; b = 4'b0000; c_in = 1'b0;
    #10;
    if (sum !== 4'b0000 || c_out !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: 1 + 1 + 0
    a = 4'b0001; b = 4'b0001; c_in = 1'b0;
    #10;
    if (sum !== 4'b0010 || c_out !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: 3 + 3 + 0
    a = 4'b0011; b = 4'b0011; c_in = 1'b0;
    #10;
    if (sum !== 4'b0110 || c_out !== 1'b0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: 7 + 8 + 0
    a = 4'b0111; b = 4'b1000; c_in = 1'b0;
    #10;
    if (sum !== 4'b1111 || c_out !== 1'b0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: 15 + 1 + 0 (should generate carry out)
    a = 4'b1111; b = 4'b0001; c_in = 1'b0;
    #10;
    if (sum !== 4'b0000 || c_out !== 1'b1) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: 5 + 5 + 1 (should generate carry out)
    a = 4'b0101; b = 4'b0101; c_in = 1'b1;
    #10;
    if (sum !== 4'b1011 || c_out !== 1'b0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: 9 + 7 + 1 (should generate carry out)
    a = 4'b1001; b = 4'b0111; c_in = 1'b1;
    #10;
    if (sum !== 4'b0001 || c_out !== 1'b1) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule