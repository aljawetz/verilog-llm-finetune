`timescale 1ns/1ps

module tb_demux1to8;

    reg D;
    reg S0;
    reg S1;
    reg S2;
    reg EN;
    wire [7:0] Y;

    // Instantiate the module under test
    demux1to8 uut (
        .D(D),
        .S0(S0),
        .S1(S1),
        .S2(S2),
        .EN(EN),
        .Y(Y)
    );

    initial begin
        // Initialize inputs
        D = 0; S0 = 0; S1 = 0; S2 = 0; EN = 0;

        // Test case 1: EN = 0, all outputs should be 0
        #10;
        EN = 0; D = 1; S0 = 0; S1 = 0; S2 = 0;
        #10;
        if (Y !== 8'b00000000) begin
            $display("FAIL: Test case 1 failed, expected 00000000, got %b", Y);
            $finish;
        end

        // Test case 2: EN = 1, D = 1, S0 = 0, S1 = 0, S2 = 0, Y[0] should be 1
        #10;
        EN = 1; D = 1; S0 = 0; S1 = 0; S2 = 0;
        #10;
        if (Y !== 8'b00000001) begin
            $display("FAIL: Test case 2 failed, expected 00000001, got %b", Y);
            $finish;
        end

        // Test case 3: EN = 1, D = 1, S0 = 1, S1 = 0, S2 = 0, Y[1] should be 1
        #10;
        S0 = 1; S1 = 0; S2 = 0;
        #10;
        if (Y !== 8'b00000010) begin
            $display("FAIL: Test case 3 failed, expected 00000010, got %b", Y);
            $finish;
        end

        // Test case 4: EN = 1, D = 1, S0 = 0, S1 = 1, S2 = 0, Y[2] should be 1
        #10;
        S0 = 0; S1 = 1; S2 = 0;
        #10;
        if (Y !== 8'b00000100) begin
            $display("FAIL: Test case 4 failed, expected 00000100, got %b", Y);
            $finish;
        end

        // Test case 5: EN = 1, D = 1, S0 = 1, S1 = 1, S2 = 0, Y[3] should be 1
        #10;
        S0 = 1; S1 = 1; S2 = 0;
        #10;
        if (Y !== 8'b00001000) begin
            $display("FAIL: Test case 5 failed, expected 00001000, got %b", Y);
            $finish;
        end

        // Test case 6: EN = 1, D = 1, S0 = 0, S1 = 0, S2 = 1, Y[4] should be 1
        #10;
        S0 = 0; S1 = 0; S2 = 1;
        #10;
        if (Y !== 8'b00010000) begin
            $display("FAIL: Test case 6 failed, expected 00010000, got %b", Y);
            $finish;
        end

        // Test case 7: EN = 1, D = 1, S0 = 1, S1 = 0, S2 = 1, Y[5] should be 1
        #10;
        S0 = 1; S1 = 0; S2 = 1;
        #10;
        if (Y !== 8'b00100000) begin
            $display("FAIL: Test case 7 failed, expected 00100000, got %b", Y);
            $finish;
        end

        // Test case 8: EN = 1, D = 1, S0 = 0, S1 = 1, S2 = 1, Y[6] should be 1
        #10;
        S0 = 0; S1 = 1; S2 = 1;
        #10;
        if (Y !== 8'b01000000) begin
            $display("FAIL: Test case 8 failed, expected 01000000, got %b", Y);
            $finish;
        end

        // Test case 9: EN = 1, D = 1, S0 = 1, S1 = 1, S2 = 1, Y[7] should be 1
        #10;
        S0 = 1; S1 = 1; S2 = 1;
        #10;
        if (Y !== 8'b10000000) begin
            $display("FAIL: Test case 9 failed, expected 10000000, got %b", Y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule