`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__tapvgnd2;

    // Testbench signals
    reg VPWR;
    reg VGND;
    reg VPB;
    reg VNB;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__tapvgnd2 uut (
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

        // Test case 1: Set VPWR high
        VPWR = 1'b1;
        #5;
        if (VPWR !== 1'b1) begin
            $display("FAIL: VPWR should be high");
            $finish;
        end

        // Test case 2: Set VGND high
        VGND = 1'b1;
        #5;
        if (VGND !== 1'b1) begin
            $display("FAIL: VGND should be high");
            $finish;
        end

        // Test case 3: Set VPB high
        VPB = 1'b1;
        #5;
        if (VPB !== 1'b1) begin
            $display("FAIL: VPB should be high");
            $finish;
        end

        // Test case 4: Set VNB high
        VNB = 1'b1;
        #5;
        if (VNB !== 1'b1) begin
            $display("FAIL: VNB should be high");
            $finish;
        end

        // Reset all signals
        VPWR = 1'b0;
        VGND = 1'b0;
        VPB  = 1'b0;
        VNB  = 1'b0;
        #5;

        // Final check to ensure all signals are low
        if (VPWR !== 1'b0 || VGND !== 1'b0 || VPB !== 1'b0 || VNB !== 1'b0) begin
            $display("FAIL: All signals should be low after reset");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule