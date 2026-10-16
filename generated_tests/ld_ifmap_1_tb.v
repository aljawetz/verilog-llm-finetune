`timescale 1ns/1ps

module tb_ld_ifmap;

    reg clk;
    reg en;
    reg [4:0] icb;
    reg [4:0] ic;
    reg [15:0] ifm_width;
    reg [15:0] ifm_height;
    reg [4:0] filter_width;
    reg [4:0] filter_height;
    wire [15:0] w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24;

    ld_ifmap uut (
        .clk(clk),
        .en(en),
        .icb(icb),
        .ic(ic),
        .ifm_width(ifm_width),
        .ifm_height(ifm_height),
        .filter_width(filter_width),
        .filter_height(filter_height),
        .w0(w0), .w1(w1), .w2(w2), .w3(w3), .w4(w4),
        .w5(w5), .w6(w6), .w7(w7), .w8(w8), .w9(w9),
        .w10(w10), .w11(w11), .w12(w12), .w13(w13), .w14(w14),
        .w15(w15), .w16(w16), .w17(w17), .w18(w18), .w19(w19),
        .w20(w20), .w21(w21), .w22(w22), .w23(w23), .w24(w24)
    );

    initial begin
        clk = 0;
        en = 0;
        icb = 5'd1;
        ic = 5'd1;
        ifm_width = 16'd5;
        ifm_height = 16'd5;
        filter_width = 5'd3;
        filter_height = 5'd3;

        // Initialize the ifmap with some values
        uut.ifmap[0] = 16'd1;
        uut.ifmap[1] = 16'd2;
        uut.ifmap[2] = 16'd3;
        uut.ifmap[3] = 16'd4;
        uut.ifmap[4] = 16'd5;
        uut.ifmap[5] = 16'd6;
        uut.ifmap[6] = 16'd7;
        uut.ifmap[7] = 16'd8;
        uut.ifmap[8] = 16'd9;
        uut.ifmap[9] = 16'd10;
        uut.ifmap[10] = 16'd11;
        uut.ifmap[11] = 16'd12;
        uut.ifmap[12] = 16'd13;
        uut.ifmap[13] = 16'd14;
        uut.ifmap[14] = 16'd15;
        uut.ifmap[15] = 16'd16;
        uut.ifmap[16] = 16'd17;
        uut.ifmap[17] = 16'd18;
        uut.ifmap[18] = 16'd19;
        uut.ifmap[19] = 16'd20;
        uut.ifmap[20] = 16'd21;
        uut.ifmap[21] = 16'd22;
        uut.ifmap[22] = 16'd23;
        uut.ifmap[23] = 16'd24;
        uut.ifmap[24] = 16'd25;

        // Start the test
        en = 1;
        #10;

        // Check outputs after some clock cycles
        repeat (10) begin
            #10 clk = ~clk;
            if (clk) begin
                // Check expected outputs
                if (uut.w0 !== 16'd1) $display("FAIL: w0 expected 1, got %d", uut.w0);
                if (uut.w1 !== 16'd2) $display("FAIL: w1 expected 2, got %d", uut.w1);
                if (uut.w2 !== 16'd3) $display("FAIL: w2 expected 3, got %d", uut.w2);
                if (uut.w3 !== 16'd4) $display("FAIL: w3 expected 4, got %d", uut.w3);
                if (uut.w4 !== 16'd5) $display("FAIL: w4 expected 5, got %d", uut.w4);
                if (uut.w5 !== 16'd6) $display("FAIL: w5 expected 6, got %d", uut.w5);
                if (uut.w6 !== 16'd7) $display("FAIL: w6 expected 7, got %d", uut.w6);
                if (uut.w7 !== 16'd8) $display("FAIL: w7 expected 8, got %d", uut.w7);
                if (uut.w8 !== 16'd9) $display("FAIL: w8 expected 9, got %d", uut.w8);
                if (uut.w9 !== 16'd10) $display("FAIL: w9 expected 10, got %d", uut.w9);
                if (uut.w10 !== 16'd11) $display("FAIL: w10 expected 11, got %d", uut.w10);
                if (uut.w11 !== 16'd12) $display("FAIL: w11 expected 12, got %d", uut.w11);
                if (uut.w12 !== 16'd13) $display("FAIL: w12 expected 13, got %d", uut.w12);
                if (uut.w13 !== 16'd14) $display("FAIL: w13 expected 14, got %d", uut.w13);
                if (uut.w14 !== 16'd15) $display("FAIL: w14 expected 15, got %d", uut.w14);
                if (uut.w15 !== 16'd16) $display("FAIL: w15 expected 16, got %d", uut.w15);
                if (uut.w16 !== 16'd17) $display("FAIL: w16 expected 17, got %d", uut.w16);
                if (uut.w17 !== 16'd18) $display("FAIL: w17 expected 18, got %d", uut.w17);
                if (uut.w18 !== 16'd19) $display("FAIL: w18 expected 19, got %d", uut.w18);
                if (uut.w19 !== 16'd20) $display("FAIL: w19 expected 20, got %d", uut.w19);
                if (uut.w20 !== 16'd21) $display("FAIL: w20 expected 21, got %d", uut.w20);
                if (uut.w21 !== 16'd22) $display("FAIL: w21 expected 22, got %d", uut.w21);
                if (uut.w22 !== 16'd23) $display("FAIL: w22 expected 23, got %d", uut.w22);
                if (uut.w23 !== 16'd24) $display("FAIL: w23 expected 24, got %d", uut.w23);
                if (uut.w24 !== 16'd25) $display("FAIL: w24 expected 25, got %d", uut.w24);
            end
        end

        $display("PASS");
        $finish;
    end

    always #5 clk = ~clk; // Clock generation

endmodule