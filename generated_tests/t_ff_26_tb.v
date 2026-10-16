`timescale 1ns/1ps

module tb_t_ff;

    reg t;
    reg clk;
    wire q;
    wire qbar;

    // Instantiate the T flip-flop module
    t_ff uut (
        .t(t),
        .clk(clk),
        .q(q),
        .qbar(qbar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        t = 0;

        // Wait for the first clock edge
        #10;
        if (q !== 1'b1 || qbar !== 1'b0) begin
            $display("FAIL: Initial state after reset failed");
            $finish;
        end

        // Test case 1: t = 0
        t = 0;
        #10; // Wait for the next clock edge
        if (q !== 1'b1 || qbar !== 1'b0) begin
            $display("FAIL: Expected q=1, qbar=0 when t=0");
            $finish;
        end

        // Test case 2: t = 1
        t = 1;
        #10; // Wait for the next clock edge
        if (q !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: Expected q=0, qbar=1 when t=1");
            $finish;
        end

        // Test case 3: t = 0 again
        t = 0;
        #10; // Wait for the next clock edge
        if (q !== 1'b1 || qbar !== 1'b0) begin
            $display("FAIL: Expected q=1, qbar=0 when t=0");
            $finish;
        end

        // Test case 4: t = 1 again
        t = 1;
        #10; // Wait for the next clock edge
        if (q !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: Expected q=0, qbar=1 when t=1");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule