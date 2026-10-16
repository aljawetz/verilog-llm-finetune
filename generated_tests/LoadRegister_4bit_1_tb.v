`timescale 1ns/1ps

module tb_LoadRegister_4bit;

  reg load;
  reg reset;
  reg clk;
  reg [3:0] Register_in;
  wire [3:0] Register_out;

  // Instantiate the module under test (uut)
  LoadRegister_4bit uut (
    .load(load),
    .reset(reset),
    .clk(clk),
    .Register_in(Register_in),
    .Register_out(Register_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    load = 0;
    reset = 1;
    Register_in = 4'b0000;

    // Test 1: Reset the register
    reset = 0; // Assert reset
    #10; // Wait for one clock cycle
    if (Register_out !== 4'b0000) begin
      $display("FAIL: Register_out should be 0 after reset");
      $finish;
    end

    // Test 2: Load data into the register
    reset = 1; // Deassert reset
    Register_in = 4'b1010; // Input data
    load = 1; // Assert load
    #10; // Wait for one clock cycle
    if (Register_out !== 4'b1010) begin
      $display("FAIL: Register_out should be 1010 after loading data");
      $finish;
    end

    // Test 3: Retain value when load is low
    load = 0; // Deassert load
    #10; // Wait for one clock cycle
    if (Register_out !== 4'b1010) begin
      $display("FAIL: Register_out should still be 1010 when load is low");
      $finish;
    end

    // Test 4: Reset again
    reset = 0; // Assert reset
    #10; // Wait for one clock cycle
    if (Register_out !== 4'b0000) begin
      $display("FAIL: Register_out should be 0 after reset");
      $finish;
    end

    // Test 5: Load new data
    reset = 1; // Deassert reset
    Register_in = 4'b1111; // New input data
    load = 1; // Assert load
    #10; // Wait for one clock cycle
    if (Register_out !== 4'b1111) begin
      $display("FAIL: Register_out should be 1111 after loading new data");
      $finish;
    end

    // Test 6: Check retention again
    load = 0; // Deassert load
    #10; // Wait for one clock cycle
    if (Register_out !== 4'b1111) begin
      $display("FAIL: Register_out should still be 1111 when load is low");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule