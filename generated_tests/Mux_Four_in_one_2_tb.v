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
    rst = 1; // Assert reset
    data = 4'b0000;
    select = 2'b00;
    #10; // Wait for a clock cycle
    rst = 0; // Deassert reset

    // Test case 1: Select data[0]
    data = 4'b1010; // data = 10
    select = 2'b00; 
    #10; // Wait for a clock cycle
    if (out !== 1'b1) $display("FAIL: Expected out = 1, got out = %b", out);

    // Test case 2: Select data[1]
    select = 2'b01; 
    #10; // Wait for a clock cycle
    if (out !== 1'b0) $display("FAIL: Expected out = 0, got out = %b", out);

    // Test case 3: Select data[2]
    select = 2'b10; 
    #10; // Wait for a clock cycle
    if (out !== 1'b1) $display("FAIL: Expected out = 1, got out = %b", out);

    // Test case 4: Select data[3]
    select = 2'b11; 
    #10; // Wait for a clock cycle
    if (out !== 1'b0) $display("FAIL: Expected out = 0, got out = %b", out);

    // Test case 5: Reset functionality
    rst = 1; 
    #10; // Wait for a clock cycle
    if (out !== 1'b0) $display("FAIL: Expected out = 0 after reset, got out = %b", out);
    
    // End of tests
    $display("PASS");
    $finish;
  end

endmodule