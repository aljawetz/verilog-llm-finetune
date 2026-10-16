`timescale 1ns/1ps

module tb_xor2;

  reg x;
  reg y;
  wire z;

  // Instantiate the module under test
  xor2 uut (
    .z(z),
    .x(x),
    .y(y)
  );

  initial begin
    // Test case 1: x = 0, y = 0
    x = 0; y = 0;
    #10;
    if (z !== 1'b0) begin
      $display("FAIL: Test case 1 failed (x=0, y=0)");
      $finish;
    end

    // Test case 2: x = 0, y = 1
    x = 0; y = 1;
    #10;
    if (z !== 1'b1) begin
      $display("FAIL: Test case 2 failed (x=0, y=1)");
      $finish;
    end

    // Test case 3: x = 1, y = 0
    x = 1; y = 0;
    #10;
    if (z !== 1'b1) begin
      $display("FAIL: Test case 3 failed (x=1, y=0)");
      $finish;
    end

    // Test case 4: x = 1, y = 1
    x = 1; y = 1;
    #10;
    if (z !== 1'b0) begin
      $display("FAIL: Test case 4 failed (x=1, y=1)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule