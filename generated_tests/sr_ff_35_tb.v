`timescale 1ns/1ps

module tb_sr_ff;

    reg s;
    reg r;
    reg clk;
    wire q;
    wire q_bar;

    // Instantiate the SR Flip-Flop
    sr_ff uut (
        .s(s),
        .r(r),
        .clk(clk),
        .q(q),
        .q_bar(q_bar)
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

        // Wait for the first clock edge
        #10;

        // Test case 1: Set condition (s=1, r=0)
        s = 1; r = 0; 
        #10;
        if (q !== 1 || q_bar !== 0) begin
            $display("FAIL: Test case 1 failed (Set condition)");
            $finish;
        end

        // Test case 2: Reset condition (s=0, r=1)
        s = 0; r = 1; 
        #10;
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Test case 2 failed (Reset condition)");
            $finish;
        end

        // Test case 3: Hold condition (s=0, r=0)
        s = 0; r = 0; 
        #10;
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Test case 3 failed (Hold condition)");
            $finish;
        end

        // Test case 4: Set condition again (s=1, r=0)
        s = 1; r = 0; 
        #10;
        if (q !== 1 || q_bar !== 0) begin
            $display("FAIL: Test case 4 failed (Set condition again)");
            $finish;
        end

        // Test case 5: Invalid condition (s=1, r=1)
        s = 1; r = 1; 
        #10;
        if (q !== 1'bx || q_bar !== 1'bx) begin
            $display("FAIL: Test case 5 failed (Invalid condition)");
            $finish;
        end

        // Test case 6: Hold condition (s=0, r=0)
        s = 0; r = 0; 
        #10;
        if (q !== 1'bx || q_bar !== 1'bx) begin
            $display("FAIL: Test case 6 failed (Hold condition after invalid)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule