`timescale 1ns/1ps

module tb_decap;

    // Testbench signals
    reg VPWR;
    reg VGND;
    reg VPB;
    reg VNB;

    // Instantiate the module under test (uut)
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
        VPB  = 1'b0;
        VNB  = 1'b0;

        // Test sequence
        // Test case 1: Check initial state
        if (VPWR !== 1'b0 || VGND !== 1'b0 || VPB !== 1'b0 || VNB !== 1'b0) begin
            $display("FAIL: Initial state is incorrect");
            $finish;
        end

        // Test case 2: Set VPWR high
        VPWR = 1'b1;
        #10; // Wait for 10 time units
        if (VPWR !== 1'b1) begin
            $display("FAIL: VPWR should be high");
            $finish;
        end

        // Test case 3: Set VGND high
        VGND = 1'b1;
        #10; // Wait for 10 time units
        if (VGND !== 1'b1) begin
            $display("FAIL: VGND should be high");
            $finish;
        end

        // Test case 4: Set VPB high
        VPB = 1'b1;
        #10; // Wait for 10 time units
        if (VPB !== 1'b1) begin
            $display("FAIL: VPB should be high");
            $finish;
        end

        // Test case 5: Set VNB high
        VNB = 1'b1;
        #10; // Wait for 10 time units
        if (VNB !== 1'b1) begin
            $display("FAIL: VNB should be high");
            $finish;
        end

        // Reset all signals
        VPWR = 1'b0;
        VGND = 1'b0;
        VPB  = 1'b0;
        VNB  = 1'b0;
        #10; // Wait for 10 time units

        // Final check
        if (VPWR !== 1'b0 || VGND !== 1'b0 || VPB !== 1'b0 || VNB !== 1'b0) begin
            $display("FAIL: Final state is incorrect");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule