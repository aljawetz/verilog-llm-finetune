`timescale 1ns/1ps

module tb_jk_to_d_flipflop;
    reg clk;
    reg reset;
    reg D;
    wire Q;

    // Instantiate the module under test
    jk_to_d_flipflop uut (
        .clk(clk),
        .reset(reset),
        .D(D),
        .Q(Q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        D = 0;
        #10; // Wait for reset to take effect
        reset = 0;

        // Test case 1: Set D = 1
        D = 1;
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Expected Q = 1, got Q = %b", Q);
            $finish;
        end

        // Test case 2: Hold D = 1
        #10; // Wait for another clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Expected Q = 1, got Q = %b", Q);
            $finish;
        end

        // Test case 3: Set D = 0
        D = 0;
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Expected Q = 0, got Q = %b", Q);
            $finish;
        end

        // Test case 4: Hold D = 0
        #10; // Wait for another clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Expected Q = 0, got Q = %b", Q);
            $finish;
        end

        // Test case 5: Asynchronous reset
        reset = 1;
        #10; // Wait for reset to take effect
        if (Q !== 1'b0) begin
            $display("FAIL: Expected Q = 0 after reset, got Q = %b", Q);
            $finish;
        end

        // Test case 6: Set D = 1 after reset
        reset = 0;
        D = 1;
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Expected Q = 1, got Q = %b", Q);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end
endmodule