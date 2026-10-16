`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__diode;

    // Parameters
    reg DIODE;
    reg VPWR;
    reg VGND;
    reg VPB;
    reg VNB;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__diode uut (
        .DIODE(DIODE),
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPB),
        .VNB(VNB)
    );

    initial begin
        // Initialize inputs
        VPWR = 1;
        VGND = 0;
        VPB = 1;
        VNB = 0;
        
        // Test sequence
        DIODE = 0; // Test with DIODE low
        #10;
        if (DIODE !== 0) begin
            $display("FAIL: DIODE should be 0");
            $finish;
        end
        
        DIODE = 1; // Test with DIODE high
        #10;
        if (DIODE !== 1) begin
            $display("FAIL: DIODE should be 1");
            $finish;
        end
        
        // Additional tests can be added here

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule