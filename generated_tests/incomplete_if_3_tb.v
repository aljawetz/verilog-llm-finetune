`timescale 1ns/1ps

module tb_incomplete_if;

  reg [1:0] mode;
  reg clk;
  reg rstn;
  wire [3:0] q;

  // Instantiate the module under test (uut)
  incomplete_if uut (
    .mode(mode),
    .clk(clk),
    .rstn(rstn),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize
    rstn = 0; // Assert reset
    mode = 0;
    #10; // Wait for 10ns
    rstn = 1; // Deassert reset
    #10;

    // Test increment mode
    mode = 1; // Set mode to increment
    #10; // Wait for 1 clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q to be 1 after increment, got %d", q);
      $finish;
    end

    // Test increment again
    #10; // Wait for another clock cycle
    if (q !== 2) begin
      $display("FAIL: Expected q to be 2 after increment, got %d", q);
      $finish;
    end

    // Test decrement mode
    mode = 2; // Set mode to decrement
    #10; // Wait for 1 clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q to be 1 after decrement, got %d", q);
      $finish;
    end

    // Test decrement again
    #10; // Wait for another clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected q to be 0 after decrement, got %d", q);
      $finish;
    end

    // Test no change mode
    mode = 0; // Set mode to no change
    #10; // Wait for 1 clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected q to remain 0, got %d", q);
      $finish;
    end

    // Test reset
    rstn = 0; // Assert reset
    #10; // Wait for 1 clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected q to be 0 after reset, got %d", q);
      $finish;
    end

    // Deassert reset and check again
    rstn = 1; // Deassert reset
    #10; // Wait for 1 clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected q to remain 0 after reset deassertion, got %d", q);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule