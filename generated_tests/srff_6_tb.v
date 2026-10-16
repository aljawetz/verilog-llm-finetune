`timescale 1ns/1ps

module tb_srff;

    reg s, r, clk, rst;
    wire q, qbar;

    // Instantiate the SR flip-flop
    srff uut (
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
        // Initialize signals
        rst = 1; s = 0; r = 0;
        #10; // Wait for reset to take effect
        rst = 0;

        // Test case 1: Check reset condition
        if (q !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test case 2: Set condition
        s = 1; r = 0; #10;
        if (q !== 1'b1 || qbar !== 1'b0) begin
            $display("FAIL: Set condition failed");
            $finish;
        end

        // Test case 3: Reset condition
        s = 0; r = 1; #10;
        if (q !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: Reset condition failed");
            $finish;
        end

        // Test case 4: Hold condition
        s = 0; r = 0; #10;
        if (q !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: Hold condition failed");
            $finish;
        end

        // Test case 5: Set condition again
        s = 1; r = 0; #10;
        if (q !== 1'b1 || qbar !== 1'b0) begin
            $display("FAIL: Set condition failed again");
            $finish;
        end

        // Test case 6: Undefined state
        s = 1; r = 1; #10;
        if (q !== 1'bx || qbar !== 1'bx) begin
            $display("FAIL: Undefined state condition failed");
            $finish;
        end

        // Test case 7: Reset after undefined state
        rst = 1; #10;
        if (q !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: Reset after undefined state failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule