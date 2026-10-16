`timescale 1ns/1ps

module tb_mgc_io_sync_v2;

    // Inputs
    reg ld;

    // Outputs
    wire lz;

    // Instantiate the Unit Under Test (UUT)
    mgc_io_sync_v2 uut (
        .ld(ld),
        .lz(lz)
    );

    initial begin
        // Initialize Inputs
        ld = 0;

        // Wait for global reset to finish
        #10;

        // Test case 1: Check when ld is 0
        if (lz !== 0) begin
            $display("FAIL: lz should be 0 when ld is 0");
            $finish;
        end

        // Test case 2: Check when ld is 1
        ld = 1;
        #10; // Wait for a time to observe lz
        if (lz !== 1) begin
            $display("FAIL: lz should be 1 when ld is 1");
            $finish;
        end

        // Test case 3: Check when ld toggles
        ld = 0;
        #10; // Wait for a time to observe lz
        if (lz !== 0) begin
            $display("FAIL: lz should be 0 when ld is toggled to 0");
            $finish;
        end

        ld = 1;
        #10; // Wait for a time to observe lz
        if (lz !== 1) begin
            $display("FAIL: lz should be 1 when ld is toggled to 1");
            $finish;
        end

        // Test case 4: Continuous toggling
        ld = 0;
        #5;
        if (lz !== 0) begin
            $display("FAIL: lz should be 0 during continuous toggling");
            $finish;
        end

        ld = 1;
        #5;
        if (lz !== 1) begin
            $display("FAIL: lz should be 1 during continuous toggling");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule