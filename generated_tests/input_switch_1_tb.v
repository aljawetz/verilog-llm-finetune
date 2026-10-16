`timescale 1ns/1ps

module tb_input_switch;

  parameter WIDTH = 16;
  reg [WIDTH-1:0] in;
  wire [WIDTH-1:0] y, z;

  // Instantiate the module under test
  input_switch #(WIDTH) uut (
    .y(y),
    .z(z),
    .in(in)
  );

  initial begin
    // Test sequence
    // Test case 1: Check with all zeros
    in = 16'b0000000000000000;
    #10;
    if (y !== 16'b0000000000000000 || z !== 16'b0000000000000000) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Check with all ones
    in = 16'b1111111111111111;
    #10;
    if (y !== 16'b1111111111111111 || z !== 16'b1111111111111111) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Check with alternating bits
    in = 16'b1010101010101010;
    #10;
    if (y !== 16'b1010101010101010 || z !== 16'b1010101010101010) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Check with random value
    in = 16'b1100110011001100;
    #10;
    if (y !== 16'b1100110011001100 || z !== 16'b1100110011001100) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule