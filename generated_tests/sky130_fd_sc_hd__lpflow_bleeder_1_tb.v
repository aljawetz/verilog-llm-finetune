`timescale 1ns/1ps

module tb_lpflow_bleeder;

    // Inputs
    reg SHORT;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__lpflow_bleeder uut (
        .SHORT(SHORT)
    );

    initial begin
        // Initialize Inputs
        SHORT = 1'b0;

        // Test sequence
        #10; // Wait for 10 time units
        if (uut.SHORT !== 1'b0) begin
            $display("FAIL: SHORT should be 0 initially");
            $finish;
        end

        SHORT = 1'b1; // Change SHORT to 1
        #10; // Wait for 10 time units
        if (uut.SHORT !== 1'b1) begin
            $display("FAIL: SHORT should be 1 after assignment");
            $finish;
        end

        SHORT = 1'b0; // Change SHORT back to 0
        #10; // Wait for 10 time units
        if (uut.SHORT !== 1'b0) begin
            $display("FAIL: SHORT should be 0 after assignment");
            $finish;
        end

        // Final check
        if (uut.SHORT !== 1'b0) begin
            $display("FAIL: SHORT should be 0 at the end of tests");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule