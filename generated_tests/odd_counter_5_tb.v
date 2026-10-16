`timescale 1ns/1ps

module tb_odd_counter;
  reg clk;
  reg reset;
  wire [7:0] cnt_o;

  // Instantiate the odd_counter module
  odd_counter uut (
    .clk(clk),
    .reset(reset),
    .cnt_o(cnt_o)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;

    // Check initial value after reset
    if (cnt_o !== 1) begin
      $display("FAIL: Initial count after reset is not 1, got %d", cnt_o);
      $finish;
    end

    // Wait for a few clock cycles and check the output
    #10; // Wait for 1 clock cycle
    if (cnt_o !== 3) begin
      $display("FAIL: Count after 1 clock cycle is not 3, got %d", cnt_o);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt_o !== 5) begin
      $display("FAIL: Count after 2 clock cycles is not 5, got %d", cnt_o);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt_o !== 7) begin
      $display("FAIL: Count after 3 clock cycles is not 7, got %d", cnt_o);
      $finish;
    end

    // Reset the counter
    reset = 1;
    #10; // Wait for reset to take effect
    reset = 0;

    // Check value after reset
    if (cnt_o !== 1) begin
      $display("FAIL: Count after reset is not 1, got %d", cnt_o);
      $finish;
    end

    // Continue counting after reset
    #10; // Wait for 1 clock cycle
    if (cnt_o !== 3) begin
      $display("FAIL: Count after reset and 1 clock cycle is not 3, got %d", cnt_o);
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end
endmodule