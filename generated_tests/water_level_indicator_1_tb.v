`timescale 1ns/1ps

module tb_water_level_indicator;

  reg [7:0] level;
  wire full, half, empty;

  // Instantiate the module under test (uut)
  water_level_indicator uut (
    .level(level),
    .full(full),
    .half(half),
    .empty(empty)
  );

  initial begin
    // Test cases
    // Test for empty
    level = 8'b00000001; #10;
    if (full !== 1'b0 || half !== 1'b0 || empty !== 1'b1) begin
      $display("FAIL: Test case for empty failed with level = %b", level);
      $finish;
    end

    level = 8'b00000010; #10;
    if (full !== 1'b0 || half !== 1'b0 || empty !== 1'b1) begin
      $display("FAIL: Test case for empty failed with level = %b", level);
      $finish;
    end

    level = 8'b00000100; #10;
    if (full !== 1'b0 || half !== 1'b0 || empty !== 1'b1) begin
      $display("FAIL: Test case for empty failed with level = %b", level);
      $finish;
    end

    // Test for half
    level = 8'b00001000; #10;
    if (full !== 1'b0 || half !== 1'b1 || empty !== 1'b0) begin
      $display("FAIL: Test case for half failed with level = %b", level);
      $finish;
    end

    level = 8'b00010000; #10;
    if (full !== 1'b0 || half !== 1'b1 || empty !== 1'b0) begin
      $display("FAIL: Test case for half failed with level = %b", level);
      $finish;
    end

    level = 8'b00100000; #10;
    if (full !== 1'b0 || half !== 1'b1 || empty !== 1'b0) begin
      $display("FAIL: Test case for half failed with level = %b", level);
      $finish;
    end

    // Test for full
    level = 8'b01000000; #10;
    if (full !== 1'b1 || half !== 1'b0 || empty !== 1'b0) begin
      $display("FAIL: Test case for full failed with level = %b", level);
      $finish;
    end

    level = 8'b10000000; #10;
    if (full !== 1'b1 || half !== 1'b0 || empty !== 1'b0) begin
      $display("FAIL: Test case for full failed with level = %b", level);
      $finish;
    end

    // Test for undefined levels
    level = 8'b00000000; #10;
    if (full !== 1'bx || half !== 1'bx || empty !== 1'bx) begin
      $display("FAIL: Test case for undefined level failed with level = %b", level);
      $finish;
    end

    level = 8'b11111111; #10;
    if (full !== 1'bx || half !== 1'bx || empty !== 1'bx) begin
      $display("FAIL: Test case for undefined level failed with level = %b", level);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule