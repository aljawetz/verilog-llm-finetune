`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__diode;

    // Testbench signals
    reg DIODE;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__diode uut (
        .DIODE(DIODE)
    );

    initial begin
        // Initialize DIODE
        DIODE = 1'b0;

        // Test sequence
        #10; // Wait for 10 time units
        if (DIODE !== 1'b0) begin
            $display("FAIL: DIODE should be 0 after initialization");
            $finish;
        end

        DIODE = 1'b1; // Change DIODE to 1
        #10; // Wait for 10 time units
        if (DIODE !== 1'b1) begin
            $display("FAIL: DIODE should be 1 after assignment");
            $finish;
        end

        DIODE = 1'b0; // Change DIODE back to 0
        #10; // Wait for 10 time units
        if (DIODE !== 1'b0) begin
            $display("FAIL: DIODE should be 0 after reassignment");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule