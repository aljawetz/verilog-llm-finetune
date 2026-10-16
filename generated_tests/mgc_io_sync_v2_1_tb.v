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
        #10; // Wait for 10 time units
        ld = 1; // Set ld to 1
        #10; // Wait for 10 time units
        if (lz !== 1) begin
            $display("FAIL: Expected lz to be 1 when ld is 1");
            $finish;
        end

        ld = 0; // Set ld to 0
        #10; // Wait for 10 time units
        if (lz !== 0) begin
            $display("FAIL: Expected lz to be 0 when ld is 0");
            $finish;
        end

        // Additional test cases
        ld = 1; // Set ld to 1 again
        #10; // Wait for 10 time units
        if (lz !== 1) begin
            $display("FAIL: Expected lz to be 1 when ld is 1");
            $finish;
        end

        ld = 0; // Set ld to 0 again
        #10; // Wait for 10 time units
        if (lz !== 0) begin
            $display("FAIL: Expected lz to be 0 when ld is 0");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule