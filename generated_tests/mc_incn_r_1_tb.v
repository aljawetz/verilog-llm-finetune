`timescale 1ns/1ps

module tb_mc_incn_r;

  parameter incN_width = 32;
  reg clk;
  reg [incN_width-1:0] inc_in;
  wire [incN_width-1:0] inc_out;

  // Instantiate the module under test (uut)
  mc_incn_r uut (
    .clk(clk),
    .inc_in(inc_in),
    .inc_out(inc_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    inc_in = 0;

    // Wait for a few clock cycles
    #10;

    // Test case 1: Increment by 1
    inc_in = 2'b01; // Set increment input
    #10; // Wait for one clock cycle
    if (inc_out != 2'b01) begin
      $display("FAIL: Expected inc_out = 01, got %b", inc_out);
      $finish;
    end

    // Test case 2: Increment by 2
    inc_in = 2'b10; // Set increment input
    #10; // Wait for one clock cycle
    if (inc_out != 2'b11) begin
      $display("FAIL: Expected inc_out = 11, got %b", inc_out);
      $finish;
    end

    // Test case 3: Increment by 3
    inc_in = 2'b11; // Set increment input
    #10; // Wait for one clock cycle
    if (inc_out != 2'b00) begin // Wrap around
      $display("FAIL: Expected inc_out = 00, got %b", inc_out);
      $finish;
    end

    // Test case 4: Increment by 0
    inc_in = 2'b00; // Set increment input
    #10; // Wait for one clock cycle
    if (inc_out != 2'b00) begin
      $display("FAIL: Expected inc_out = 00, got %b", inc_out);
      $finish;
    end

    // Test case 5: Increment by 1 again
    inc_in = 2'b01; // Set increment input
    #10; // Wait for one clock cycle
    if (inc_out != 2'b01) begin
      $display("FAIL: Expected inc_out = 01, got %b", inc_out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule