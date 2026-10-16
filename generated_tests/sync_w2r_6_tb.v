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
        wptr = 4'b0000;
        #10; // Wait for 10ns
        rrst_n = 1; // Deassert reset
        #10;

        // Test case 1: Check reset behavior
        if (rq2_wptr !== 4'b0000) begin
            $display("FAIL: rq2_wptr should be 0 after reset");
            $finish;
        end

        // Test case 2: Write pointer value propagation
        wptr = 4'b1010; // Set write pointer
        #10; // Wait for clock edge
        if (rq2_wptr !== 4'b0000) begin
            $display("FAIL: rq2_wptr should still be 0 before next clock edge");
            $finish;
        end

        // Test case 3: Check propagation after clock edge
        #10; // Wait for next clock edge
        if (rq2_wptr !== 4'b1010) begin
            $display("FAIL: rq2_wptr should be 1010 after clock edge");
            $finish;
        end

        // Test case 4: Change write pointer value
        wptr = 4'b1111; // Change write pointer
        #10; // Wait for clock edge
        if (rq2_wptr !== 4'b1010) begin
            $display("FAIL: rq2_wptr should still be 1010 before next clock edge");
            $finish;
        end

        // Test case 5: Check propagation after clock edge
        #10; // Wait for next clock edge
        if (rq2_wptr !== 4'b1111) begin
            $display("FAIL: rq2_wptr should be 1111 after clock edge");
            $finish;
        end

        // Test case 6: Assert reset again
        rrst_n = 0; // Assert reset
        #10;
        if (rq2_wptr !== 4'b0000) begin
            $display("FAIL: rq2_wptr should be 0 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule