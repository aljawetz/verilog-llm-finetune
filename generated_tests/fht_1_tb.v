`timescale 1ns/1ps

module tb_fht;

  reg clk;
  reg reset;
  reg [7:0] data_i;
  wire [7:0] data_o;

  // Instantiate the module under test (uut)
  fht uut (
    .clk(clk),
    .reset(reset),
    .data_i(data_i),
    .data_o(data_o)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 0;
    data_i = 8'b0;

    // Apply reset
    #10 reset = 1; // Release reset after 10ns
    #10;

    // Test case 1: Check output for data_i = 8'b00000000
    data_i = 8'b00000000;
    #10;
    if (uut.data_o !== 8'b00000000) begin
      $display("FAIL: Expected data_o = 8'b00000000, got %b", uut.data_o);
      $finish;
    end

    // Test case 2: Check output for data_i = 8'b11111111
    data_i = 8'b11111111;
    #10;
    if (uut.data_o !== 8'b00000000) begin
      $display("FAIL: Expected data_o = 8'b00000000, got %b", uut.data_o);
      $finish;
    end

    // Test case 3: Check output for data_i = 8'b10101010
    data_i = 8'b10101010;
    #10;
    if (uut.data_o !== 8'b00000000) begin
      $display("FAIL: Expected data_o = 8'b00000000, got %b", uut.data_o);
      $finish;
    end

    // Test case 4: Check output for data_i = 8'b01010101
    data_i = 8'b01010101;
    #10;
    if (uut.data_o !== 8'b00000000) begin
      $display("FAIL: Expected data_o = 8'b00000000, got %b", uut.data_o);
      $finish;
    end

    // Test case 5: Check output for data_i = 8'b00001111
    data_i = 8'b00001111;
    #10;
    if (uut.data_o !== 8'b00000000) begin
      $display("FAIL: Expected data_o = 8'b00000000, got %b", uut.data_o);
      $finish;
    end

    // Final check
    $display("PASS");
    $finish;
  end

endmodule