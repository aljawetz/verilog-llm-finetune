`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__tap;

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

        // Test 1: Check initial state
        if (VPWR !== 1'b0 || VGND !== 1'b0 || VPB !== 1'b0 || VNB !== 1'b0) begin
            $display("FAIL: Initial state is incorrect");
            $finish;
        end

        // Test 2: Change VPWR
        VPWR = 1'b1;
        #10;
        if (VPWR !== 1'b1) begin
            $display("FAIL: VPWR did not change correctly");
            $finish;
        end

        // Test 3: Change VGND
        VGND = 1'b1;
        #10;
        if (VGND !== 1'b1) begin
            $display("FAIL: VGND did not change correctly");
            $finish;
        end

        // Test 4: Change VPB
        VPB = 1'b1;
        #10;
        if (VPB !== 1'b1) begin
            $display("FAIL: VPB did not change correctly");
            $finish;
        end

        // Test 5: Change VNB
        VNB = 1'b1;
        #10;
        if (VNB !== 1'b1) begin
            $display("FAIL: VNB did not change correctly");
            $finish;
        end

        // Final state check
        if (VPWR !== 1'b1 || VGND !== 1'b1 || VPB !== 1'b1 || VNB !== 1'b1) begin
            $display("FAIL: Final state is incorrect");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule