`timescale 1ns/1ps

module tb_u1;
  reg reset;
  reg clk;
  wire [1:0] count_out;

  // Instantiate the module under test (uut)
  u1 uut (
    .reset(reset),
    .clk(clk),
    .count_out(count_out)
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
    reset = 0; // Release reset

    // Check initial count after reset
    if (count_out !== 2'b00) begin
      $display("FAIL: Initial count_out is not 0 after reset");
      $finish;
    end

    // Wait for a few clock cycles and check count
    #10; // Wait for 1 clock cycle
    if (count_out !== 2'b01) begin
      $display("FAIL: count_out is not 1 after 1 clock cycle");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (count_out !== 2'b10) begin
      $display("FAIL: count_out is not 2 after 2 clock cycles");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (count_out !== 2'b11) begin
      $display("FAIL: count_out is not 3 after 3 clock cycles");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (count_out !== 2'b00) begin
      $display("FAIL: count_out is not 0 after 4 clock cycles (wrap around)");
      $finish;
    end

    // Assert reset functionality
    reset = 1; // Assert reset
    #10; // Wait for 10ns
    if (count_out !== 2'b00) begin
      $display("FAIL: count_out is not 0 after asserting reset");
      $finish;
    end

    reset = 0; // Release reset
    #10; // Wait for 1 clock cycle
    if (count_out !== 2'b01) begin
      $display("FAIL: count_out is not 1 after releasing reset");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end
endmodule