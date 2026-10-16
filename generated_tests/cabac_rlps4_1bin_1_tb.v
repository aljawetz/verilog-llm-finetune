`timescale 1ns/1ps

module tb_cabac_rlps4_1bin;

    reg [5:0] pstateidx;
    wire [31:0] four_rlps;
    wire [43:0] four_rlps_shift;

    // Instantiate the unit under test (uut)
    cabac_rlps4_1bin uut (
        .pstateidx(pstateidx),
        .four_rlps(four_rlps),
        .four_rlps_shift(four_rlps_shift)
    );

    initial begin
        // Test cases
        // Test case 1: pstateidx = 0
        pstateidx = 6'h0;
        #10;
        if (four_rlps !== 32'h80B0D0F0) begin
            $display("FAIL: Test case 1 failed for pstateidx = 0");
            $finish;
        end

        // Test case 2: pstateidx = 1
        pstateidx = 6'h1;
        #10;
        if (four_rlps !== 32'h80A7C5E3) begin
            $display("FAIL: Test case 2 failed for pstateidx = 1");
            $finish;
        end

        // Test case 3: pstateidx = 2
        pstateidx = 6'h2;
        #10;
        if (four_rlps !== 32'h809EBBD8) begin
            $display("FAIL: Test case 3 failed for pstateidx = 2");
            $finish;
        end

        // Test case 4: pstateidx = 3
        pstateidx = 6'h3;
        #10;
        if (four_rlps !== 32'h7B96B2CD) begin
            $display("FAIL: Test case 4 failed for pstateidx = 3");
            $finish;
        end

        // Test case 5: pstateidx = 4
        pstateidx = 6'h4;
        #10;
        if (four_rlps !== 32'h748EA9C3) begin
            $display("FAIL: Test case 5 failed for pstateidx = 4");
            $finish;
        end

        // Test case 6: pstateidx = 5
        pstateidx = 6'h5;
        #10;
        if (four_rlps !== 32'h6F87A0B9) begin
            $display("FAIL: Test case 6 failed for pstateidx = 5");
            $finish;
        end

        // Test case 7: pstateidx = 6
        pstateidx = 6'h6;
        #10;
        if (four_rlps !== 32'h698098AF) begin
            $display("FAIL: Test case 7 failed for pstateidx = 6");
            $finish;
        end

        // Test case 8: pstateidx = 7
        pstateidx = 6'h7;
        #10;
        if (four_rlps !== 32'h647A90A6) begin
            $display("FAIL: Test case 8 failed for pstateidx = 7");
            $finish;
        end

        // Test case 9: pstateidx = 8
        pstateidx = 6'h8;
        #10;
        if (four_rlps !== 32'h5F74899E) begin
            $display("FAIL: Test case 9 failed for pstateidx = 8");
            $finish;
        end

        // Test case 10: pstateidx = 15
        pstateidx = 6'hF;
        #10;
        if (four_rlps !== 32'h42505F6E) begin
            $display("FAIL: Test case 10 failed for pstateidx = 15");
            $finish;
        end

        // Test case 11: pstateidx = 31
        pstateidx = 6'h1F;
        #10;
        if (four_rlps !== 32'h1D232930) begin
            $display("FAIL: Test case 11 failed for pstateidx = 31");
            $finish;
        end

        // Test case 12: pstateidx = 63 (default case)
        pstateidx = 6'h3F;
        #10;
        if (four_rlps !== 32'h02020202) begin
            $display("FAIL: Test case 12 failed for pstateidx = 63");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule