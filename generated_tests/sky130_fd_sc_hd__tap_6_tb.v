`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__tap;

    // Parameters
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

    initial begin
        // Initialize inputs
        VPWR = 1'b0;
        VGND = 1'b0;
        VPB = 1'b0;
        VNB = 1'b0;

        // Test sequence
        #10;
        VPWR = 1'b1; VGND = 1'b0; VPB = 1'b1; VNB = 1'b0; // Set power and ground
        #10;
        
        if (VPWR !== 1'b1 || VGND !== 1'b0 || VPB !== 1'b1 || VNB !== 1'b0) begin
            $display("FAIL: Initial power and ground settings are incorrect");
            $finish;
        end

        #10;
        VPWR = 1'b0; VGND = 1'b1; VPB = 1'b0; VNB = 1'b1; // Change power and ground
        #10;

        if (VPWR !== 1'b0 || VGND !== 1'b1 || VPB !== 1'b0 || VNB !== 1'b1) begin
            $display("FAIL: Power and ground settings after change are incorrect");
            $finish;
        end

        // Final state check
        #10;
        if (VPWR !== 1'b0 && VGND !== 1'b1) begin
            $display("FAIL: Final state check failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule