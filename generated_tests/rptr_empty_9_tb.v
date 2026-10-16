`timescale 1ns/1ps

module tb_rptr_empty;

    reg [4:0] rq2_wptr;
    reg rinc;
    reg rclk;
    reg rrst_n;
    wire rempty;
    wire [3:0] raddr;
    wire [4:0] rptr;

    // Instantiate the module under test (uut)
    rptr_empty uut (
        .rempty(rempty),
        .raddr(raddr),
        .rptr(rptr),
        .rq2_wptr(rq2_wptr),
        .rinc(rinc),
        .rclk(rclk),
        .rrst_n(rrst_n)
    );

    // Clock generation
    initial begin
        rclk = 0;
        forever #5 rclk = ~rclk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rrst_n = 0;
        rinc = 0;
        rq2_wptr = 5'b00000;

        // Reset the design
        #10;
        rrst_n = 1; // Release reset

        // Test 1: Check initial empty state
        if (rempty !== 1'b1) begin
            $display("FAIL: Initial rempty should be 1");
            $finish;
        end

        // Test 2: Increment read pointer and check empty flag
        rinc = 1; // Request to increment
        #10; // Wait for clock edge
        if (rempty !== 1'b1) begin
            $display("FAIL: rempty should still be 1 after incrementing");
            $finish;
        end

        // Test 3: Set write pointer to match read pointer
        rq2_wptr = 5'b00001; // Set write pointer to 1
        #10; // Wait for clock edge
        if (rempty !== 1'b0) begin
            $display("FAIL: rempty should be 0 when rptr matches rq2_wptr");
            $finish;
        end

        // Test 4: Increment again and check empty flag
        rinc = 1; // Request to increment
        #10; // Wait for clock edge
        if (rempty !== 1'b1) begin
            $display("FAIL: rempty should be 1 after incrementing past rq2_wptr");
            $finish;
        end

        // Test 5: Reset and check empty state
        rrst_n = 0; // Assert reset
        #10;
        rrst_n = 1; // Release reset
        if (rempty !== 1'b1) begin
            $display("FAIL: rempty should be 1 after reset");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule