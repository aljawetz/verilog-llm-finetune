`timescale 1ns/1ps

module tb_d3;
  reg a, b, c;
  wire [7:0] dout;

  // Instantiate the module under test
  d3 uut (
    .a(a),
    .b(b),
    .c(c),
    .dout(dout)
  );

  initial begin
    // Test all combinations of a, b, c
    // Test case 1: a=0, b=0, c=0
    a = 0; b = 0; c = 0; #10;
    if (dout !== 8'b00000001) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a=0, b=0, c=1
    a = 0; b = 0; c = 1; #10;
    if (dout !== 8'b00000010) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a=0, b=1, c=0
    a = 0; b = 1; c = 0; #10;
    if (dout !== 8'b00000100) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a=0, b=1, c=1
    a = 0; b = 1; c = 1; #10;
    if (dout !== 8'b00001000) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: a=1, b=0, c=0
    a = 1; b = 0; c = 0; #10;
    if (dout !== 8'b00010000) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: a=1, b=0, c=1
    a = 1; b = 0; c = 1; #10;
    if (dout !== 8'b00100000) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: a=1, b=1, c=0
    a = 1; b = 1; c = 0; #10;
    if (dout !== 8'b01000000) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: a=1, b=1, c=1
    a = 1; b = 1; c = 1; #10;
    if (dout !== 8'b10000000) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule