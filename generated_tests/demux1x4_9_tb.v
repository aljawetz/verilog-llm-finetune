`timescale 1ns/1ps

module tb_demux1x4;
    reg d;
    reg s0;
    reg s1;
    wire i0;
    wire i1;
    wire i2;
    wire i3;

    // Instantiate the module under test (uut)
    demux1x4 uut (
        .d(d),
        .s0(s0),
        .s1(s1),
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3)
    );

    initial begin
        // Initialize inputs
        d = 0; s0 = 0; s1 = 0;

        // Test case 1: d=1, s0=0, s1=0 -> i0 should be 1
        d = 1; s0 = 0; s1 = 0; #10;
        if (i0 !== 1 || i1 !== 0 || i2 !== 0 || i3 !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: d=1, s0=1, s1=0 -> i1 should be 1
        d = 1; s0 = 1; s1 = 0; #10;
        if (i0 !== 0 || i1 !== 1 || i2 !== 0 || i3 !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: d=1, s0=0, s1=1 -> i2 should be 1
        d = 1; s0 = 0; s1 = 1; #10;
        if (i0 !== 0 || i1 !== 0 || i2 !== 1 || i3 !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: d=1, s0=1, s1=1 -> i3 should be 1
        d = 1; s0 = 1; s1 = 1; #10;
        if (i0 !== 0 || i1 !== 0 || i2 !== 0 || i3 !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: d=0, s0=0, s1=0 -> all outputs should be 0
        d = 0; s0 = 0; s1 = 0; #10;
        if (i0 !== 0 || i1 !== 0 || i2 !== 0 || i3 !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: d=0, s0=1, s1=1 -> all outputs should be 0
        d = 0; s0 = 1; s1 = 1; #10;
        if (i0 !== 0 || i1 !== 0 || i2 !== 0 || i3 !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule