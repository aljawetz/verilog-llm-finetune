`timescale 1ns/1ps

module tb_d_ff;

    reg d;
    reg clk;
    reg rst;
    wire q;
    wire qb;

    // Instantiate the D flip-flop
    d_ff uut (
        .q(q),
        .qb(qb),
        .d(d),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1; // Start with reset
        d = 0;

        // Wait for a clock cycle
        #10;
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qb to 1");
            $finish;
        end

        // Release reset
        rst = 0;

        // Test case 1: d = 0
        #10; // Wait for clock edge
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Expected q = 0, qb = 1 but got q = %b, qb = %b", q, qb);
            $finish;
        end

        // Test case 2: d = 1
        d = 1;
        #10; // Wait for clock edge
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: Expected q = 1, qb = 0 but got q = %b, qb = %b", q, qb);
            $finish;
        end

        // Test case 3: d = 0 again
        d = 0;
        #10; // Wait for clock edge
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Expected q = 0, qb = 1 but got q = %b, qb = %b", q, qb);
            $finish;
        end

        // Test case 4: Assert reset again
        rst = 1;
        #10; // Wait for clock edge
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qb to 1");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule