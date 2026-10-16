`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__fill;

    // Inputs
    reg VPWR;
    reg VGND;
    reg VPB;
    reg VNB;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__fill uut (
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPB),
        .VNB(VNB)
    );

    initial begin
        // Initialize Inputs
        VPWR = 1'b1;
        VGND = 1'b0;
        VPB = 1'b1;
        VNB = 1'b0;

        // Wait for some time to observe the initial state
        #10;

        // Check initial conditions
        if (VPWR !== 1'b1) begin
            $display("FAIL: VPWR should be high");
            $finish;
        end

        if (VGND !== 1'b0) begin
            $display("FAIL: VGND should be low");
            $finish;
        end

        if (VPB !== 1'b1) begin
            $display("FAIL: VPB should be high");
            $finish;
        end

        if (VNB !== 1'b0) begin
            $display("FAIL: VNB should be low");
            $finish;
        end

        // Test completed successfully
        $display("PASS");
        $finish;
    end

endmodule