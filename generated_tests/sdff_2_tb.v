`timescale 1ns/1ps

module tb_sdff;

    reg clk;
    reg r;
    reg se;
    reg si;
    reg d;
    wire q;

    // Instantiate the module under test (uut)
    sdff uut (
        .clk(clk),
        .r(r),
        .se(se),
        .si(si),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        r = 0; se = 0; si = 0; d = 0;

        // Test case 1: Normal operation with d = 1
        d = 1; 
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Test case 1 failed, expected q = 1, got q = %b", q);
            $finish;
        end

        // Test case 2: Reset the flip-flop
        r = 1; 
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Test case 2 failed, expected q = 0, got q = %b", q);
            $finish;
        end

        // Test case 3: Set se to 1 and check if q goes to 0
        r = 0; se = 1; 
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Test case 3 failed, expected q = 0, got q = %b", q);
            $finish;
        end

        // Test case 4: Set se to 0 and d to 0, check q remains 0
        se = 0; d = 0; 
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Test case 4 failed, expected q = 0, got q = %b", q);
            $finish;
        end

        // Test case 5: Set d to 1 and check q updates
        d = 1; 
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Test case 5 failed, expected q = 1, got q = %b", q);
            $finish;
        end

        // Test case 6: Reset again
        r = 1; 
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Test case 6 failed, expected q = 0, got q = %b", q);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule