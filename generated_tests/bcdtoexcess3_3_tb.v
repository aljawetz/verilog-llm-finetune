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
        // Test cases for BCD to Excess-3 conversion
        // BCD 0 (0000) -> Excess-3 3 (0011)
        a = 4'b0000; #10;
        if (y !== 4'b0011) $display("FAIL: BCD 0 failed");

        // BCD 1 (0001) -> Excess-3 4 (0100)
        a = 4'b0001; #10;
        if (y !== 4'b0100) $display("FAIL: BCD 1 failed");

        // BCD 2 (0010) -> Excess-3 5 (0101)
        a = 4'b0010; #10;
        if (y !== 4'b0101) $display("FAIL: BCD 2 failed");

        // BCD 3 (0011) -> Excess-3 6 (0110)
        a = 4'b0011; #10;
        if (y !== 4'b0110) $display("FAIL: BCD 3 failed");

        // BCD 4 (0100) -> Excess-3 7 (0111)
        a = 4'b0100; #10;
        if (y !== 4'b0111) $display("FAIL: BCD 4 failed");

        // BCD 5 (0101) -> Excess-3 8 (1000)
        a = 4'b0101; #10;
        if (y !== 4'b1000) $display("FAIL: BCD 5 failed");

        // BCD 6 (0110) -> Excess-3 9 (1001)
        a = 4'b0110; #10;
        if (y !== 4'b1001) $display("FAIL: BCD 6 failed");

        // BCD 7 (0111) -> Excess-3 10 (1010)
        a = 4'b0111; #10;
        if (y !== 4'b1010) $display("FAIL: BCD 7 failed");

        // BCD 8 (1000) -> Excess-3 11 (1011)
        a = 4'b1000; #10;
        if (y !== 4'b1011) $display("FAIL: BCD 8 failed");

        // BCD 9 (1001) -> Excess-3 12 (1100)
        a = 4'b1001; #10;
        if (y !== 4'b1100) $display("FAIL: BCD 9 failed");

        // End of test cases
        $display("PASS");
        $finish;
    end
endmodule