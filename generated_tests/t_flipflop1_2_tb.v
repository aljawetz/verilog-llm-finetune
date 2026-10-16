`timescale 1ns/1ps

module tb_t_flipflop1;

    reg t;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the module under test (uut)
    t_flipflop1 uut (
        .t(t),
        .clk(clk),
        .rst(rst),
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
        rst = 0;

        // Test reset functionality
        rst = 1; #10; // Assert reset
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        rst = 0; #10; // Deassert reset

        // Test toggling behavior
        t = 1; #10; // Set t high, expect q to toggle
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Expected q=1, qbar=0 after toggle");
            $finish;
        end

        #10; // Wait for next clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Expected q=0, qbar=1 after toggle");
            $finish;
        end

        // Test toggling again
        #10; // Wait for next clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Expected q=1, qbar=0 after toggle");
            $finish;
        end

        // Test with t low
        t = 0; #10; // Set t low, expect no toggle
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Expected q=1, qbar=0 with t=0");
            $finish;
        end

        // Final toggle with t high
        t = 1; #10; // Set t high again
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Expected q=0, qbar=1 after toggle");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule