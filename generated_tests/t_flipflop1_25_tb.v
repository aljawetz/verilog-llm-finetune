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
        rst = 1; t = 0;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test case 1: Check reset functionality
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test case 2: Toggle q when t=1
        t = 1; 
        #10; // Wait for falling edge of clk
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: q did not toggle to 1 when t=1");
            $finish;
        end

        #10; // Wait for next falling edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: q did not toggle back to 0 on next clk edge");
            $finish;
        end

        // Test case 3: No toggle when t=0
        t = 0; 
        #10; // Wait for falling edge of clk
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: q toggled when t=0");
            $finish;
        end

        // Test case 4: Toggle q again with t=1
        t = 1; 
        #10; // Wait for falling edge of clk
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: q did not toggle to 1 when t=1 again");
            $finish;
        end

        // Test case 5: Assert reset
        rst = 1; 
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1 again");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule