`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__fill;

    // Testbench signals
    reg VPWR;
    reg VGND;
    reg VPB;
    reg VNB;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__fill uut (
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPB),
        .VNB(VNB)
    );

    // Initial block for stimulus
    initial begin
        // Initialize inputs
        VPWR = 1'b0;
        VGND = 1'b0;
        VPB  = 1'b0;
        VNB  = 1'b0;

        // Test sequence
        #10; // Wait for 10 time units
        VPWR = 1'b1; VGND = 1'b0; VPB = 1'b1; VNB = 1'b0; // Set to valid power states
        #10; // Wait for 10 time units

        // Check if the inputs are correctly set
        if (VPWR !== 1'b1 || VGND !== 1'b0 || VPB !== 1'b1 || VNB !== 1'b0) begin
            $display("FAIL: Input signals are not set correctly after initialization.");
            $finish;
        end

        // Reset signals
        #10; // Wait for 10 time units
        VPWR = 1'b0; VGND = 1'b0; VPB = 1'b0; VNB = 1'b0; // Reset to ground states
        #10; // Wait for 10 time units

        // Check if the inputs are correctly reset
        if (VPWR !== 1'b0 || VGND !== 1'b0 || VPB !== 1'b0 || VNB !== 1'b0) begin
            $display("FAIL: Input signals are not reset correctly.");
            $finish;
        end

        // Final state check
        #10; // Wait for 10 time units
        $display("PASS");
        $finish;
    end

endmodule