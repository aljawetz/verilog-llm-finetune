`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__lpflow_clkinvkapwr;

    // Inputs
    reg A;

    // Outputs
    wire Y;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__lpflow_clkinvkapwr uut (
        .Y(Y),
        .A(A)
    );

    initial begin
        // Initialize Inputs
        A = 0;

        // Wait for global reset to finish
        #10;

        // Test sequence
        // Test case 1: A = 0, expect Y = 1
        A = 0;
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 1 failed, expected Y = 1, got Y = %b", Y);
            $finish;
        end

        // Test case 2: A = 1, expect Y = 0
        A = 1;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 2 failed, expected Y = 0, got Y = %b", Y);
            $finish;
        end

        // Test case 3: A = 0, expect Y = 1 again
        A = 0;
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 3 failed, expected Y = 1, got Y = %b", Y);
            $finish;
        end

        // Test case 4: A = 1, expect Y = 0 again
        A = 1;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 4 failed, expected Y = 0, got Y = %b", Y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule