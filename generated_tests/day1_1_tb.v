`timescale 1ns/1ps

module tb_day1;

  reg [7:0] x;
  reg [7:0] y;
  reg sel;
  wire [7:0] f;

  // Instantiate the module under test (uut)
  day1 uut (
    .x(x),
    .y(y),
    .sel(sel),
    .f(f)
  );

  initial begin
    // Test case 1: sel = 0, expect f = x
    x = 8'hAA; // 10101010
    y = 8'h55; // 01010101
    sel = 0;
    #10;
    if (f !== x) begin
      $display("FAIL: Test case 1 failed, expected f = %h, got f = %h", x, f);
      $finish;
    end

    // Test case 2: sel = 1, expect f = y
    sel = 1;
    #10;
    if (f !== y) begin
      $display("FAIL: Test case 2 failed, expected f = %h, got f = %h", y, f);
      $finish;
    end

    // Test case 3: sel = 0, expect f = x again
    sel = 0;
    #10;
    if (f !== x) begin
      $display("FAIL: Test case 3 failed, expected f = %h, got f = %h", x, f);
      $finish;
    end

    // Test case 4: sel = 1, expect f = y again
    sel = 1;
    #10;
    if (f !== y) begin
      $display("FAIL: Test case 4 failed, expected f = %h, got f = %h", y, f);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule