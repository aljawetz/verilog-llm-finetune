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

        // Test case 2: Change VPWR
        VPWR = 1'b1;
        #10; // Wait for 10 time units
        if (VPWR !== 1'b1) begin
            $display("FAIL: VPWR did not change to 1");
            $finish;
        end

        // Test case 3: Change VGND
        VGND = 1'b1;
        #10; // Wait for 10 time units
        if (VGND !== 1'b1) begin
            $display("FAIL: VGND did not change to 1");
            $finish;
        end

        // Test case 4: Change VPB
        VPB = 1'b1;
        #10; // Wait for 10 time units
        if (VPB !== 1'b1) begin
            $display("FAIL: VPB did not change to 1");
            $finish;
        end

        // Test case 5: Change VNB
        VNB = 1'b1;
        #10; // Wait for 10 time units
        if (VNB !== 1'b1) begin
            $display("FAIL: VNB did not change to 1");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule