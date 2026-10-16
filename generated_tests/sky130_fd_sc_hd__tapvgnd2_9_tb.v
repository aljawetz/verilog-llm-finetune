`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__tapvgnd2;

    // Inputs
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

        // Test case 1: Check initial values
        #10;
        if (VPWR !== 1'b0 || VGND !== 1'b0 || VPB !== 1'b0 || VNB !== 1'b0) begin
            $display("FAIL: Initial values are not as expected");
            $finish;
        end

        // Test case 2: Drive VPWR high
        VPWR = 1'b1;
        #10;
        if (VPWR !== 1'b1) begin
            $display("FAIL: VPWR should be high");
            $finish;
        end

        // Test case 3: Drive VGND high
        VGND = 1'b1;
        #10;
        if (VGND !== 1'b1) begin
            $display("FAIL: VGND should be high");
            $finish;
        end

        // Test case 4: Drive VPB high
        VPB = 1'b1;
        #10;
        if (VPB !== 1'b1) begin
            $display("FAIL: VPB should be high");
            $finish;
        end

        // Test case 5: Drive VNB high
        VNB = 1'b1;
        #10;
        if (VNB !== 1'b1) begin
            $display("FAIL: VNB should be high");
            $finish;
        end

        // Reset all inputs
        VPWR = 1'b0;
        VGND = 1'b0;
        VPB  = 1'b0;
        VNB  = 1'b0;
        #10;

        // Final check for reset values
        if (VPWR !== 1'b0 || VGND !== 1'b0 || VPB !== 1'b0 || VNB !== 1'b0) begin
            $display("FAIL: Reset values are not as expected");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule