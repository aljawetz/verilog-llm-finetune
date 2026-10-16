`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__tap;

    // Testbench signals
    reg VPWR;
    reg VGND;
    reg VPB;
    reg VNB;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__tap uut (
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
        VPWR = 1'b1; VGND = 1'b0; VPB = 1'b1; VNB = 1'b0; // Set power and bulk
        #10; // Wait for 10 time units

        // Check the state of the inputs
        if (VPWR !== 1'b1) begin
            $display("FAIL: VPWR should be 1");
            $finish;
        end
        if (VGND !== 1'b0) begin
            $display("FAIL: VGND should be 0");
            $finish;
        end
        if (VPB !== 1'b1) begin
            $display("FAIL: VPB should be 1");
            $finish;
        end
        if (VNB !== 1'b0) begin
            $display("FAIL: VNB should be 0");
            $finish;
        end

        // Reset signals
        VPWR = 1'b0; VGND = 1'b1; VPB = 1'b0; VNB = 1'b1; // Set ground and bulk
        #10; // Wait for 10 time units

        // Check the state of the inputs again
        if (VPWR !== 1'b0) begin
            $display("FAIL: VPWR should be 0");
            $finish;
        end
        if (VGND !== 1'b1) begin
            $display("FAIL: VGND should be 1");
            $finish;
        end
        if (VPB !== 1'b0) begin
            $display("FAIL: VPB should be 0");
            $finish;
        end
        if (VNB !== 1'b1) begin
            $display("FAIL: VNB should be 1");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule