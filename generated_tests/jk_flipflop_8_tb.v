`timescale 1ns/1ps

module tb_jk_flipflop;

    reg j;
    reg k;
    reg clk;
    reg rst;
    wire q;
    wire qb;

    // Instantiate the jk_flipflop module
    jk_flipflop uut (
        .j(j),
        .k(k),
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
        // Initialize inputs
        j = 0; k = 0; rst = 1; #10; // Apply reset
        rst = 0; #10;

        // Test case 1: J=0, K=0 (no change)
        j = 0; k = 0; #10;
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: J=0, K=1 (reset)
        j = 0; k = 1; #10;
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: J=1, K=0 (set)
        j = 1; k = 0; #10;
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: J=0, K=0 (no change)
        j = 0; k = 0; #10;
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: J=1, K=1 (toggle)
        j = 1; k = 1; #10;
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: J=1, K=1 (toggle again)
        #10;
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: Reset the flip-flop
        rst = 1; #10;
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule