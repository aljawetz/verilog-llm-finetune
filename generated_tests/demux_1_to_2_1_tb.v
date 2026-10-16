`timescale 1ns/1ps

module tb_demux_1_to_2;

    // Inputs
    reg in;
    reg sel;

    // Outputs
    wire out0;
    wire out1;

    // Instantiate the Unit Under Test (UUT)
    demux_1_to_2 uut (
        .in(in),
        .sel(sel),
        .out0(out0),
        .out1(out1)
    );

    initial begin
        // Initialize inputs
        in = 0;
        sel = 0;

        // Test case 1: sel = 0, in = 0
        #10;
        if (out0 !== 0 || out1 !== 0) begin
            $display("FAIL: Test case 1 failed (sel=0, in=0)");
            $finish;
        end

        // Test case 2: sel = 0, in = 1
        in = 1; sel = 0;
        #10;
        if (out0 !== 1 || out1 !== 0) begin
            $display("FAIL: Test case 2 failed (sel=0, in=1)");
            $finish;
        end

        // Test case 3: sel = 1, in = 0
        in = 0; sel = 1;
        #10;
        if (out0 !== 0 || out1 !== 0) begin
            $display("FAIL: Test case 3 failed (sel=1, in=0)");
            $finish;
        end

        // Test case 4: sel = 1, in = 1
        in = 1; sel = 1;
        #10;
        if (out0 !== 0 || out1 !== 1) begin
            $display("FAIL: Test case 4 failed (sel=1, in=1)");
            $finish;
        end

        // Test case 5: sel = 0, in = 0 (default case)
        in = 0; sel = 0;
        #10;
        if (out0 !== 0 || out1 !== 0) begin
            $display("FAIL: Test case 5 failed (sel=0, in=0)");
            $finish;
        end

        // Test case 6: sel = 1, in = 0 (default case)
        in = 0; sel = 1;
        #10;
        if (out0 !== 0 || out1 !== 0) begin
            $display("FAIL: Test case 6 failed (sel=1, in=0)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule