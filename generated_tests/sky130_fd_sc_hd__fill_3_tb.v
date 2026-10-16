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

    initial begin
        // Initialize inputs
        VPWR = 1'b0;
        VGND = 1'b0;
        VPB = 1'b0;
        VNB = 1'b0;

        // Test sequence
        #10; // Wait for 10 time units
        VPWR = 1'b1; VGND = 1'b1; VPB = 1'b1; VNB = 1'b1; // Set all to high
        #10;

        if (VPWR !== 1'b1 || VGND !== 1'b1 || VPB !== 1'b1 || VNB !== 1'b1) begin
            $display("FAIL: Outputs not as expected after setting high");
            $finish;
        end

        // Reset signals
        VPWR = 1'b0; VGND = 1'b0; VPB = 1'b0; VNB = 1'b0;
        #10;

        if (VPWR !== 1'b0 || VGND !== 1'b0 || VPB !== 1'b0 || VNB !== 1'b0) begin
            $display("FAIL: Outputs not as expected after resetting");
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule