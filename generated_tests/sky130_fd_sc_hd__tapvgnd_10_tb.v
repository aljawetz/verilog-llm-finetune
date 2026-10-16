`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__tapvgnd;

    // Parameters
    reg VPWR;
    reg VGND;
    reg VPB;
    reg VNB;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__tapvgnd2 uut (
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPB),
        .VNB(VNB)
    );

    initial begin
        // Initialize inputs
        VPWR = 1'b0;
        VGND = 1'b0;
        VPB  = 1'b0;
        VNB  = 1'b0;

        // Test sequence
        #10; // Wait for 10 time units

        // Check initial conditions
        if (VPWR !== 1'b0 || VGND !== 1'b0 || VPB !== 1'b0 || VNB !== 1'b0) begin
            $display("FAIL: Initial conditions are not zero");
            $finish;
        end

        // Set VPWR and check
        VPWR = 1'b1;
        #5;
        if (VPWR !== 1'b1) begin
            $display("FAIL: VPWR should be 1 after setting");
            $finish;
        end

        // Set VGND and check
        VGND = 1'b1;
        #5;
        if (VGND !== 1'b1) begin
            $display("FAIL: VGND should be 1 after setting");
            $finish;
        end

        // Set VPB and check
        VPB = 1'b1;
        #5;
        if (VPB !== 1'b1) begin
            $display("FAIL: VPB should be 1 after setting");
            $finish;
        end

        // Set VNB and check
        VNB = 1'b1;
        #5;
        if (VNB !== 1'b1) begin
            $display("FAIL: VNB should be 1 after setting");
            $finish;
        end

        // Reset all inputs
        VPWR = 1'b0;
        VGND = 1'b0;
        VPB  = 1'b0;
        VNB  = 1'b0;
        #5;

        // Final check
        if (VPWR !== 1'b0 || VGND !== 1'b0 || VPB !== 1'b0 || VNB !== 1'b0) begin
            $display("FAIL: Final conditions are not zero");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule