`timescale 1ns/1ps

module tb_jkff;

reg J, K, rst, clk;
wire Q;

// Instantiate the module under test
jkff uut (
    .J(J),
    .K(K),
    .rst(rst),
    .clk(clk),
    .Q(Q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
end

// Test sequence
initial begin
    // Initialize
    rst = 1; J = 0; K = 0;
    #10; // Wait for a clock cycle
    rst = 0; // Release reset

    // Test case 1: Hold state (00)
    J = 0; K = 0; #10;
    if (Q !== 0) $display("FAIL: Test case 1 failed, expected Q=0, got Q=%b", Q);

    // Test case 2: Reset (01)
    J = 0; K = 1; #10;
    if (Q !== 0) $display("FAIL: Test case 2 failed, expected Q=0, got Q=%b", Q);

    // Test case 3: Set (10)
    J = 1; K = 0; #10;
    if (Q !== 1) $display("FAIL: Test case 3 failed, expected Q=1, got Q=%b", Q);

    // Test case 4: Toggle (11)
    J = 1; K = 1; #10;
    if (Q !== 0) $display("FAIL: Test case 4 failed, expected Q=0, got Q=%b", Q);
    
    // Toggle again
    #10;
    if (Q !== 1) $display("FAIL: Test case 4 failed on second toggle, expected Q=1, got Q=%b", Q);

    // Final state check
    #10;
    if (Q !== 1) $display("FAIL: Final state check failed, expected Q=1, got Q=%b", Q);

    // If all assertions passed
    $display("PASS");
    $finish;
end

endmodule