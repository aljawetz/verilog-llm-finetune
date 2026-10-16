`timescale 1ns/1ps

module tb_srff;

    reg clk;
    reg reset;
    reg s;
    reg r;
    wire q;

    // Instantiate the SR Flip-Flop
    srff uut (
        .clk(clk),
        .reset(reset),
        .s(s),
        .r(r),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        s = 0;
        r = 0;

        // Wait for a clock cycle
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Set (s=1, r=0)
        s = 1; r = 0;
        #10;
        if (q !== 1'b1) begin
            $display("FAIL: Expected q=1 after Set, got q=%b", q);
            $finish;
        end

        // Test case 2: Reset (s=0, r=1)
        s = 0; r = 1;
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: Expected q=0 after Reset, got q=%b", q);
            $finish;
        end

        // Test case 3: Hold (s=0, r=0)
        s = 0; r = 0;
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: Expected q=0 after Hold, got q=%b", q);
            $finish;
        end

        // Test case 4: Set again (s=1, r=0)
        s = 1; r = 0;
        #10;
        if (q !== 1'b1) begin
            $display("FAIL: Expected q=1 after Set, got q=%b", q);
            $finish;
        end

        // Test case 5: Invalid state (s=1, r=1)
        s = 1; r = 1;
        #10;
        if (q !== 1'bx) begin
            $display("FAIL: Expected q=x after invalid state, got q=%b", q);
            $finish;
        end

        // Test case 6: Reset again (s=0, r=1)
        s = 0; r = 1;
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: Expected q=0 after Reset, got q=%b", q);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule