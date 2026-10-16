`timescale 1ns/1ps

module tb_loadreg;

  reg clk;
  reg reset;
  reg load;
  reg [3:0] fourBitIn;
  wire [3:0] fourBitOut;

  // Instantiate the module under test (uut)
  loadreg uut (
    .clk(clk),
    .reset(reset),
    .load(load),
    .fourBitIn(fourBitIn),
    .fourBitOut(fourBitOut)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    load = 0;
    fourBitIn = 4'b0000;

    // Wait for a clock cycle
    #10;

    // Test case 1: Reset high, load low
    reset = 1; load = 0; fourBitIn = 4'b1010; 
    #10;
    if (fourBitOut !== 4'b0000) $display("FAIL: Expected 0000, got %b", fourBitOut);

    // Test case 2: Reset high, load high
    reset = 1; load = 1; fourBitIn = 4'b1010; 
    #10;
    if (fourBitOut !== 4'b1010) $display("FAIL: Expected 1010, got %b", fourBitOut);

    // Test case 3: Reset low
    reset = 0; 
    #10;
    if (fourBitOut !== 4'b0000) $display("FAIL: Expected 0000, got %b", fourBitOut);

    // Test case 4: Reset high, load low again
    reset = 1; load = 0; fourBitIn = 4'b1111; 
    #10;
    if (fourBitOut !== 4'b0000) $display("FAIL: Expected 0000, got %b", fourBitOut);

    // Test case 5: Reset high, load high with new input
    reset = 1; load = 1; fourBitIn = 4'b1111; 
    #10;
    if (fourBitOut !== 4'b1111) $display("FAIL: Expected 1111, got %b", fourBitOut);

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule