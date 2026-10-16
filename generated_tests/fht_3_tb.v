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
    reset = 0;
    data_i = 8'b0;
    #10; // Wait for a few clock cycles

    reset = 1; // Release reset
    #10;

    // Test case 1: Input data = 8'b00000001
    data_i = 8'b00000001;
    #10; // Wait for transformation
    if (data_o !== 8'b00000000) begin
      $display("FAIL: Expected output 00000000, got %b", data_o);
      $finish;
    end

    // Test case 2: Input data = 8'b00000010
    data_i = 8'b00000010;
    #10; // Wait for transformation
    if (data_o !== 8'b00000000) begin
      $display("FAIL: Expected output 00000000, got %b", data_o);
      $finish;
    end

    // Test case 3: Input data = 8'b00000011
    data_i = 8'b00000011;
    #10; // Wait for transformation
    if (data_o !== 8'b00000000) begin
      $display("FAIL: Expected output 00000000, got %b", data_o);
      $finish;
    end

    // Test case 4: Input data = 8'b11111111
    data_i = 8'b11111111;
    #10; // Wait for transformation
    if (data_o !== 8'b00000000) begin
      $display("FAIL: Expected output 00000000, got %b", data_o);
      $finish;
    end

    // Test case 5: Input data = 8'b10101010
    data_i = 8'b10101010;
    #10; // Wait for transformation
    if (data_o !== 8'b00000000) begin
      $display("FAIL: Expected output 00000000, got %b", data_o);
      $finish;
    end

    // Test case 6: Input data = 8'b01010101
    data_i = 8'b01010101;
    #10; // Wait for transformation
    if (data_o !== 8'b00000000) begin
      $display("FAIL: Expected output 00000000, got %b", data_o);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule