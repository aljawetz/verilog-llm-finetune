`timescale 1ns/1ps

module tb_jk_ff;

reg clk;
reg rst;
reg J;
reg K;
wire q;
wire q_bar;

// Instantiate the jk_ff module
jk_ff uut (
    .q(q),
    .q_bar(q_bar),
    .J(J),
    .K(K),
    .clk(clk),
    .rst(rst)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    J = 0;
    K = 0;

    // Apply reset
    rst = 1; // Active low reset
    #10;
    rst = 0; // Deactivate reset
    #10;

    // Test case 1: Hold state (J=0, K=0)
    J = 0; K = 0;
    #10;
    if (q !== 0) $display("FAIL: Test case 1 failed, expected q=0, got q=%b", q);

    // Test case 2: Reset state (J=0, K=1)
    J = 0; K = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);

    // Test case 3: Set state (J=1, K=0)
    J = 1; K = 0;
    #10;
    if (q !== 1) $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);

    // Test case 4: Toggle state (J=1, K=1)
    J = 1; K = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
    #10;
    if (q !== 1) $display("FAIL: Test case 4 failed, expected q=1, got q=%b", q);

    // Test case 5: Reset state again (J=0, K=1)
    J = 0; K = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 5 failed, expected q=0, got q=%b", q);

    // Test case 6: Hold state (J=0, K=0)
    J = 0; K = 0;
    #10;
    if (q !== 0) $display("FAIL: Test case 6 failed, expected q=0, got q=%b", q);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule