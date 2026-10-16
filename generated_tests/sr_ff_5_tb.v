`timescale 1ns/1ps

module tb_sr_ff;
    reg s, r, clk, rst;
    wire q, qbar;

    // Instantiate the SR flip-flop
    sr_ff uut (
        .s(s),
        .r(r),
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
        rst = 1; s = 0; r = 0;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test case 1: Set (s=1, r=0)
        s = 1; r = 0;
        #10;
        if (q !== 1'b1 || qbar !== 1'b0) begin
            $display("FAIL: Test case 1 failed (Set condition)");
            $finish;
        end

        // Test case 2: Reset (s=0, r=1)
        s = 0; r = 1;
        #10;
        if (q !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: Test case 2 failed (Reset condition)");
            $finish;
        end

        // Test case 3: Hold (s=0, r=0)
        s = 0; r = 0;
        #10;
        if (q !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: Test case 3 failed (Hold condition)");
            $finish;
        end

        // Test case 4: Set again (s=1, r=0)
        s = 1; r = 0;
        #10;
        if (q !== 1'b1 || qbar !== 1'b0) begin
            $display("FAIL: Test case 4 failed (Set condition)");
            $finish;
        end

        // Test case 5: Undefined state (s=1, r=1)
        s = 1; r = 1;
        #10;
        if (q !== 1'bx || qbar !== 1'bx) begin
            $display("FAIL: Test case 5 failed (Undefined state)");
            $finish;
        end

        // Test case 6: Reset with rst high
        rst = 1;
        #10;
        if (q !== 1'b1 || qbar !== 1'b0) begin
            $display("FAIL: Test case 6 failed (Reset condition)");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end
endmodule