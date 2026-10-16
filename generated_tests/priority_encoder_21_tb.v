`timescale 1ns/1ps

module tb_priority_encoder;
  reg [3:0] in;
  wire [1:0] out;

  // Instantiate the module under test
  priority_encoder uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test case 1: No inputs active
    in = 4'b0000; #10;
    if (out !== 2'bxx) begin
      $display("FAIL: Expected out = xx for in = 0000, got out = %b", out);
      $finish;
    end

    // Test case 2: Only LSB active
    in = 4'b0001; #10;
    if (out !== 2'b00) begin
      $display("FAIL: Expected out = 00 for in = 0001, got out = %b", out);
      $finish;
    end

    // Test case 3: Second LSB active
    in = 4'b0010; #10;
    if (out !== 2'b01) begin
      $display("FAIL: Expected out = 01 for in = 0010, got out = %b", out);
      $finish;
    end

    // Test case 4: Third LSB active
    in = 4'b0100; #10;
    if (out !== 2'b10) begin
      $display("FAIL: Expected out = 10 for in = 0100, got out = %b", out);
      $finish;
    end

    // Test case 5: MSB active
    in = 4'b1000; #10;
    if (out !== 2'b11) begin
      $display("FAIL: Expected out = 11 for in = 1000, got out = %b", out);
      $finish;
    end

    // Test case 6: Multiple inputs active (highest priority)
    in = 4'b0110; #10;
    if (out !== 2'b10) begin
      $display("FAIL: Expected out = 10 for in = 0110, got out = %b", out);
      $finish;
    end

    // Test case 7: Multiple inputs active (highest priority)
    in = 4'b1100; #10;
    if (out !== 2'b11) begin
      $display("FAIL: Expected out = 11 for in = 1100, got out = %b", out);
      $finish;
    end

    // Test case 8: All inputs inactive
    in = 4'b0000; #10;
    if (out !== 2'bxx) begin
      $display("FAIL: Expected out = xx for in = 0000, got out = %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule