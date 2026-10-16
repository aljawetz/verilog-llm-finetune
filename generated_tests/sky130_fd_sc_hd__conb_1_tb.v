`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__conb;

    // Instantiate the module under test (UUT)
    wire HI;
    wire LO;
    sky130_fd_sc_hd__conb uut (
        .HI(HI),
        .LO(LO)
    );

    initial begin
        // Wait for a short time to allow the outputs to stabilize
        #10;

        // Check the HI output
        if (HI !== 1'b1) begin
            $display("FAIL: HI output is not high");
            $finish;
        end

        // Check the LO output
        if (LO !== 1'b0) begin
            $display("FAIL: LO output is not low");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule