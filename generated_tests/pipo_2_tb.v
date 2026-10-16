`timescale 1ns/1ps

module tb_pipo;

  reg [3:0] in;
  reg [3:0] clk;
  reg [3:0] reset;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  pipo uut (
    .in(in),
    .clk(clk),
    .reset(reset),
    .out(out)
  );

  // Clock generation
  initial begin
    clk = 4'b0000;
    forever #5 clk = ~clk; // Toggle clock every 5 time units
  end

  // Test sequence
  initial begin
    // Initialize inputs
    in = 4'b0000;
    reset = 4'b0000;

    // Test 1: Reset functionality
    reset = 4'b1111; // Activate reset
    #10; // Wait for one clock cycle
    if (out !== 4'b0000) begin
      $display("FAIL: Reset did not set output to zero");
      $finish;
    end

    // Test 2: Latch input value
    reset = 4'b0000; // Deactivate reset
    in = 4'b1010; // Set input value
    #10; // Wait for one clock cycle
    if (out !== 4'b1010) begin
      $display("FAIL: Output did not latch input value");
      $finish;
    end

    // Test 3: Change input value after latching
    in = 4'b1100; // Change input value
    #10; // Wait for one clock cycle
    if (out !== 4'b1100) begin
      $display("FAIL: Output did not update to new input value");
      $finish;
    end

    // Test 4: Reset again
    reset = 4'b1111; // Activate reset
    #10; // Wait for one clock cycle
    if (out !== 4'b0000) begin
      $display("FAIL: Reset did not set output to zero again");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule