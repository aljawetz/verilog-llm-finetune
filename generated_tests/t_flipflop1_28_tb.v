`timescale 1ns/1ps

module tb_t_flipflop1;

    reg t;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the T flip-flop module
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
        // Initialize
        rst = 1; t = 0;
        #10; // Wait for a clock edge
        rst = 0; // Release reset

        // Test case 1: Check reset functionality
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test case 2: Toggle q with t = 1
        t = 1; // Set T to toggle
        #10; // Wait for a clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: q did not toggle to 1 when t=1");
            $finish;
        end

        // Test case 3: Toggle q back with t = 1
        #10; // Wait for a clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: q did not toggle back to 0 when t=1");
            $finish;
        end

        // Test case 4: No toggle with t = 0
        t = 0; // Set T to not toggle
        #10; // Wait for a clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: q should remain 0 when t=0");
            $finish;
        end

        // Test case 5: Toggle q with t = 1 again
        t = 1; // Set T to toggle
        #10; // Wait for a clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: q did not toggle to 1 when t=1 again");
            $finish;
        end

        // Test case 6: Reset functionality again
        rst = 1; // Assert reset
        #10; // Wait for a clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1 again");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule