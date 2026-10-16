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
        VPB = 1'b0;
        VNB = 1'b0;

        // Test sequence
        #10; // Wait for 10 time units

        // Test case 1: Check initial state
        if (VPWR !== 1'b0 || VGND !== 1'b0 || VPB !== 1'b0 || VNB !== 1'b0) begin
            $display("FAIL: Initial state is not as expected");
            $finish;
        end

        // Change inputs
        VPWR = 1'b1;
        VGND = 1'b1;
        VPB = 1'b1;
        VNB = 1'b1;

        #10; // Wait for 10 time units

        // Test case 2: Check state after driving inputs
        if (VPWR !== 1'b1 || VGND !== 1'b1 || VPB !== 1'b1 || VNB !== 1'b1) begin
            $display("FAIL: State after driving inputs is not as expected");
            $finish;
        end

        // Reset inputs
        VPWR = 1'b0;
        VGND = 1'b0;
        VPB = 1'b0;
        VNB = 1'b0;

        #10; // Wait for 10 time units

        // Test case 3: Check state after reset
        if (VPWR !== 1'b0 || VGND !== 1'b0 || VPB !== 1'b0 || VNB !== 1'b0) begin
            $display("FAIL: State after reset is not as expected");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule