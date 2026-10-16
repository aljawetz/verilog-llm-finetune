`timescale 1ns/1ps

module tb_sync_w2r;

    // Parameters
    parameter ADDRSIZE = 4;

    // Testbench signals
    reg [ADDRSIZE:0] wptr;
    reg rclk;
    reg rrst_n;
    wire [ADDRSIZE:0] rq2_wptr;

    // Instantiate the module under test (uut)
    sync_w2r #(ADDRSIZE) uut (
        .rq2_wptr(rq2_wptr),
        .wptr(wptr),
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
        // Initialize signals
        rrst_n = 0; // Assert reset
        wptr = 5'b00000;
        #10; // Wait for 10ns
        rrst_n = 1; // Release reset

        // Test case 1: Check reset behavior
        #10;
        if (rq2_wptr !== 5'b00000) begin
            $display("FAIL: rq2_wptr should be 0 after reset");
            $finish;
        end

        // Test case 2: Write pointer propagation
        wptr = 5'b00001; #10; // Write 1
        if (rq2_wptr !== 5'b00000) begin
            $display("FAIL: rq2_wptr should still be 0 before next clock edge");
            $finish;
        end

        // Clock edge
        #10; // Wait for clock edge
        if (rq2_wptr !== 5'b00001) begin
            $display("FAIL: rq2_wptr should be 1 after clock edge");
            $finish;
        end

        // Test case 3: Change write pointer
        wptr = 5'b00010; #10; // Write 2
        #10; // Wait for clock edge
        if (rq2_wptr !== 5'b00010) begin
            $display("FAIL: rq2_wptr should be 2 after clock edge");
            $finish;
        end

        // Test case 4: Check multiple writes
        wptr = 5'b00011; #10; // Write 3
        #10; // Wait for clock edge
        if (rq2_wptr !== 5'b00011) begin
            $display("FAIL: rq2_wptr should be 3 after clock edge");
            $finish;
        end

        // Test case 5: Check reset again
        rrst_n = 0; #10; // Assert reset
        rrst_n = 1; #10; // Release reset
        if (rq2_wptr !== 5'b00000) begin
            $display("FAIL: rq2_wptr should be 0 after reset");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule