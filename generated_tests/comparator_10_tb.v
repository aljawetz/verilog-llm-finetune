`timescale 1ns/1ps

module tb_comparator;

  reg [3:0] comp_i;
  wire comp_o;

  // Instantiate the module under test (uut)
  comparator uut (
    .comp_i(comp_i),
    .comp_o(comp_o)
  );

  initial begin
    // Test case 1: Check when input is 0
    comp_i = 4'b0000; // Input is zero
    #10; // Wait for 10 time units
    if (comp_o !== 1'b1) begin
      $display("FAIL: Expected output 1 for input 0, got %b", comp_o);
      $finish;
    end

    // Test case 2: Check when input is 1
    comp_i = 4'b0001; // Input is one
    #10; // Wait for 10 time units
    if (comp_o !== 1'b0) begin
      $display("FAIL: Expected output 0 for input 1, got %b", comp_o);
      $finish;
    end

    // Test case 3: Check when input is 2
    comp_i = 4'b0010; // Input is two
    #10; // Wait for 10 time units
    if (comp_o !== 1'b0) begin
      $display("FAIL: Expected output 0 for input 2, got %b", comp_o);
      $finish;
    end

    // Test case 4: Check when input is 3
    comp_i = 4'b0011; // Input is three
    #10; // Wait for 10 time units
    if (comp_o !== 1'b0) begin
      $display("FAIL: Expected output 0 for input 3, got %b", comp_o);
      $finish;
    end

    // Test case 5: Check when input is 4
    comp_i = 4'b0100; // Input is four
    #10; // Wait for 10 time units
    if (comp_o !== 1'b0) begin
      $display("FAIL: Expected output 0 for input 4, got %b", comp_o);
      $finish;
    end

    // Test case 6: Check when input is 15
    comp_i = 4'b1111; // Input is fifteen
    #10; // Wait for 10 time units
    if (comp_o !== 1'b0) begin
      $display("FAIL: Expected output 0 for input 15, got %b", comp_o);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule