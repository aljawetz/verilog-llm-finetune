`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__decap;

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
        #10; // Wait for 10 time units
        VPWR = 1'b1; VGND = 1'b0; VPB = 1'b1; VNB = 1'b0; // Set VPWR and VPB high
        #10;

        if (VPWR !== 1'b1 || VGND !== 1'b0 || VPB !== 1'b1 || VNB !== 1'b0) begin
            $display("FAIL: Initial test failed");
            $finish;
        end

        #10; // Wait for 10 time units
        VPWR = 1'b0; VGND = 1'b1; VPB = 1'b0; VNB = 1'b1; // Set all to low
        #10;

        if (VPWR !== 1'b0 || VGND !== 1'b1 || VPB !== 1'b0 || VNB !== 1'b1) begin
            $display("FAIL: Second test failed");
            $finish;
        end

        #10; // Wait for 10 time units
        VPWR = 1'b1; VGND = 1'b0; VPB = 1'b0; VNB = 1'b1; // Set VPWR high and others low
        #10;

        if (VPWR !== 1'b1 || VGND !== 1'b0 || VPB !== 1'b0 || VNB !== 1'b1) begin
            $display("FAIL: Third test failed");
            $finish;
        end

        // Final state check
        #10;
        if (VPWR !== 1'b1 || VGND !== 1'b0 || VPB !== 1'b0 || VNB !== 1'b1) begin
            $display("FAIL: Final state check failed");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule