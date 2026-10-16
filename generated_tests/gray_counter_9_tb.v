`timescale 1ns/1ps

module tb_gray_counter;
  reg clk;
  reg reset_n;
  wire [3:0] count;

  // Instantiate the gray_counter module
  gray_counter uut (
    .clk(clk),
    .reset_n(reset_n),
    .count(count)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    reset_n = 0;
    #10; // Wait for 10ns
    reset_n = 1; // Release reset

    // Check initial count after reset
    if (count !== 4'b0000) begin
      $display("FAIL: Initial count after reset is not 0");
      $finish;
    end

    // Wait for a few clock cycles and check Gray code output
    #10; // Wait for 1 clock cycle
    if (count !== 4'b0000) begin
      $display("FAIL: Count after 1 clock cycle is not 0");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 4'b0001) begin
      $display("FAIL: Count after 2 clock cycles is not 1");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 4'b0011) begin
      $display("FAIL: Count after 3 clock cycles is not 3");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 4'b0010) begin
      $display("FAIL: Count after 4 clock cycles is not 2");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 4'b0110) begin
      $display("FAIL: Count after 5 clock cycles is not 6");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 4'b0111) begin
      $display("FAIL: Count after 6 clock cycles is not 7");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 4'b0101) begin
      $display("FAIL: Count after 7 clock cycles is not 5");
      $finish;
    end

    // Reset the counter
    reset_n = 0;
    #10; // Wait for reset to take effect
    reset_n = 1;

    // Check count after reset
    if (count !== 4'b0000) begin
      $display("FAIL: Count after reset is not 0");
      $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
  end
endmodule