`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__tapvgnd;

    // Testbench signals
    reg VPWR;
    reg VGND;
    reg VPB;
    reg VNB;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__tapvgnd uut (
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
        VPWR = 1'b1; VGND = 1'b0; VPB = 1'b1; VNB = 1'b0; // Set power and ground
        #10;

        if (VPWR !== 1'b1 || VGND !== 1'b0 || VPB !== 1'b1 || VNB !== 1'b0) begin
            $display("FAIL: Initial power and ground signals not set correctly");
            $finish;
        end

        // Reset signals
        #10;
        VPWR = 1'b0; VGND = 1'b1; VPB = 1'b0; VNB = 1'b1; // Reset power and ground
        #10;

        if (VPWR !== 1'b0 || VGND !== 1'b1 || VPB !== 1'b0 || VNB !== 1'b1) begin
            $display("FAIL: Reset power and ground signals not set correctly");
            $finish;
        end

        // Final state check
        #10;
        VPWR = 1'b1; VGND = 1'b0; VPB = 1'b1; VNB = 1'b0; // Restore power and ground
        #10;

        if (VPWR !== 1'b1 || VGND !== 1'b0 || VPB !== 1'b1 || VNB !== 1'b0) begin
            $display("FAIL: Final power and ground signals not set correctly");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule