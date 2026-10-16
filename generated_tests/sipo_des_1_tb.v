`timescale 1ns/1ps

module tb_sipo_des;

  reg clk;
  reg si;
  wire [3:0] po;

  // Instantiate the module under test (uut)
  sipo_des uut (
    .clk(clk),
    .si(si),
    .po(po)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    si = 0;

    // Wait for a few clock cycles
    #10;

    // Test case 1: Shift in 4 bits (1010)
    si = 1; #10; // Shift in 1
    si = 0; #10; // Shift in 0
    si = 1; #10; // Shift in 1
    si = 0; #10; // Shift in 0

    // Check output
    if (po !== 4'b1010) begin
      $display("FAIL: Expected po = 1010, got po = %b", po);
      $finish;
    end

    // Test case 2: Shift in 4 bits (1101)
    si = 1; #10; // Shift in 1
    si = 1; #10; // Shift in 1
    si = 0; #10; // Shift in 0
    si = 1; #10; // Shift in 1

    // Check output
    if (po !== 4'b1101) begin
      $display("FAIL: Expected po = 1101, got po = %b", po);
      $finish;
    end

    // Test case 3: Shift in 4 bits (0000)
    si = 0; #10; // Shift in 0
    si = 0; #10; // Shift in 0
    si = 0; #10; // Shift in 0
    si = 0; #10; // Shift in 0

    // Check output
    if (po !== 4'b0000) begin
      $display("FAIL: Expected po = 0000, got po = %b", po);
      $finish;
    end

    // Test case 4: Shift in 4 bits (1111)
    si = 1; #10; // Shift in 1
    si = 1; #10; // Shift in 1
    si = 1; #10; // Shift in 1
    si = 1; #10; // Shift in 1

    // Check output
    if (po !== 4'b1111) begin
      $display("FAIL: Expected po = 1111, got po = %b", po);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule