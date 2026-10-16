`timescale 1ns/1ps

module tb_D_FF_16;

    reg [15:0] D;
    reg clk;
    reg reset;
    wire [15:0] Q;

    // Instantiate the module under test (uut)
    D_FF_16 uut (
        .D(D),
        .clk(clk),
        .reset(reset),
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
        D = 16'h0000;
        reset = 1;

        // Wait for a clock cycle
        #10;

        // Test case 1: Reset is high, D should be transferred to Q
        D = 16'hA5A5; // Arbitrary test value
        #10; // Wait for clock edge
        if (Q !== 16'hA5A5) begin
            $display("FAIL: Expected Q = 16'hA5A5, got Q = %h", Q);
            $finish;
        end

        // Test case 2: Reset goes low, Q should be set to 0
        reset = 0;
        #10; // Wait for clock edge
        if (Q !== 16'h0000) begin
            $display("FAIL: Expected Q = 16'h0000, got Q = %h", Q);
            $finish;
        end

        // Test case 3: Reset goes high again, D should be transferred to Q
        reset = 1;
        D = 16'hFFFF; // Another test value
        #10; // Wait for clock edge
        if (Q !== 16'hFFFF) begin
            $display("FAIL: Expected Q = 16'hFFFF, got Q = %h", Q);
            $finish;
        end

        // Test case 4: Reset goes low again, Q should be set to 0
        reset = 0;
        #10; // Wait for clock edge
        if (Q !== 16'h0000) begin
            $display("FAIL: Expected Q = 16'h0000, got Q = %h", Q);
            $finish;
        end

        // Test case 5: Reset is high, D changes, Q should reflect D
        reset = 1;
        D = 16'h1234; // Another test value
        #10; // Wait for clock edge
        if (Q !== 16'h1234) begin
            $display("FAIL: Expected Q = 16'h1234, got Q = %h", Q);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule