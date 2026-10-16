`timescale 1ns/1ps

module tb_Bit4_Comparator;

  reg [3:0] in_a;
  reg [3:0] in_b;
  wire out_0;
  wire out_1;
  wire out_2;

  // Instantiate the module under test
  Bit4_Comparator uut (
    .out_0(out_0),
    .out_1(out_1),
    .out_2(out_2),
    .in_a(in_a),
    .in_b(in_b)
  );

  initial begin
    // Test case 1: in_a < in_b
    in_a = 4'b0010; // 2
    in_b = 4'b0100; // 4
    #10;
    if (out_0 !== 1'b1 || out_1 !== 1'b0 || out_2 !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: in_a > in_b
    in_a = 4'b0110; // 6
    in_b = 4'b0011; // 3
    #10;
    if (out_0 !== 1'b0 || out_1 !== 1'b1 || out_2 !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: in_a == in_b
    in_a = 4'b0101; // 5
    in_b = 4'b0101; // 5
    #10;
    if (out_0 !== 1'b0 || out_1 !== 1'b0 || out_2 !== 1'b1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: in_a < in_b (boundary case)
    in_a = 4'b0000; // 0
    in_b = 4'b0001; // 1
    #10;
    if (out_0 !== 1'b1 || out_1 !== 1'b0 || out_2 !== 1'b0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: in_a > in_b (boundary case)
    in_a = 4'b1111; // 15
    in_b = 4'b1110; // 14
    #10;
    if (out_0 !== 1'b0 || out_1 !== 1'b1 || out_2 !== 1'b0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: in_a == in_b (boundary case)
    in_a = 4'b1000; // 8
    in_b = 4'b1000; // 8
    #10;
    if (out_0 !== 1'b0 || out_1 !== 1'b0 || out_2 !== 1'b1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule