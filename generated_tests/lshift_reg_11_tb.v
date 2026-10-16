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

    // Test loading a value
    load_en = 1;
    load_val = 8'b10101010; // Load value
    #10;
    load_en = 0; // Disable load

    // Check if the value is loaded correctly
    if (op !== 8'b10101010) begin
      $display("FAIL: Expected op = 10101010, got op = %b", op);
      $finish;
    end

    // Shift left and check values
    #10; // Shift 1
    if (op !== 8'b01010101) begin
      $display("FAIL: Expected op = 01010101, got op = %b", op);
      $finish;
    end

    #10; // Shift 2
    if (op !== 8'b10101010) begin
      $display("FAIL: Expected op = 10101010, got op = %b", op);
      $finish;
    end

    #10; // Shift 3
    if (op !== 8'b01010101) begin
      $display("FAIL: Expected op = 01010101, got op = %b", op);
      $finish;
    end

    // Test reset functionality
    #10;
    rstn = 0; // Assert reset
    #10;
    rstn = 1; // Release reset

    // Check if the output is reset to 0
    if (op !== 8'b00000000) begin
      $display("FAIL: Expected op = 00000000 after reset, got op = %b", op);
      $finish;
    end

    // Load a new value and check
    load_en = 1;
    load_val = 8'b11110000; // Load new value
    #10;
    load_en = 0; // Disable load

    // Check if the new value is loaded correctly
    if (op !== 8'b11110000) begin
      $display("FAIL: Expected op = 11110000, got op = %b", op);
      $finish;
    end

    // Shift left and check values
    #10; // Shift 1
    if (op !== 8'b11100001) begin
      $display("FAIL: Expected op = 11100001, got op = %b", op);
      $finish;
    end

    #10; // Shift 2
    if (op !== 8'b11000011) begin
      $display("FAIL: Expected op = 11000011, got op = %b", op);
      $finish;
    end

    #10; // Shift 3
    if (op !== 8'b10000111) begin
      $display("FAIL: Expected op = 10000111, got op = %b", op);
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule