`timescale 1ns/1ps

module tb_decap;

    // Inputs
    reg VPWR;
    reg VGND;
    reg VPB;
    reg VNB;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__decap uut (
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
        VPWR = 1'b1; VGND = 1'b0; VPB = 1'b1; VNB = 1'b0; // Set power and ground
        #10;

        if (VPWR !== 1'b1 || VGND !== 1'b0 || VPB !== 1'b1 || VNB !== 1'b0) begin
            $display("FAIL: Initial power and ground settings incorrect");
            $finish;
        end

        #10;
        VPWR = 1'b0; VGND = 1'b1; VPB = 1'b0; VNB = 1'b1; // Set to ground state
        #10;

        if (VPWR !== 1'b0 || VGND !== 1'b1 || VPB !== 1'b0 || VNB !== 1'b1) begin
            $display("FAIL: Ground state settings incorrect");
            $finish;
        end

        #10;
        VPWR = 1'b1; VGND = 1'b0; VPB = 1'b1; VNB = 1'b0; // Restore power
        #10;

        if (VPWR !== 1'b1 || VGND !== 1'b0 || VPB !== 1'b1 || VNB !== 1'b0) begin
            $display("FAIL: Restore power settings incorrect");
            $finish;
        end

        // Final check
        #10;
        if (VPWR === 1'b1 && VGND === 1'b0 && VPB === 1'b1 && VNB === 1'b0) begin
            $display("PASS");
        end else begin
            $display("FAIL: Final state settings incorrect");
            $finish;
        end

        // End simulation
        $finish;
    end

endmodule