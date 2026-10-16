`timescale 1ns/1ps

module tb_ring_counter;

  reg clk;
  reg rst;
  wire [3:0] q;

  // Instantiate the ring_counter module
  ring_counter uut (
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    rst = 1;
    #10; // Wait for 10ns
    rst = 0;

    // Check initial state
    if (q !== 4'b1000) begin
      $display("FAIL: Initial state is incorrect, got %b", q);
      $finish;
    end

    // Run the ring counter for several clock cycles
    #10; // Wait for 1 clock cycle
    if (q !== 4'b0100) begin
      $display("FAIL: State after 1 clock cycle is incorrect, got %b", q);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (q !== 4'b0010) begin
      $display("FAIL: State after 2 clock cycles is incorrect, got %b", q);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (q !== 4'b0001) begin
      $display("FAIL: State after 3 clock cycles is incorrect, got %b", q);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (q !== 4'b1000) begin
      $display("FAIL: State after 4 clock cycles is incorrect, got %b", q);
      $finish;
    end

    // Test reset functionality
    rst = 1;
    #10; // Wait for 10ns
    rst = 0;

    // Check if it resets to initial state
    if (q !== 4'b1000) begin
      $display("FAIL: State after reset is incorrect, got %b", q);
      $finish;
    end

    // Final check after reset
    #10; // Wait for 1 clock cycle
    if (q !== 4'b0100) begin
      $display("FAIL: State after reset and 1 clock cycle is incorrect, got %b", q);
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule