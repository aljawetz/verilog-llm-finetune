`timescale 1ns/1ps

module tb_bcdtoexcess3;

    reg [3:0] a;
    wire [3:0] y;

    // Instantiate the module under test (uut)
    bcdtoexcess3 uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test cases
        // BCD 0 (0000) -> Excess-3 3 (0011)
        a = 4'b0000; #10;
        if (y !== 4'b0011) begin
            $display("FAIL: Test case BCD 0 failed, got %b, expected 0011", y);
            $finish;
        end

        // BCD 1 (0001) -> Excess-3 4 (0100)
        a = 4'b0001; #10;
        if (y !== 4'b0100) begin
            $display("FAIL: Test case BCD 1 failed, got %b, expected 0100", y);
            $finish;
        end

        // BCD 2 (0010) -> Excess-3 5 (0101)
        a = 4'b0010; #10;
        if (y !== 4'b0101) begin
            $display("FAIL: Test case BCD 2 failed, got %b, expected 0101", y);
            $finish;
        end

        // BCD 3 (0011) -> Excess-3 6 (0110)
        a = 4'b0011; #10;
        if (y !== 4'b0110) begin
            $display("FAIL: Test case BCD 3 failed, got %b, expected 0110", y);
            $finish;
        end

        // BCD 4 (0100) -> Excess-3 7 (0111)
        a = 4'b0100; #10;
        if (y !== 4'b0111) begin
            $display("FAIL: Test case BCD 4 failed, got %b, expected 0111", y);
            $finish;
        end

        // BCD 5 (0101) -> Excess-3 8 (1000)
        a = 4'b0101; #10;
        if (y !== 4'b1000) begin
            $display("FAIL: Test case BCD 5 failed, got %b, expected 1000", y);
            $finish;
        end

        // BCD 6 (0110) -> Excess-3 9 (1001)
        a = 4'b0110; #10;
        if (y !== 4'b1001) begin
            $display("FAIL: Test case BCD 6 failed, got %b, expected 1001", y);
            $finish;
        end

        // BCD 7 (0111) -> Excess-3 10 (1010)
        a = 4'b0111; #10;
        if (y !== 4'b1010) begin
            $display("FAIL: Test case BCD 7 failed, got %b, expected 1010", y);
            $finish;
        end

        // BCD 8 (1000) -> Excess-3 11 (1011)
        a = 4'b1000; #10;
        if (y !== 4'b1011) begin
            $display("FAIL: Test case BCD 8 failed, got %b, expected 1011", y);
            $finish;
        end

        // BCD 9 (1001) -> Excess-3 12 (1100)
        a = 4'b1001; #10;
        if (y !== 4'b1100) begin
            $display("FAIL: Test case BCD 9 failed, got %b, expected 1100", y);
            $finish;
        end

        // BCD 10 (1010) is invalid, should not be tested
        // BCD 11 (1011) is invalid, should not be tested
        // BCD 12 (1100) is invalid, should not be tested
        // BCD 13 (1101) is invalid, should not be tested
        // BCD 14 (1110) is invalid, should not be tested
        // BCD 15 (1111) is invalid, should not be tested

        $display("PASS");
        $finish;
    end

endmodule