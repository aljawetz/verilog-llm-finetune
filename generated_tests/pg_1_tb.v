`timescale 1ns/1ps

module tb_pg;

  reg x;
  reg y;
  wire p;
  wire g;
  wire k;

  // Instantiate the module under test (uut)
  pg uut (
    .x(x),
    .y(y),
    .p(p),
    .g(g),
    .k(k)
  );

  initial begin
    // Test case 1: x = 0, y = 0
    x = 0; y = 0;
    #10;
    if (p !== 1'b1 || g !== 1'b1 || k !== 1'b0) begin
      $display("FAIL: Test case 1 failed (x=0, y=0)");
      $finish;
    end

    // Test case 2: x = 0, y = 1
    x = 0; y = 1;
    #10;
    if (p !== 1'b0 || g !== 1'b1 || k !== 1'b1) begin
      $display("FAIL: Test case 2 failed (x=0, y=1)");
      $finish;
    end

    // Test case 3: x = 1, y = 0
    x = 1; y = 0;
    #10;
    if (p !== 1'b0 || g !== 1'b1 || k !== 1'b1) begin
      $display("FAIL: Test case 3 failed (x=1, y=0)");
      $finish;
    end

    // Test case 4: x = 1, y = 1
    x = 1; y = 1;
    #10;
    if (p !== 1'b0 || g !== 1'b0 || k !== 1'b0) begin
      $display("FAIL: Test case 4 failed (x=1, y=1)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule