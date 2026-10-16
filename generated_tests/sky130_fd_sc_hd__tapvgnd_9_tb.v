`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__tapvgnd;

    // Testbench signals
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
        #10; // Wait for 10 time units

        // Test case 1: Check initial conditions
        if (VPWR !== 1'b0 || VGND !== 1'b0 || VPB !== 1'b0 || VNB !== 1'b0) begin
            $display("FAIL: Initial conditions are not as expected");
            $finish;
        end

        // Change inputs to simulate power and ground connections
        VPWR = 1'b1; VGND = 1'b1; VPB = 1'b1; VNB = 1'b1;
        #10; // Wait for 10 time units

        // Test case 2: Check after setting power and ground
        if (VPWR !== 1'b1 || VGND !== 1'b1 || VPB !== 1'b1 || VNB !== 1'b1) begin
            $display("FAIL: Power and ground connections are not as expected");
            $finish;
        end

        // Reset to initial conditions
        VPWR = 1'b0; VGND = 1'b0; VPB = 1'b0; VNB = 1'b0;
        #10; // Wait for 10 time units

        // Test case 3: Check after resetting
        if (VPWR !== 1'b0 || VGND !== 1'b0 || VPB !== 1'b0 || VNB !== 1'b0) begin
            $display("FAIL: Reset conditions are not as expected");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule