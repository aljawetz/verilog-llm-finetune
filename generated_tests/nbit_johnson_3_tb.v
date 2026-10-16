`timescale 1ns/1ps

module tb_nbit_johnson;

  parameter N = 4; // Change N as needed for testing
  reg clk;
  reg rst;
  wire [N-1:0] Q;

  // Instantiate the module under test (uut)
  nbit_johnson #(N) uut (
    .clk(clk),
    .rst(rst),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    rst = 1; // Assert reset
    #10; // Wait for a clock cycle
    rst = 0; // Deassert reset

    // Check initial state after reset
    if (Q !== 4'b0001) begin
      $display("FAIL: Initial state after reset is incorrect, Q = %b", Q);
      $finish;
    end

    // Wait for a few clock cycles and check the output
    #10; // Wait for 1 clock cycle
    if (Q !== 4'b0000) begin
      $display("FAIL: State after 1 clock cycle is incorrect, Q = %b", Q);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (Q !== 4'b1000) begin
      $display("FAIL: State after 2 clock cycles is incorrect, Q = %b", Q);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (Q !== 4'b1100) begin
      $display("FAIL: State after 3 clock cycles is incorrect, Q = %b", Q);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (Q !== 4'b1110) begin
      $display("FAIL: State after 4 clock cycles is incorrect, Q = %b", Q);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (Q !== 4'b1111) begin
      $display("FAIL: State after 5 clock cycles is incorrect, Q = %b", Q);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (Q !== 4'b0111) begin
      $display("FAIL: State after 6 clock cycles is incorrect, Q = %b", Q);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (Q !== 4'b0011) begin
      $display("FAIL: State after 7 clock cycles is incorrect, Q = %b", Q);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (Q !== 4'b0001) begin
      $display("FAIL: State after 8 clock cycles is incorrect, Q = %b", Q);
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule