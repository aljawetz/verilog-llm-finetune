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
        VPWR = 1'b0;
        VGND = 1'b0;
        VPB = 1'b0;
        VNB = 1'b0;

        // Test sequence
        #10;
        VPWR = 1'b1; VGND = 1'b0; VPB = 1'b1; VNB = 1'b0;
        #10;

        if (VPWR !== 1'b1 || VGND !== 1'b0 || VPB !== 1'b1 || VNB !== 1'b0) begin
            $display("FAIL: Initial test values did not match expected outputs.");
            $finish;
        end

        #10;
        VPWR = 1'b0; VGND = 1'b1; VPB = 1'b0; VNB = 1'b1;
        #10;

        if (VPWR !== 1'b0 || VGND !== 1'b1 || VPB !== 1'b0 || VNB !== 1'b1) begin
            $display("FAIL: Second test values did not match expected outputs.");
            $finish;
        end

        #10;
        VPWR = 1'b1; VGND = 1'b1; VPB = 1'b1; VNB = 1'b1;
        #10;

        if (VPWR !== 1'b1 || VGND !== 1'b1 || VPB !== 1'b1 || VNB !== 1'b1) begin
            $display("FAIL: Third test values did not match expected outputs.");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule