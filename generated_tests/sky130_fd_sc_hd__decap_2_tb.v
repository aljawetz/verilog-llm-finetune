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
        // Initialize inputs
        VPWR = 1'b0;
        VGND = 1'b0;
        VPB = 1'b0;
        VNB = 1'b0;

        // Test sequence
        #10;
        VPWR = 1'b1; VGND = 1'b0; VPB = 1'b1; VNB = 1'b0; // Set power and bias
        #10;
        if (VPWR !== 1'b1 || VGND !== 1'b0 || VPB !== 1'b1 || VNB !== 1'b0) begin
            $display("FAIL: Initial power and bias settings incorrect");
            $finish;
        end

        #10;
        VPWR = 1'b0; VGND = 1'b1; VPB = 1'b0; VNB = 1'b1; // Change states
        #10;
        if (VPWR !== 1'b0 || VGND !== 1'b1 || VPB !== 1'b0 || VNB !== 1'b1) begin
            $display("FAIL: Power and bias settings incorrect after change");
            $finish;
        end

        #10;
        VPWR = 1'b1; VGND = 1'b1; VPB = 1'b1; VNB = 1'b1; // Set all high
        #10;
        if (VPWR !== 1'b1 || VGND !== 1'b1 || VPB !== 1'b1 || VNB !== 1'b1) begin
            $display("FAIL: Power and bias settings incorrect when all set high");
            $finish;
        end

        // Final state check
        #10;
        if (VPWR === 1'b1 && VGND === 1'b1 && VPB === 1'b1 && VNB === 1'b1) begin
            $display("PASS");
        end else begin
            $display("FAIL: Final state check failed");
            $finish;
        end

        $finish;
    end

endmodule