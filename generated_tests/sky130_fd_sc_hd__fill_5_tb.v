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
        // Initialize signals
        VPWR = 1'b1; // Power supply
        VGND = 1'b0; // Ground
        VPB = 1'b1;  // Bulk connection
        VNB = 1'b0;  // Substrate connection

        // Wait for some time to observe the state
        #10;

        // Check the initial conditions
        if (VPWR !== 1'b1) begin
            $display("FAIL: VPWR should be 1'b1");
            $finish;
        end

        if (VGND !== 1'b0) begin
            $display("FAIL: VGND should be 1'b0");
            $finish;
        end

        if (VPB !== 1'b1) begin
            $display("FAIL: VPB should be 1'b1");
            $finish;
        end

        if (VNB !== 1'b0) begin
            $display("FAIL: VNB should be 1'b0");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule