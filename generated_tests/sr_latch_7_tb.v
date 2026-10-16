`timescale 1ns/1ps

module tb_sr_latch;

    reg s;
    reg r;
    reg en;
    reg reset;
    wire q;

    // Instantiate the SR latch
    sr_latch uut (
        .s(s),
        .r(r),
        .en(en),
        .reset(reset),
        .q(q)
    );

    initial begin
        // Initialize inputs
        s = 0;
        r = 0;
        en = 0;
        reset = 0;

        // Test 1: Asynchronous reset
        reset = 1; #10;
        if (q !== 1'b0) begin
            $display("FAIL: Asynchronous reset failed");
            $finish;
        end
        reset = 0; #10;

        // Test 2: Enable latch with set
        en = 1; s = 1; r = 0; #10;
        if (q !== 1'b1) begin
            $display("FAIL: Set operation failed");
            $finish;
        end

        // Test 3: Enable latch with reset
        s = 0; r = 1; #10;
        if (q !== 1'b0) begin
            $display("FAIL: Reset operation failed");
            $finish;
        end

        // Test 4: Hold state
        s = 0; r = 0; #10;
        if (q !== 1'b0) begin
            $display("FAIL: Hold operation failed");
            $finish;
        end

        // Test 5: Indeterminate state
        s = 1; r = 1; #10;
        if (q !== 1'bx) begin
            $display("FAIL: Indeterminate state failed");
            $finish;
        end

        // Test 6: Disable latch
        en = 0; s = 0; r = 1; #10;
        if (q !== 1'bx) begin
            $display("FAIL: Disable latch failed");
            $finish;
        end

        // Test 7: Enable latch again
        en = 1; s = 1; r = 0; #10;
        if (q !== 1'b1) begin
            $display("FAIL: Set operation after disable failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule