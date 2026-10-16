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
    // Initialize signals
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;

    // Check initial value after reset
    if (cnt_o !== 8'h1) begin
      $display("FAIL: Initial value after reset is not 1");
      $finish;
    end

    // Wait for a few clock cycles and check values
    #10; // Wait for 1 clock cycle
    if (cnt_o !== 8'h3) begin
      $display("FAIL: Value after 1 clock cycle is not 3");
      $finish;
    end

    #10; // Wait for 1 more clock cycle
    if (cnt_o !== 8'h5) begin
      $display("FAIL: Value after 2 clock cycles is not 5");
      $finish;
    end

    #10; // Wait for 1 more clock cycle
    if (cnt_o !== 8'h7) begin
      $display("FAIL: Value after 3 clock cycles is not 7");
      $finish;
    end

    #10; // Wait for 1 more clock cycle
    if (cnt_o !== 8'h9) begin
      $display("FAIL: Value after 4 clock cycles is not 9");
      $finish;
    end

    #10; // Wait for 1 more clock cycle
    if (cnt_o !== 8'hB) begin
      $display("FAIL: Value after 5 clock cycles is not B");
      $finish;
    end

    #10; // Wait for 1 more clock cycle
    if (cnt_o !== 8'hD) begin
      $display("FAIL: Value after 6 clock cycles is not D");
      $finish;
    end

    #10; // Wait for 1 more clock cycle
    if (cnt_o !== 8'hF) begin
      $display("FAIL: Value after 7 clock cycles is not F");
      $finish;
    end

    #10; // Wait for 1 more clock cycle
    if (cnt_o !== 8'h11) begin
      $display("FAIL: Value after 8 clock cycles is not 11");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule