`timescale 1ns/1ps

module tb_day5;

  reg clk;
  reg reset;
  wire [7:0] cnt_o;

  // Instantiate the module under test (uut)
  day5 uut (
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
    // Initialize reset
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;

    // Check initial value after reset
    if (cnt_o !== 8'h1) begin
      $display("FAIL: Initial value after reset is incorrect. Expected 1, got %d", cnt_o);
      $finish;
    end

    // Wait for a few clock cycles and check values
    #10; // Wait for 1 clock cycle
    if (cnt_o !== 8'h3) begin
      $display("FAIL: Value after 1 clock cycle is incorrect. Expected 3, got %d", cnt_o);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt_o !== 8'h5) begin
      $display("FAIL: Value after 2 clock cycles is incorrect. Expected 5, got %d", cnt_o);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt_o !== 8'h7) begin
      $display("FAIL: Value after 3 clock cycles is incorrect. Expected 7, got %d", cnt_o);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt_o !== 8'h9) begin
      $display("FAIL: Value after 4 clock cycles is incorrect. Expected 9, got %d", cnt_o);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt_o !== 8'hB) begin
      $display("FAIL: Value after 5 clock cycles is incorrect. Expected 11, got %d", cnt_o);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt_o !== 8'hD) begin
      $display("FAIL: Value after 6 clock cycles is incorrect. Expected 13, got %d", cnt_o);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt_o !== 8'hF) begin
      $display("FAIL: Value after 7 clock cycles is incorrect. Expected 15, got %d", cnt_o);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt_o !== 8'h11) begin
      $display("FAIL: Value after 8 clock cycles is incorrect. Expected 17, got %d", cnt_o);
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule