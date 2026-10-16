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

    // Test case 1: Hold state (J=0, K=0)
    J = 0; K = 0; #10;
    if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

    // Test case 2: Reset (J=0, K=1)
    J = 0; K = 1; #10;
    if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

    // Test case 3: Set (J=1, K=0)
    J = 1; K = 0; #10;
    if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

    // Test case 4: Toggle (J=1, K=1)
    J = 1; K = 1; #10;
    if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);
    #10;
    if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

    // Test case 5: Hold state again (J=0, K=0)
    J = 0; K = 0; #10;
    if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

    // Test case 6: Reset (J=0, K=1)
    J = 0; K = 1; #10;
    if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule