`timescale 1ns/1ps

module tb_encoder4x2;

  // Inputs
  reg [3:0] in;

  // Outputs
  wire [1:0] out;

  // Instantiate the Unit Under Test (UUT)
  encoder4x2 uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test case 1: Valid one-hot input
    in = 4'b0001; #10;
    if (out !== 2'b00) begin
      $display("FAIL: Test case 1 failed, expected 2'b00, got %b", out);
      $finish;
    end

    // Test case 2: Valid one-hot input
    in = 4'b0010; #10;
    if (out !== 2'b01) begin
      $display("FAIL: Test case 2 failed, expected 2'b01, got %b", out);
      $finish;
    end

    // Test case 3: Valid one-hot input
    in = 4'b0100; #10;
    if (out !== 2'b10) begin
      $display("FAIL: Test case 3 failed, expected 2'b10, got %b", out);
      $finish;
    end

    // Test case 4: Valid one-hot input
    in = 4'b1000; #10;
    if (out !== 2'b11) begin
      $display("FAIL: Test case 4 failed, expected 2'b11, got %b", out);
      $finish;
    end

    // Test case 5: Invalid input (no active bits)
    in = 4'b0000; #10;
    if (out !== 2'bzz) begin
      $display("FAIL: Test case 5 failed, expected 2'bzz, got %b", out);
      $finish;
    end

    // Test case 6: Invalid input (multiple active bits)
    in = 4'b0011; #10;
    if (out !== 2'bzz) begin
      $display("FAIL: Test case 6 failed, expected 2'bzz, got %b", out);
      $finish;
    end

    // Test case 7: Invalid input (multiple active bits)
    in = 4'b1100; #10;
    if (out !== 2'bzz) begin
      $display("FAIL: Test case 7 failed, expected 2'bzz, got %b", out);
      $finish;
    end

    // Test case 8: Invalid input (multiple active bits)
    in = 4'b1111; #10;
    if (out !== 2'bzz) begin
      $display("FAIL: Test case 8 failed, expected 2'bzz, got %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule