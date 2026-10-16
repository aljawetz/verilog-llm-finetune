`timescale 1ns/1ps

module tb_comparator;

  // Parameters
  parameter DATA_WIDTH = 8;

  // Inputs
  reg [DATA_WIDTH-1:0] a;
  reg [DATA_WIDTH-1:0] b;

  // Outputs
  wire equal;
  wire lower;
  wire greater;

  // Instantiate the Unit Under Test (UUT)
  comparator #(.DATA_WIDTH(DATA_WIDTH)) uut (
    .a(a),
    .b(b),
    .equal(equal),
    .lower(lower),
    .greater(greater)
  );

  initial begin
    // Test case 1: a < b
    a = 8'd5; b = 8'd10;
    #10;
    if (equal !== 0 || lower !== 1 || greater !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a == b
    a = 8'd10; b = 8'd10;
    #10;
    if (equal !== 1 || lower !== 0 || greater !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a > b
    a = 8'd15; b = 8'd10;
    #10;
    if (equal !== 0 || lower !== 0 || greater !== 1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a < b (boundary case)
    a = 8'd0; b = 8'd1;
    #10;
    if (equal !== 0 || lower !== 1 || greater !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: a > b (boundary case)
    a = 8'd255; b = 8'd0;
    #10;
    if (equal !== 0 || lower !== 0 || greater !== 1) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule