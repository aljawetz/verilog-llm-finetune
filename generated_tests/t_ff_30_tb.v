`timescale 1ns/1ps

module tb_t_ff;

reg T;
reg Clk;
wire Q;
wire Qbar;

// Instantiate the T flip-flop module
t_ff uut (
    .T(T),
    .Clk(Clk),
    .Q(Q),
    .Qbar(Qbar)
);

// Clock generation
initial begin
    Clk = 0;
    forever #5 Clk = ~Clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    T = 0;

    // Wait for the first clock edge
    #10;
    if (Q !== 1'b1 || Qbar !== 1'b0) begin
        $display("FAIL: Initial state incorrect");
        $finish;
    end

    // Test T = 0
    T = 0;
    #10;
    if (Q !== 1'b1 || Qbar !== 1'b0) begin
        $display("FAIL: Q and Qbar incorrect for T=0");
        $finish;
    end

    // Test T = 1
    T = 1;
    #10;
    if (Q !== 1'b0 || Qbar !== 1'b1) begin
        $display("FAIL: Q and Qbar incorrect for T=1");
        $finish;
    end

    // Test T = 0 again
    T = 0;
    #10;
    if (Q !== 1'b1 || Qbar !== 1'b0) begin
        $display("FAIL: Q and Qbar incorrect for T=0");
        $finish;
    end

    // Test T = 1 again
    T = 1;
    #10;
    if (Q !== 1'b0 || Qbar !== 1'b1) begin
        $display("FAIL: Q and Qbar incorrect for T=1");
        $finish;
    end

    // Final check
    T = 0;
    #10;
    if (Q !== 1'b1 || Qbar !== 1'b0) begin
        $display("FAIL: Q and Qbar incorrect for T=0");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule