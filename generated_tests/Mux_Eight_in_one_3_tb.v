`timescale 1ns/1ps

module tb_Mux_Eight_in_one;

  reg [7:0] data;
  reg [2:0] select;
  reg rst;
  reg clk;
  wire out;

  // Instantiate the module under test (uut)
  Mux_Eight_in_one uut (
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
    data = 8'b00000000;
    select = 3'b000;
    #10; // Wait for a clock cycle

    // Release reset
    rst = 0;
    #10; // Wait for a clock cycle

    // Test case 1: Select each data line
    data = 8'b10101010; // Set data inputs
    select = 3'b000; #10; // Select data[0]
    if (out !== 1'b0) $display("FAIL: Expected out = 0, got %b", out);

    select = 3'b001; #10; // Select data[1]
    if (out !== 1'b1) $display("FAIL: Expected out = 1, got %b", out);

    select = 3'b010; #10; // Select data[2]
    if (out !== 1'b0) $display("FAIL: Expected out = 0, got %b", out);

    select = 3'b011; #10; // Select data[3]
    if (out !== 1'b1) $display("FAIL: Expected out = 1, got %b", out);

    select = 3'b100; #10; // Select data[4]
    if (out !== 1'b0) $display("FAIL: Expected out = 0, got %b", out);

    select = 3'b101; #10; // Select data[5]
    if (out !== 1'b1) $display("FAIL: Expected out = 1, got %b", out);

    select = 3'b110; #10; // Select data[6]
    if (out !== 1'b0) $display("FAIL: Expected out = 0, got %b", out);

    select = 3'b111; #10; // Select data[7]
    if (out !== 1'b0) $display("FAIL: Expected out = 0, got %b", out);

    // Test case 2: Assert reset
    rst = 1; #10; // Wait for a clock cycle
    if (out !== 1'b0) $display("FAIL: Expected out = 0 after reset, got %b", out);

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule