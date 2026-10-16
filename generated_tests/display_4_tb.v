`timescale 1ns/1ps

module tb_display;

  reg clk;
  reg [3:0] value;
  wire [7:0] display;

  // Instantiate the module under test (uut)
  display uut (
    .clk(clk),
    .value(value),
    .display(display)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize value
    value = 4'h0;
    #10; // Wait for one clock cycle

    // Test all values from 0 to 15
    if (display !== 8'hC0) $display("FAIL: Expected 8'hC0 for value 0");
    value = 4'h1; #10;
    if (display !== 8'hF9) $display("FAIL: Expected 8'hF9 for value 1");
    value = 4'h2; #10;
    if (display !== 8'hA4) $display("FAIL: Expected 8'hA4 for value 2");
    value = 4'h3; #10;
    if (display !== 8'hB0) $display("FAIL: Expected 8'hB0 for value 3");
    value = 4'h4; #10;
    if (display !== 8'h99) $display("FAIL: Expected 8'h99 for value 4");
    value = 4'h5; #10;
    if (display !== 8'h92) $display("FAIL: Expected 8'h92 for value 5");
    value = 4'h6; #10;
    if (display !== 8'h82) $display("FAIL: Expected 8'h82 for value 6");
    value = 4'h7; #10;
    if (display !== 8'hF8) $display("FAIL: Expected 8'hF8 for value 7");
    value = 4'h8; #10;
    if (display !== 8'h80) $display("FAIL: Expected 8'h80 for value 8");
    value = 4'h9; #10;
    if (display !== 8'h90) $display("FAIL: Expected 8'h90 for value 9");
    value = 4'hA; #10;
    if (display !== 8'h88) $display("FAIL: Expected 8'h88 for value A");
    value = 4'hB; #10;
    if (display !== 8'h83) $display("FAIL: Expected 8'h83 for value B");
    value = 4'hC; #10;
    if (display !== 8'hC6) $display("FAIL: Expected 8'hC6 for value C");
    value = 4'hD; #10;
    if (display !== 8'hA1) $display("FAIL: Expected 8'hA1 for value D");
    value = 4'hE; #10;
    if (display !== 8'h86) $display("FAIL: Expected 8'h86 for value E");
    value = 4'hF; #10;
    if (display !== 8'h8E) $display("FAIL: Expected 8'h8E for value F");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule