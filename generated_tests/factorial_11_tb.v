`timescale 1ns/1ps

module tb_factorial;

  reg [3:0] n;
  wire [31:0] result;

  // Instantiate the factorial module
  factorial uut (
    .n(n),
    .result(result)
  );

  initial begin
    // Test cases
    n = 4'b0000; // 0! = 1
    #10;
    if (result !== 32'd1) $display("FAIL: Expected 1 for n=0, got %d", result);

    n = 4'b0001; // 1! = 1
    #10;
    if (result !== 32'd1) $display("FAIL: Expected 1 for n=1, got %d", result);

    n = 4'b0010; // 2! = 2
    #10;
    if (result !== 32'd2) $display("FAIL: Expected 2 for n=2, got %d", result);

    n = 4'b0011; // 3! = 6
    #10;
    if (result !== 32'd6) $display("FAIL: Expected 6 for n=3, got %d", result);

    n = 4'b0100; // 4! = 24
    #10;
    if (result !== 32'd24) $display("FAIL: Expected 24 for n=4, got %d", result);

    n = 4'b0101; // 5! = 120
    #10;
    if (result !== 32'd120) $display("FAIL: Expected 120 for n=5, got %d", result);

    n = 4'b0110; // 6! = 720
    #10;
    if (result !== 32'd720) $display("FAIL: Expected 720 for n=6, got %d", result);

    n = 4'b0111; // 7! = 5040
    #10;
    if (result !== 32'd5040) $display("FAIL: Expected 5040 for n=7, got %d", result);

    n = 4'b1000; // 8! = 40320
    #10;
    if (result !== 32'd40320) $display("FAIL: Expected 40320 for n=8, got %d", result);

    n = 4'b1001; // 9! = 362880
    #10;
    if (result !== 32'd362880) $display("FAIL: Expected 362880 for n=9, got %d", result);

    n = 4'b1010; // 10! = 3628800
    #10;
    if (result !== 32'd3628800) $display("FAIL: Expected 3628800 for n=10, got %d", result);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule