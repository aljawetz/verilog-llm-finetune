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
        VPB  = 1'b0;
        VNB  = 1'b0;

        // Test sequence
        // Test 1: Check initial state
        if (VPWR !== 1'b0 || VGND !== 1'b0 || VPB !== 1'b0 || VNB !== 1'b0) begin
            $display("FAIL: Initial state is not as expected");
            $finish;
        end

        // Test 2: Drive VPWR high
        VPWR = 1'b1;
        #10; // Wait for 10 time units
        if (VPWR !== 1'b1) begin
            $display("FAIL: VPWR did not go high as expected");
            $finish;
        end

        // Test 3: Drive VGND high
        VGND = 1'b1;
        #10; // Wait for 10 time units
        if (VGND !== 1'b1) begin
            $display("FAIL: VGND did not go high as expected");
            $finish;
        end

        // Test 4: Drive VPB high
        VPB = 1'b1;
        #10; // Wait for 10 time units
        if (VPB !== 1'b1) begin
            $display("FAIL: VPB did not go high as expected");
            $finish;
        end

        // Test 5: Drive VNB high
        VNB = 1'b1;
        #10; // Wait for 10 time units
        if (VNB !== 1'b1) begin
            $display("FAIL: VNB did not go high as expected");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule