`timescale 1ns/1ps

module tb_mod31;

  // Parameters
  parameter widtha = 10;
  parameter widthb = 10;
  parameter widthc = 18;
  parameter output_width = (widtha + widthb);

  // Inputs
  reg clk;
  reg reset;
  reg [widtha-1:0] a;
  reg [widthb-1:0] b;
  reg [widthc-1:0] c;

  // Outputs
  wire flag;
  wire [output_width-1:0] z;

  // Instantiate the module under test (uut)
  mod31 uut (
    .clk(clk),
    .reset(reset),
    .a(a),
    .b(b),
    .c(c),
    .flag(flag),
    .z(z)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset = 1;
    a = 0;
    b = 0;
    c = 0;

    // Release reset
    #10 reset = 0;

    // Test case 1: a + b = 15
    a = 7; b = 8; c = 0; // 7 + 8 = 15
    #10;
    if (flag !== 1 || z !== 15) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a + b != 15
    a = 5; b = 5; c = 0; // 5 + 5 = 10
    #10;
    if (flag !== 0 || z !== 10) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Reset functionality
    reset = 1;
    #10;
    if (flag !== 0 || z !== 0) begin
      $display("FAIL: Reset functionality failed");
      $finish;
    end
    reset = 0;

    // Test case 4: a + b = 15 again
    a = 10; b = 5; c = 0; // 10 + 5 = 15
    #10;
    if (flag !== 1 || z !== 15) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: a + b = 0
    a = 0; b = 0; c = 0; // 0 + 0 = 0
    #10;
    if (flag !== 0 || z !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule