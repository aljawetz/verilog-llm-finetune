`timescale 1ns/1ps

module tb_jk_ff;

reg clk;
reg J;
reg K;
wire q;

// Instantiate the jk_ff module
jk_ff uut (
    .clk(clk),
    .J(J),
    .K(K),
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
    J = 0;
    K = 0;
    
    // Wait for the first clock edge
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: Initial state is not 1");
        $finish;
    end

    // Test reset condition (J=0, K=1)
    J = 0; K = 1; 
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Expected q=0 when J=0, K=1");
        $finish;
    end

    // Test set condition (J=1, K=0)
    J = 1; K = 0; 
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: Expected q=1 when J=1, K=0");
        $finish;
    end

    // Test toggle condition (J=1, K=1)
    J = 1; K = 1; 
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Expected q=0 after toggle when J=1, K=1");
        $finish;
    end

    // Toggle again
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: Expected q=1 after toggle when J=1, K=1");
        $finish;
    end

    // Test hold condition (J=0, K=0)
    J = 0; K = 0; 
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: Expected q=1 when J=0, K=0");
        $finish;
    end

    // Final toggle test
    J = 1; K = 1; 
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Expected q=0 after final toggle when J=1, K=1");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule