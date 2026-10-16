`timescale 1ns/1ps

module tb_t_flipflop;

    reg t;
    reg clk;
    reg rst;
    wire q;
    wire qb;

    // Instantiate the module under test (uut)
    t_flipflop uut (
        .t(t),
        .clk(clk),
        .rst(rst),
        .q(q),
        .qb(qb)
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
        #10; // Wait for 10ns
        rst = 0; // Release reset

        // Test case 1: t = 0, expect q = 1, qb = 0
        t = 0; #10; // Wait for one clock cycle
        if (q !== 1'b1 || qb !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: t = 1, expect q = 0, qb = 1
        t = 1; #10; // Wait for one clock cycle
        if (q !== 1'b0 || qb !== 1'b1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: t = 0, expect q = 1, qb = 0
        t = 0; #10; // Wait for one clock cycle
        if (q !== 1'b1 || qb !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: t = 1, expect q = 0, qb = 1
        t = 1; #10; // Wait for one clock cycle
        if (q !== 1'b0 || qb !== 1'b1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Asynchronous reset
        rst = 1; #10; // Apply reset
        if (q !== 1'b0 || qb !== 1'b1) begin
            $display("FAIL: Asynchronous reset failed");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule