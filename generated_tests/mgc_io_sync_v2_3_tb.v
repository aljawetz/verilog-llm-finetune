`timescale 1ns/1ps

module tb_mgc_io_sync_v2;

    reg ld;
    wire lz;

    // Instantiate the module under test (uut)
    mgc_io_sync_v2 uut (
        .ld(ld),
        .lz(lz)
    );

    initial begin
        // Initialize inputs
        ld = 0;

        // Test sequence
        #10; // Wait for 10 ns
        ld = 1; // Set ld to 1
        #10; // Wait for 10 ns
        if (lz !== 1) begin
            $display("FAIL: lz should be 1 when ld is 1");
            $finish;
        end

        #10; // Wait for 10 ns
        ld = 0; // Set ld to 0
        #10; // Wait for 10 ns
        if (lz !== 0) begin
            $display("FAIL: lz should be 0 when ld is 0");
            $finish;
        end

        #10; // Wait for 10 ns
        ld = 1; // Set ld to 1 again
        #10; // Wait for 10 ns
        if (lz !== 1) begin
            $display("FAIL: lz should be 1 when ld is 1");
            $finish;
        end

        #10; // Wait for 10 ns
        ld = 0; // Set ld to 0 again
        #10; // Wait for 10 ns
        if (lz !== 0) begin
            $display("FAIL: lz should be 0 when ld is 0");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule