`timescale 1ns/1ps

module tb_Mux_Four_in_one;

  reg [3:0] data;
  reg [1:0] select;
  reg rst;
  reg clk;
  wire out;

  // Instantiate the module under test (uut)
  Mux_Four_in_one uut (
    .data(data),
    .select(select),
    .rst(rst),
    .clk(clk),
    .out(out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize
    rst = 1;
    data = 4'b0000;
    select = 2'b00;
    #10; // Wait for a clock cycle
    rst = 0;

    // Test case 1: Select data[0]
    data = 4'b1010; // data = 10
    select = 2'b00; // Select first input
    #10;
    if (out !== data[0]) begin
      $display("FAIL: Expected out = %b, got out = %b", data[0], out);
      $finish;
    end

    // Test case 2: Select data[1]
    select = 2'b01; // Select second input
    #10;
    if (out !== data[1]) begin
      $display("FAIL: Expected out = %b, got out = %b", data[1], out);
      $finish;
    end

    // Test case 3: Select data[2]
    select = 2'b10; // Select third input
    #10;
    if (out !== data[2]) begin
      $display("FAIL: Expected out = %b, got out = %b", data[2], out);
      $finish;
    end

    // Test case 4: Select data[3]
    select = 2'b11; // Select fourth input
    #10;
    if (out !== data[3]) begin
      $display("FAIL: Expected out = %b, got out = %b", data[3], out);
      $finish;
    end

    // Test case 5: Reset functionality
    rst = 1;
    #10; // Wait for a clock cycle
    if (out !== 0) begin
      $display("FAIL: Expected out = 0 after reset, got out = %b", out);
      $finish;
    end

    // Test case 6: Check default case with invalid select
    rst = 0;
    select = 2'bxx; // Invalid select
    #10;
    if (out !== 0) begin
      $display("FAIL: Expected out = 0 for invalid select, got out = %b", out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule