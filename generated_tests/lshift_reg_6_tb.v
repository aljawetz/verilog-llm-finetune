`timescale 1ns/1ps

module tb_lshift_reg;

  reg clk;
  reg rstn;
  reg [7:0] load_val;
  reg load_en;
  wire [7:0] op;

  // Instantiate the module under test (uut)
  lshift_reg uut (
    .clk(clk),
    .rstn(rstn),
    .load_val(load_val),
    .load_en(load_en),
    .op(op)
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
    load_en = 0;
    load_val = 8'b00000000;

    // Reset the module
    #10;
    rstn = 1; // Release reset
    #10;

    // Test loading a value
    load_val = 8'b10101010;
    load_en = 1; // Enable loading
    #10;
    load_en = 0; // Disable loading

    // Check if the value is loaded correctly
    if (op !== 8'b10101010) begin
      $display("FAIL: Expected op = 10101010, got op = %b", op);
      $finish;
    end

    // Rotate left for a few cycles
    #10;
    if (op !== 8'b01010101) begin
      $display("FAIL: Expected op = 01010101, got op = %b", op);
      $finish;
    end

    #10;
    if (op !== 8'b10101010) begin
      $display("FAIL: Expected op = 10101010, got op = %b", op);
      $finish;
    end

    #10;
    if (op !== 8'b01010101) begin
      $display("FAIL: Expected op = 01010101, got op = %b", op);
      $finish;
    end

    // Test reset functionality
    rstn = 0; // Assert reset
    #10;
    if (op !== 8'b00000000) begin
      $display("FAIL: Expected op = 00000000 after reset, got op = %b", op);
      $finish;
    end

    // Release reset and load new value
    rstn = 1;
    load_val = 8'b11110000;
    load_en = 1; // Enable loading
    #10;
    load_en = 0; // Disable loading

    // Check if the new value is loaded correctly
    if (op !== 8'b11110000) begin
      $display("FAIL: Expected op = 11110000, got op = %b", op);
      $finish;
    end

    // Rotate left for a few cycles
    #10;
    if (op !== 8'b11100001) begin
      $display("FAIL: Expected op = 11100001, got op = %b", op);
      $finish;
    end

    #10;
    if (op !== 8'b11000011) begin
      $display("FAIL: Expected op = 11000011, got op = %b", op);
      $finish;
    end

    #10;
    if (op !== 8'b10000111) begin
      $display("FAIL: Expected op = 10000111, got op = %b", op);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule