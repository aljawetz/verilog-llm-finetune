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
        // Test case for 0
        disp_dec_in = 4'b0000; #10;
        if (disp_dec_out !== 7'b1000000) begin
            $display("FAIL: Test case for input 0 failed");
            $finish;
        end

        // Test case for 1
        disp_dec_in = 4'b0001; #10;
        if (disp_dec_out !== 7'b1111001) begin
            $display("FAIL: Test case for input 1 failed");
            $finish;
        end

        // Test case for 2
        disp_dec_in = 4'b0010; #10;
        if (disp_dec_out !== 7'b0100100) begin
            $display("FAIL: Test case for input 2 failed");
            $finish;
        end

        // Test case for 3
        disp_dec_in = 4'b0011; #10;
        if (disp_dec_out !== 7'b0110000) begin
            $display("FAIL: Test case for input 3 failed");
            $finish;
        end

        // Test case for 4
        disp_dec_in = 4'b0100; #10;
        if (disp_dec_out !== 7'b0011001) begin
            $display("FAIL: Test case for input 4 failed");
            $finish;
        end

        // Test case for 5
        disp_dec_in = 4'b0101; #10;
        if (disp_dec_out !== 7'b0010010) begin
            $display("FAIL: Test case for input 5 failed");
            $finish;
        end

        // Test case for 6
        disp_dec_in = 4'b0110; #10;
        if (disp_dec_out !== 7'b0000010) begin
            $display("FAIL: Test case for input 6 failed");
            $finish;
        end

        // Test case for 7
        disp_dec_in = 4'b0111; #10;
        if (disp_dec_out !== 7'b1111000) begin
            $display("FAIL: Test case for input 7 failed");
            $finish;
        end

        // Test case for 8
        disp_dec_in = 4'b1000; #10;
        if (disp_dec_out !== 7'b0000000) begin
            $display("FAIL: Test case for input 8 failed");
            $finish;
        end

        // Test case for 9
        disp_dec_in = 4'b1001; #10;
        if (disp_dec_out !== 7'b0010000) begin
            $display("FAIL: Test case for input 9 failed");
            $finish;
        end

        // Test case for A
        disp_dec_in = 4'b1010; #10;
        if (disp_dec_out !== 7'b0001000) begin
            $display("FAIL: Test case for input A failed");
            $finish;
        end

        // Test case for B
        disp_dec_in = 4'b1011; #10;
        if (disp_dec_out !== 7'b0000011) begin
            $display("FAIL: Test case for input B failed");
            $finish;
        end

        // Test case for C
        disp_dec_in = 4'b1100; #10;
        if (disp_dec_out !== 7'b1000110) begin
            $display("FAIL: Test case for input C failed");
            $finish;
        end

        // Test case for D
        disp_dec_in = 4'b1101; #10;
        if (disp_dec_out !== 7'b0100001) begin
            $display("FAIL: Test case for input D failed");
            $finish;
        end

        // Test case for E
        disp_dec_in = 4'b1110; #10;
        if (disp_dec_out !== 7'b0000110) begin
            $display("FAIL: Test case for input E failed");
            $finish;
        end

        // Test case for F
        disp_dec_in = 4'b1111; #10;
        if (disp_dec_out !== 7'b0001110) begin
            $display("FAIL: Test case for input F failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule