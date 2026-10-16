`timescale 1ns/1ps

module tb_fourbit_upcounter;

  reg clk;
  reg rstn;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  fourbit_upcounter uut (
    .clk(clk),
    .rstn(rstn),
    .out(out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    rstn = 0; // Assert reset
    #10; // Wait for 10ns
    rstn = 1; // Deassert reset

    // Check initial value after reset
    if (out !== 4'b0000) begin
      $display("FAIL: Initial output after reset is not 0");
      $finish;
    end

    // Wait for a few clock cycles and check the output
    #10; // Wait for 1 clock cycle
    if (out !== 4'b0001) begin
      $display("FAIL: Output after 1 clock cycle is not 1");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (out !== 4'b0010) begin
      $display("FAIL: Output after 2 clock cycles is not 2");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (out !== 4'b0011) begin
      $display("FAIL: Output after 3 clock cycles is not 3");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (out !== 4'b0100) begin
      $display("FAIL: Output after 4 clock cycles is not 4");
      $finish;
    end

    // Assert reset again
    rstn = 0; // Assert reset
    #10; // Wait for 10ns
    rstn = 1; // Deassert reset

    // Check value after reset
    if (out !== 4'b0000) begin
      $display("FAIL: Output after reset is not 0");
      $finish;
    end

    // Continue counting
    #10; // Wait for 1 clock cycle
    if (out !== 4'b0001) begin
      $display("FAIL: Output after 1 clock cycle is not 1");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (out !== 4'b0010) begin
      $display("FAIL: Output after 2 clock cycles is not 2");
      $finish;
    end

    // Finish simulation
    $display("PASS");
    $finish;
  end

endmodule