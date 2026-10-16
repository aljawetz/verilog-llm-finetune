`timescale 1ns/1ps

module tb_Day19_JK_FF;

  reg j;
  reg k;
  reg clk;
  reg rst;
  wire Q;

  // Instantiate the module under test
  Day19_JK_FF uut (
    .j(j),
    .k(k),
    .clk(clk),
    .rst(rst),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    j = 0; k = 0; rst = 1; // Reset state
    #10;

    // Release reset
    rst = 0;
    #10;

    // Test case 1: Hold state (j=0, k=0)
    j = 0; k = 0;
    #10;
    if (Q !== 0) $display("FAIL: Expected Q=0 after hold state, got Q=%b", Q);

    // Test case 2: Reset state (j=0, k=1)
    j = 0; k = 1;
    #10;
    if (Q !== 0) $display("FAIL: Expected Q=0 after reset state, got Q=%b", Q);

    // Test case 3: Set state (j=1, k=0)
    j = 1; k = 0;
    #10;
    if (Q !== 1) $display("FAIL: Expected Q=1 after set state, got Q=%b", Q);

    // Test case 4: Toggle state (j=1, k=1)
    j = 1; k = 1;
    #10;
    if (Q !== 0) $display("FAIL: Expected Q=0 after toggle state, got Q=%b", Q);
    
    #10; // Wait for next clock edge
    if (Q !== 1) $display("FAIL: Expected Q=1 after toggle state, got Q=%b", Q);

    // Test case 5: Clear state (j=0, k=1)
    j = 0; k = 1;
    #10;
    if (Q !== 0) $display("FAIL: Expected Q=0 after clear state, got Q=%b", Q);

    // Test case 6: Hold state again (j=0, k=0)
    j = 0; k = 0;
    #10;
    if (Q !== 0) $display("FAIL: Expected Q=0 after hold state, got Q=%b", Q);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule