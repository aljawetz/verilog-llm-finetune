`timescale 1ns/1ps

module tb_decoder_2to4;

    // Inputs
    reg en;
    reg in1;
    reg in0;

    // Outputs
    wire y3;
    wire y2;
    wire y1;
    wire y0;

    // Instantiate the Unit Under Test (UUT)
    decoder_2to4 uut (
        .en(en),
        .in1(in1),
        .in0(in0),
        .y3(y3),
        .y2(y2),
        .y1(y1),
        .y0(y0)
    );

    initial begin
        // Initialize Inputs
        en = 0; in1 = 0; in0 = 0;

        // Test case 1: Disabled decoder
        #10;
        if (y3 !== 1'bz || y2 !== 1'bz || y1 !== 1'bz || y0 !== 1'bz) begin
            $display("FAIL: Test case 1 failed - Outputs should be high impedance when disabled");
            $finish;
        end

        // Enable decoder
        en = 1;

        // Test case 2: Input 00
        in1 = 0; in0 = 0; #10;
        if (y3 !== 0 || y2 !== 0 || y1 !== 0 || y0 !== 1) begin
            $display("FAIL: Test case 2 failed - Expected outputs (0, 0, 0, 1) for input (0, 0)");
            $finish;
        end

        // Test case 3: Input 01
        in1 = 0; in0 = 1; #10;
        if (y3 !== 0 || y2 !== 0 || y1 !== 1 || y0 !== 0) begin
            $display("FAIL: Test case 3 failed - Expected outputs (0, 0, 1, 0) for input (0, 1)");
            $finish;
        end

        // Test case 4: Input 10
        in1 = 1; in0 = 0; #10;
        if (y3 !== 0 || y2 !== 1 || y1 !== 0 || y0 !== 0) begin
            $display("FAIL: Test case 4 failed - Expected outputs (0, 1, 0, 0) for input (1, 0)");
            $finish;
        end

        // Test case 5: Input 11
        in1 = 1; in0 = 1; #10;
        if (y3 !== 1 || y2 !== 0 || y1 !== 0 || y0 !== 0) begin
            $display("FAIL: Test case 5 failed - Expected outputs (1, 0, 0, 0) for input (1, 1)");
            $finish;
        end

        // Test case 6: Disabled decoder again
        en = 0; #10;
        if (y3 !== 1'bz || y2 !== 1'bz || y1 !== 1'bz || y0 !== 1'bz) begin
            $display("FAIL: Test case 6 failed - Outputs should be high impedance when disabled");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule