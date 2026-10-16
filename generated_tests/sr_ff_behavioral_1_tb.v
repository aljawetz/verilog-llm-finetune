`timescale 1ns/1ps

module tb_sr_ff_behavioral;

    reg s;
    reg r;
    reg clk;
    wire q;
    wire qn;

    // Instantiate the SR Flip-Flop
    sr_ff_behavioral uut (
        .s(s),
        .r(r),
        .clk(clk),
        .q(q),
        .qn(qn)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        s = 0;
        r = 0;

        // Test case 1: Set condition
        #10; // Wait for one clock cycle
        s = 1; r = 0; // Set
        #10;
        if (q !== 1 || qn !== 0) begin
            $display("FAIL: Test case 1 failed (Set condition)");
            $finish;
        end

        // Test case 2: Reset condition
        #10; // Wait for one clock cycle
        s = 0; r = 1; // Reset
        #10;
        if (q !== 0 || qn !== 1) begin
            $display("FAIL: Test case 2 failed (Reset condition)");
            $finish;
        end

        // Test case 3: Hold condition
        #10; // Wait for one clock cycle
        s = 0; r = 0; // Hold
        #10;
        if (q !== 0 || qn !== 1) begin
            $display("FAIL: Test case 3 failed (Hold condition)");
            $finish;
        end

        // Test case 4: Indeterminate condition
        #10; // Wait for one clock cycle
        s = 1; r = 1; // Indeterminate
        #10;
        if (q !== 1'bx || qn !== 1'bx) begin
            $display("FAIL: Test case 4 failed (Indeterminate condition)");
            $finish;
        end

        // Test case 5: Check hold after indeterminate
        #10; // Wait for one clock cycle
        s = 0; r = 0; // Hold
        #10;
        if (q !== 1'bx || qn !== 1'bx) begin
            $display("FAIL: Test case 5 failed (Hold after Indeterminate)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule