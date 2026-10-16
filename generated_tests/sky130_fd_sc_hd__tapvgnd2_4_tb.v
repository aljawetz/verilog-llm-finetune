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
        VPWR = 1'b1; VGND = 1'b0; VPB = 1'b1; VNB = 1'b0; // Set VPWR high
        #10;
        if (VPWR !== 1'b1 || VGND !== 1'b0 || VPB !== 1'b1 || VNB !== 1'b0) begin
            $display("FAIL: Initial state check failed after setting VPWR high");
            $finish;
        end

        #10; // Wait for 10 time units
        VPWR = 1'b0; VGND = 1'b1; VPB = 1'b0; VNB = 1'b1; // Set VGND high
        #10;
        if (VPWR !== 1'b0 || VGND !== 1'b1 || VPB !== 1'b0 || VNB !== 1'b1) begin
            $display("FAIL: State check failed after setting VGND high");
            $finish;
        end

        // Final state check
        #10; // Wait for 10 time units
        VPWR = 1'b1; VGND = 1'b1; VPB = 1'b1; VNB = 1'b1; // Set all high
        #10;
        if (VPWR !== 1'b1 || VGND !== 1'b1 || VPB !== 1'b1 || VNB !== 1'b1) begin
            $display("FAIL: Final state check failed after setting all high");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule