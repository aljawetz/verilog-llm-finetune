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
        wrst_n = 0;
        rptr = 4'b0000;

        // Apply reset
        #10;
        wrst_n = 1; // Release reset

        // Test case 1: Check initial output after reset
        #10;
        if (wq2_rptr !== 4'b0000) begin
            $display("FAIL: Initial output after reset is incorrect");
            $finish;
        end

        // Test case 2: Drive rptr and check output
        rptr = 4'b1010; // Set rptr to 10
        #10;
        if (wq2_rptr !== 4'b0000) begin
            $display("FAIL: Output should still be 0 before next clock edge");
            $finish;
        end

        // Wait for clock edge
        #10;
        if (wq2_rptr !== 4'b1010) begin
            $display("FAIL: Output not synchronized to rptr after clock edge");
            $finish;
        end

        // Test case 3: Change rptr and check output
        rptr = 4'b1111; // Set rptr to 15
        #10;
        if (wq2_rptr !== 4'b1010) begin
            $display("FAIL: Output should still be 10 before next clock edge");
            $finish;
        end

        // Wait for clock edge
        #10;
        if (wq2_rptr !== 4'b1111) begin
            $display("FAIL: Output not synchronized to rptr after clock edge");
            $finish;
        end

        // Test case 4: Assert reset functionality
        wrst_n = 0; // Assert reset
        #10;
        if (wq2_rptr !== 4'b0000) begin
            $display("FAIL: Output should be 0 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule