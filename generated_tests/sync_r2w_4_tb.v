`timescale 1ns/1ps

module tb_sync_r2w;

    reg wclk;
    reg wrst_n;
    reg [3:0] rptr;
    wire [3:0] wq2_rptr;

    // Instantiate the module under test (uut)
    sync_r2w uut (
        .wclk(wclk),
        .wrst_n(wrst_n),
        .rptr(rptr),
        .wq2_rptr(wq2_rptr)
    );

    // Clock generation
    initial begin
        wclk = 0;
        forever #5 wclk = ~wclk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        wrst_n = 0; // Assert reset
        rptr = 4'b0000;
        #10;

        // Release reset
        wrst_n = 1;
        #10;

        // Test case 1: Check initial state after reset
        if (wq2_rptr !== 4'b0000) begin
            $display("FAIL: Initial state after reset is incorrect");
            $finish;
        end

        // Test case 2: Write rptr value and check wq2_rptr
        rptr = 4'b1010; // Set rptr to 10
        #10; // Wait for clock edge
        if (wq2_rptr !== 4'b0000) begin
            $display("FAIL: wq2_rptr should be 0 before next clock edge");
            $finish;
        end

        // Test case 3: Check wq2_rptr after clock edge
        #10; // Wait for clock edge
        if (wq2_rptr !== 4'b1010) begin
            $display("FAIL: wq2_rptr should be 10 after clock edge");
            $finish;
        end

        // Test case 4: Change rptr value and check wq2_rptr
        rptr = 4'b1111; // Set rptr to 15
        #10; // Wait for clock edge
        if (wq2_rptr !== 4'b1010) begin
            $display("FAIL: wq2_rptr should be 10 before next clock edge");
            $finish;
        end

        // Test case 5: Check wq2_rptr after clock edge
        #10; // Wait for clock edge
        if (wq2_rptr !== 4'b1111) begin
            $display("FAIL: wq2_rptr should be 15 after clock edge");
            $finish;
        end

        // Test case 6: Assert reset and check wq2_rptr
        wrst_n = 0; // Assert reset
        #10;
        if (wq2_rptr !== 4'b0000) begin
            $display("FAIL: wq2_rptr should be 0 after reset");
            $finish;
        end

        // Test case 7: Release reset and check wq2_rptr
        wrst_n = 1; // Release reset
        rptr = 4'b0011; // Set rptr to 3
        #10; // Wait for clock edge
        #10; // Wait for clock edge
        if (wq2_rptr !== 4'b0011) begin
            $display("FAIL: wq2_rptr should be 3 after clock edge");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule