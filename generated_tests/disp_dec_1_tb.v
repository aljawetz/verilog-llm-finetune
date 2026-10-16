`timescale 1ns/1ps

module tb_disp_dec;

    reg [3:0] disp_dec_in;
    wire [6:0] disp_dec_out;

    // Instantiate the module under test (uut)
    disp_dec uut (
        .disp_dec_in(disp_dec_in),
        .disp_dec_out(disp_dec_out)
    );

    initial begin
        // Test cases
        disp_dec_in = 4'b0000; #10;
        if (disp_dec_out !== 7'b1000000) $display("FAIL: Test case 0 failed");

        disp_dec_in = 4'b0001; #10;
        if (disp_dec_out !== 7'b1111001) $display("FAIL: Test case 1 failed");

        disp_dec_in = 4'b0010; #10;
        if (disp_dec_out !== 7'b0100100) $display("FAIL: Test case 2 failed");

        disp_dec_in = 4'b0011; #10;
        if (disp_dec_out !== 7'b0110000) $display("FAIL: Test case 3 failed");

        disp_dec_in = 4'b0100; #10;
        if (disp_dec_out !== 7'b0011001) $display("FAIL: Test case 4 failed");

        disp_dec_in = 4'b0101; #10;
        if (disp_dec_out !== 7'b0010010) $display("FAIL: Test case 5 failed");

        disp_dec_in = 4'b0110; #10;
        if (disp_dec_out !== 7'b0000010) $display("FAIL: Test case 6 failed");

        disp_dec_in = 4'b0111; #10;
        if (disp_dec_out !== 7'b1111000) $display("FAIL: Test case 7 failed");

        disp_dec_in = 4'b1000; #10;
        if (disp_dec_out !== 7'b0000000) $display("FAIL: Test case 8 failed");

        disp_dec_in = 4'b1001; #10;
        if (disp_dec_out !== 7'b0010000) $display("FAIL: Test case 9 failed");

        disp_dec_in = 4'b1010; #10;
        if (disp_dec_out !== 7'b0001000) $display("FAIL: Test case 10 failed");

        disp_dec_in = 4'b1011; #10;
        if (disp_dec_out !== 7'b0000011) $display("FAIL: Test case 11 failed");

        disp_dec_in = 4'b1100; #10;
        if (disp_dec_out !== 7'b1000110) $display("FAIL: Test case 12 failed");

        disp_dec_in = 4'b1101; #10;
        if (disp_dec_out !== 7'b0100001) $display("FAIL: Test case 13 failed");

        disp_dec_in = 4'b1110; #10;
        if (disp_dec_out !== 7'b0000110) $display("FAIL: Test case 14 failed");

        disp_dec_in = 4'b1111; #10;
        if (disp_dec_out !== 7'b0001110) $display("FAIL: Test case 15 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule