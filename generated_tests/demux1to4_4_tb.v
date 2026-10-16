`timescale 1ns/1ps

module tb_demux1to4;
    reg D;
    reg S0;
    reg S1;
    reg EN;
    wire Y0;
    wire Y1;
    wire Y2;
    wire Y3;

    // Instantiate the demux1to4 module
    demux1to4 uut (
        .D(D),
        .S0(S0),
        .S1(S1),
        .EN(EN),
        .Y0(Y0),
        .Y1(Y1),
        .Y2(Y2),
        .Y3(Y3)
    );

    initial begin
        // Initialize inputs
        D = 0; S0 = 0; S1 = 0; EN = 0;

        // Test case 1: EN = 0, all outputs should be 0
        #10;
        if (Y0 !== 0 || Y1 !== 0 || Y2 !== 0 || Y3 !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: EN = 1, D = 1, S0 = 0, S1 = 0, Y0 should be 1
        EN = 1; D = 1; S0 = 0; S1 = 0;
        #10;
        if (Y0 !== 1 || Y1 !== 0 || Y2 !== 0 || Y3 !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: EN = 1, D = 1, S0 = 1, S1 = 0, Y1 should be 1
        S0 = 1; S1 = 0;
        #10;
        if (Y0 !== 0 || Y1 !== 1 || Y2 !== 0 || Y3 !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: EN = 1, D = 1, S0 = 0, S1 = 1, Y2 should be 1
        S0 = 0; S1 = 1;
        #10;
        if (Y0 !== 0 || Y1 !== 0 || Y2 !== 1 || Y3 !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: EN = 1, D = 1, S0 = 1, S1 = 1, Y3 should be 1
        S0 = 1; S1 = 1;
        #10;
        if (Y0 !== 0 || Y1 !== 0 || Y2 !== 0 || Y3 !== 1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: EN = 1, D = 0, S0 = 0, S1 = 0, all outputs should be 0
        D = 0; S0 = 0; S1 = 0;
        #10;
        if (Y0 !== 0 || Y1 !== 0 || Y2 !== 0 || Y3 !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule