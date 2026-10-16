`timescale 1ns/1ps

module tb_sync_w2r;

    reg rclk;
    reg rrst_n;
    reg [3:0] wptr;
    wire [3:0] rq2_wptr;

    // Instantiate the module under test (uut)
    sync_w2r uut (
        .rclk(rclk),
        .rrst_n(rrst_n),
        .wptr(wptr),
        .rq2_wptr(rq2_wptr)
    );

    // Clock generation
    initial begin
        rclk = 0;
        forever #5 rclk = ~rclk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        rrst_n = 0; // Assert reset
        wptr = 4'b0000; // Initial write pointer

        // Release reset
        #10 rrst_n = 1; // Deassert reset
        #10;

        // Test case 1: Check initial state after reset
        if (rq2_wptr !== 4'b0000) begin
            $display("FAIL: Initial state after reset is incorrect");
            $finish;
        end

        // Test case 2: Write pointer value propagation
        wptr = 4'b1010; // Set write pointer
        #10; // Wait for one clock cycle
        if (rq2_wptr !== 4'b0000) begin
            $display("FAIL: rq2_wptr should be 0000 after reset");
            $finish;
        end

        // Test case 3: Check propagation of wptr
        #10; // Wait for another clock cycle
        if (rq2_wptr !== 4'b1010) begin
            $display("FAIL: rq2_wptr should be 1010 after one clock cycle");
            $finish;
        end

        // Test case 4: Change wptr and check propagation
        wptr = 4'b1111; // Change write pointer
        #10; // Wait for one clock cycle
        if (rq2_wptr !== 4'b1010) begin
            $display("FAIL: rq2_wptr should be 1010 before next clock cycle");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (rq2_wptr !== 4'b1111) begin
            $display("FAIL: rq2_wptr should be 1111 after two clock cycles");
            $finish;
        end

        // Test case 5: Assert reset and check state
        rrst_n = 0; // Assert reset
        #10; // Wait for reset to take effect
        if (rq2_wptr !== 4'b0000) begin
            $display("FAIL: rq2_wptr should be 0000 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule