`timescale 1ns/1ps

module tb_alu;

  reg [15:0] a;
  reg [15:0] b;
  reg [2:0] sel;
  reg clk;
  reg reset;
  wire [15:0] q;

  // Instantiate the ALU module
  alu uut (
    .a(a),
    .b(b),
    .sel(sel),
    .clk(clk),
    .reset(reset),
    .q(q)
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
    #10;
    reset = 0;

    // Test addition
    a = 16'h0001; b = 16'h0001; sel = 3'b000; #10;
    if (q !== 16'h0002) $display("FAIL: Addition failed, expected 2, got %h", q);

    // Test subtraction
    a = 16'h0002; b = 16'h0001; sel = 3'b001; #10;
    if (q !== 16'h0001) $display("FAIL: Subtraction failed, expected 1, got %h", q);

    // Test multiplication
    a = 16'h0002; b = 16'h0002; sel = 3'b010; #10;
    if (q !== 16'h0004) $display("FAIL: Multiplication failed, expected 4, got %h", q);

    // Test modulo
    a = 16'h0005; b = 16'h0003; sel = 3'b011; #10;
    if (q !== 16'h0002) $display("FAIL: Modulo failed, expected 2, got %h", q);

    // Test bitwise AND
    a = 16'hF0F0; b = 16'h0F0F; sel = 3'b100; #10;
    if (q !== 16'h0000) $display("FAIL: Bitwise AND failed, expected 0, got %h", q);

    // Test bitwise OR
    a = 16'hF0F0; b = 16'h0F0F; sel = 3'b101; #10;
    if (q !== 16'hFFFF) $display("FAIL: Bitwise OR failed, expected FFFF, got %h", q);

    // Test bitwise XOR
    a = 16'hF0F0; b = 16'h0F0F; sel = 3'b110; #10;
    if (q !== 16'hFFFF) $display("FAIL: Bitwise XOR failed, expected FFFF, got %h", q);

    // Test logical AND
    a = 16'h0001; b = 16'h0001; sel = 3'b111; #10;
    if (q !== 16'h0001) $display("FAIL: Logical AND failed, expected 1, got %h", q);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule