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
    // Initialize signals
    rstn = 0;
    mode = 0;
    
    // Apply reset
    #10;
    rstn = 1; // Release reset

    // Test case 1: Increment mode
    mode = 1; // Set mode to increment
    #10; // Wait for one clock cycle
    if (q !== 4'b0001) begin
      $display("FAIL: Expected q = 1, got q = %b", q);
      $finish;
    end

    // Test case 2: Increment again
    #10; // Wait for one clock cycle
    if (q !== 4'b0010) begin
      $display("FAIL: Expected q = 2, got q = %b", q);
      $finish;
    end

    // Test case 3: Decrement mode
    mode = 2; // Set mode to decrement
    #10; // Wait for one clock cycle
    if (q !== 4'b0001) begin
      $display("FAIL: Expected q = 1, got q = %b", q);
      $finish;
    end

    // Test case 4: Decrement again
    #10; // Wait for one clock cycle
    if (q !== 4'b0000) begin
      $display("FAIL: Expected q = 0, got q = %b", q);
      $finish;
    end

    // Test case 5: No change mode
    mode = 0; // Set mode to no change
    #10; // Wait for one clock cycle
    if (q !== 4'b0000) begin
      $display("FAIL: Expected q = 0, got q = %b", q);
      $finish;
    end

    // Test case 6: Reset functionality
    rstn = 0; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 4'b0000) begin
      $display("FAIL: Expected q = 0 after reset, got q = %b", q);
      $finish;
    end

    // Release reset and check again
    rstn = 1; 
    #10; // Wait for one clock cycle
    if (q !== 4'b0000) begin
      $display("FAIL: Expected q = 0 after reset release, got q = %b", q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule