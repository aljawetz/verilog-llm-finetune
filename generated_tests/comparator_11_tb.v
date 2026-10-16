`timescale 1ns/1ps

module tb_comparator;

  reg [1:0] a;
  reg [1:0] b;
  wire ALB;
  wire AEB;
  wire AGB;

  // Instantiate the comparator module
  comparator uut (
    .a(a),
    .b(b),
    .ALB(ALB),
    .AEB(AEB),
    .AGB(AGB)
  );

  initial begin
    // Test case 1: a < b
    a = 2'b00; b = 2'b01; #10;
    if (ALB !== 1'b1 || AEB !== 1'b0 || AGB !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a == b
    a = 2'b01; b = 2'b01; #10;
    if (ALB !== 1'b0 || AEB !== 1'b1 || AGB !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a > b
    a = 2'b10; b = 2'b01; #10;
    if (ALB !== 1'b0 || AEB !== 1'b0 || AGB !== 1'b1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a < b (different values)
    a = 2'b01; b = 2'b10; #10;
    if (ALB !== 1'b1 || AEB !== 1'b0 || AGB !== 1'b0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: a == b (different values)
    a = 2'b11; b = 2'b11; #10;
    if (ALB !== 1'b0 || AEB !== 1'b1 || AGB !== 1'b0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: a > b (different values)
    a = 2'b11; b = 2'b10; #10;
    if (ALB !== 1'b0 || AEB !== 1'b0 || AGB !== 1'b1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule