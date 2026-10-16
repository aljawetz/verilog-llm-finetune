`timescale 1ns/1ps

module tb_t_flipflop;

    reg t;
    reg clk;
    reg reset;
    wire q;

    // Instantiate the T flip-flop module
    t_flipflop uut (
        .t(t),
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        t = 0;
        #10; // Wait for a clock edge
        
        // Release reset
        reset = 0;
        #10;

        // Test case 1: T = 0, Q should remain the same
        t = 0;
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", q);
            $finish;
        end

        // Test case 2: T = 1, Q should toggle
        t = 1;
        #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: Expected Q=1, got Q=%b", q);
            $finish;
        end

        // Test case 3: T = 1, Q should toggle again
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", q);
            $finish;
        end

        // Test case 4: T = 0, Q should remain the same
        t = 0;
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", q);
            $finish;
        end

        // Test case 5: Assert reset, Q should be 0
        reset = 1;
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Expected Q=0 after reset, got Q=%b", q);
            $finish;
        end

        // Test case 6: Release reset, T = 1, Q should toggle
        reset = 0;
        t = 1;
        #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: Expected Q=1 after reset released, got Q=%b", q);
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule