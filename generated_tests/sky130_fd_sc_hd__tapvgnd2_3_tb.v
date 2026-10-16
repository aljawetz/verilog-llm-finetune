`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__tapvgnd2;

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

    // Initial block for stimulus
    initial begin
        // Initialize inputs
        VPWR = 1'b0;
        VGND = 1'b0;
        VPB = 1'b0;
        VNB = 1'b0;

        // Test sequence
        #10; // Wait for 10 time units
        VPWR = 1'b1; VGND = 1'b0; VPB = 1'b1; VNB = 1'b0; // Set power and substrate
        #10; // Wait for 10 time units
        if (VPWR !== 1'b1 || VGND !== 1'b0 || VPB !== 1'b1 || VNB !== 1'b0) begin
            $display("FAIL: Initial power and substrate settings incorrect");
            $finish;
        end

        #10; // Wait for 10 time units
        VPWR = 1'b0; VGND = 1'b1; VPB = 1'b0; VNB = 1'b1; // Change power and substrate
        #10; // Wait for 10 time units
        if (VPWR !== 1'b0 || VGND !== 1'b1 || VPB !== 1'b0 || VNB !== 1'b1) begin
            $display("FAIL: Changed power and substrate settings incorrect");
            $finish;
        end

        // Final state check
        #10; // Wait for 10 time units
        VPWR = 1'b1; VGND = 1'b1; VPB = 1'b1; VNB = 1'b1; // Set all to high
        #10; // Wait for 10 time units
        if (VPWR !== 1'b1 || VGND !== 1'b1 || VPB !== 1'b1 || VNB !== 1'b1) begin
            $display("FAIL: Final power and substrate settings incorrect");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule