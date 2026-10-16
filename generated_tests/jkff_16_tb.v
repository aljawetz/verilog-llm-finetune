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
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    rst = 1; J = 0; K = 0;
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Test case 1: J=0, K=0 (Q should remain unchanged)
    J = 0; K = 0; #10;
    if (Q !== 0) begin
        $display("FAIL: Q should remain 0 when J=0, K=0 after reset");
        $finish;
    end

    // Test case 2: J=0, K=1 (Q should go to 0)
    J = 0; K = 1; #10;
    if (Q !== 0) begin
        $display("FAIL: Q should be 0 when J=0, K=1");
        $finish;
    end

    // Test case 3: J=1, K=0 (Q should go to 1)
    J = 1; K = 0; #10;
    if (Q !== 1) begin
        $display("FAIL: Q should be 1 when J=1, K=0");
        $finish;
    end

    // Test case 4: J=1, K=1 (Q should toggle)
    J = 1; K = 1; #10;
    if (Q !== 0) begin
        $display("FAIL: Q should be 0 after toggle when J=1, K=1");
        $finish;
    end

    // Test case 5: J=1, K=1 (Q should toggle again)
    #10;
    if (Q !== 1) begin
        $display("FAIL: Q should be 1 after toggle when J=1, K=1 again");
        $finish;
    end

    // Test case 6: J=0, K=0 (Q should remain unchanged)
    J = 0; K = 0; #10;
    if (Q !== 1) begin
        $display("FAIL: Q should remain 1 when J=0, K=0 after toggle");
        $finish;
    end

    // Test case 7: Reset the flip-flop
    rst = 1; #10;
    rst = 0; #10;
    if (Q !== 0) begin
        $display("FAIL: Q should be 0 after reset");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule