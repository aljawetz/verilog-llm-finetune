`timescale 1ns/1ps

module tb_mul2;

  // Inputs
  reg [2:0] a;

  // Outputs
  wire [3:0] y;

  // Instantiate the module under test (uut)
  mul2 uut (
    .a(a),
    .y(y)
  );

  initial begin
    // Test cases
    a = 3'b000; #10;
    if (y !== 4'b0000) $display("FAIL: Test case a=0 failed, got y=%b", y);

    a = 3'b001; #10;
    if (y !== 4'b0010) $display("FAIL: Test case a=1 failed, got y=%b", y);

    a = 3'b010; #10;
    if (y !== 4'b0100) $display("FAIL: Test case a=2 failed, got y=%b", y);

    a = 3'b011; #10;
    if (y !== 4'b0110) $display("FAIL: Test case a=3 failed, got y=%b", y);

    a = 3'b100; #10;
    if (y !== 4'b1000) $display("FAIL: Test case a=4 failed, got y=%b", y);

    a = 3'b101; #10;
    if (y !== 4'b1010) $display("FAIL: Test case a=5 failed, got y=%b", y);

    a = 3'b110; #10;
    if (y !== 4'b1100) $display("FAIL: Test case a=6 failed, got y=%b", y);

    a = 3'b111; #10;
    if (y !== 4'b1110) $display("FAIL: Test case a=7 failed, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule