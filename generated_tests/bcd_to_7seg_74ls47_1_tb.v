`timescale 1ns/1ps

module tb_bcd_to_7seg_74ls47;

    reg [3:0] bcd;
    reg RBI;
    wire [6:0] seg;
    wire RBO;

    // Instantiate the module under test (uut)
    bcd_to_7seg_74ls47 uut (
        .bcd(bcd),
        .RBI(RBI),
        .seg(seg),
        .RBO(RBO)
    );

    initial begin
        // Test case 1: RBI = 1, BCD = 0
        RBI = 1; bcd = 4'b0000; #10;
        if (seg !== 7'b0000000 || RBO !== 1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: RBI = 1, BCD = 1
        bcd = 4'b0001; #10;
        if (seg !== 7'b0110000 || RBO !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: RBI = 1, BCD = 2
        bcd = 4'b0010; #10;
        if (seg !== 7'b1101101 || RBO !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: RBI = 1, BCD = 3
        bcd = 4'b0011; #10;
        if (seg !== 7'b1111001 || RBO !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: RBI = 1, BCD = 4
        bcd = 4'b0100; #10;
        if (seg !== 7'b0110011 || RBO !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: RBI = 1, BCD = 5
        bcd = 4'b0101; #10;
        if (seg !== 7'b1011011 || RBO !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: RBI = 1, BCD = 6
        bcd = 4'b0110; #10;
        if (seg !== 7'b1011111 || RBO !== 0) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: RBI = 1, BCD = 7
        bcd = 4'b0111; #10;
        if (seg !== 7'b1110000 || RBO !== 0) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // Test case 9: RBI = 1, BCD = 8
        bcd = 4'b1000; #10;
        if (seg !== 7'b1111111 || RBO !== 0) begin
            $display("FAIL: Test case 9 failed");
            $finish;
        end

        // Test case 10: RBI = 1, BCD = 9
        bcd = 4'b1001; #10;
        if (seg !== 7'b1111011 || RBO !== 0) begin
            $display("FAIL: Test case 10 failed");
            $finish;
        end

        // Test case 11: RBI = 1, BCD = A
        bcd = 4'b1010; #10;
        if (seg !== 7'b1110111 || RBO !== 0) begin
            $display("FAIL: Test case 11 failed");
            $finish;
        end

        // Test case 12: RBI = 1, BCD = B
        bcd = 4'b1011; #10;
        if (seg !== 7'b0011111 || RBO !== 0) begin
            $display("FAIL: Test case 12 failed");
            $finish;
        end

        // Test case 13: RBI = 1, BCD = C
        bcd = 4'b1100; #10;
        if (seg !== 7'b1001110 || RBO !== 0) begin
            $display("FAIL: Test case 13 failed");
            $finish;
        end

        // Test case 14: RBI = 1, BCD = D
        bcd = 4'b1101; #10;
        if (seg !== 7'b0111101 || RBO !== 0) begin
            $display("FAIL: Test case 14 failed");
            $finish;
        end

        // Test case 15: RBI = 1, BCD = E
        bcd = 4'b1110; #10;
        if (seg !== 7'b1001111 || RBO !== 0) begin
            $display("FAIL: Test case 15 failed");
            $finish;
        end

        // Test case 16: RBI = 1, BCD = F
        bcd = 4'b1111; #10;
        if (seg !== 7'b1000111 || RBO !== 0) begin
            $display("FAIL: Test case 16 failed");
            $finish;
        end

        // Test case 17: RBI = 0, BCD = 0
        RBI = 0; bcd = 4'b0000; #10;
        if (seg !== 7'b1111110 || RBO !== 0) begin
            $display("FAIL: Test case 17 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule