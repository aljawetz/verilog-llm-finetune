`timescale 1ns/1ps

module tb_jk;

reg j, k, clk, rst;
wire q;

// Instantiate the module under test
jk uut (
    .j(j),
    .k(k),
    .clk(clk),
    .rst(rst),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    j = 0; k = 0; rst = 1; // Start with reset
    #10;

    // Release reset
    rst = 0;
    #10;

    // Test case 1: J=0, K=0 (Q should remain unchanged)
    j = 0; k = 0;
    #10;
    if (q !== 0) $display("FAIL: Test case 1 failed, expected Q=0, got Q=%b", q);

    // Test case 2: J=0, K=1 (Q should reset to 0)
    j = 0; k = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 2 failed, expected Q=0, got Q=%b", q);

    // Test case 3: J=1, K=0 (Q should set to 1)
    j = 1; k = 0;
    #10;
    if (q !== 1) $display("FAIL: Test case 3 failed, expected Q=1, got Q=%b", q);

    // Test case 4: J=1, K=1 (Q should toggle)
    j = 1; k = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 4 failed, expected Q=0, got Q=%b", q);
    #10;
    if (q !== 1) $display("FAIL: Test case 4 failed, expected Q=1, got Q=%b", q);

    // Test case 5: J=0, K=1 (Q should reset to 0 again)
    j = 0; k = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 5 failed, expected Q=0, got Q=%b", q);

    // Test case 6: Asynchronous reset
    rst = 1; // Assert reset
    #10;
    if (q !== 0) $display("FAIL: Test case 6 failed, expected Q=0 after reset, got Q=%b", q);
    
    // Release reset
    rst = 0;
    #10;

    // Final check: J=1, K=1 (should toggle)
    j = 1; k = 1;
    #10;
    if (q !== 1) $display("FAIL: Final check failed, expected Q=1, got Q=%b", q);
    #10;
    if (q !== 0) $display("FAIL: Final check failed, expected Q=0, got Q=%b", q);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule