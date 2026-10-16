`timescale 1ns/1ps

module tb_bcd_to_excess3;

    reg [3:0] a;
    wire [3:0] y;

    // Instantiate the module under test (uut)
    bcd_to_excess3 uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test cases for BCD to Excess-3 conversion
        // BCD 0 (0000) -> Excess-3 3 (0011)
        a = 4'b0000; #10;
        if (y !== 4'b0011) $display("FAIL: Expected 3 for BCD 0, got %b", y);

        // BCD 1 (0001) -> Excess-3 4 (0100)
        a = 4'b0001; #10;
        if (y !== 4'b0100) $display("FAIL: Expected 4 for BCD 1, got %b", y);

        // BCD 2 (0010) -> Excess-3 5 (0101)
        a = 4'b0010; #10;
        if (y !== 4'b0101) $display("FAIL: Expected 5 for BCD 2, got %b", y);

        // BCD 3 (0011) -> Excess-3 6 (0110)
        a = 4'b0011; #10;
        if (y !== 4'b0110) $display("FAIL: Expected 6 for BCD 3, got %b", y);

        // BCD 4 (0100) -> Excess-3 7 (0111)
        a = 4'b0100; #10;
        if (y !== 4'b0111) $display("FAIL: Expected 7 for BCD 4, got %b", y);

        // BCD 5 (0101) -> Excess-3 8 (1000)
        a = 4'b0101; #10;
        if (y !== 4'b1000) $display("FAIL: Expected 8 for BCD 5, got %b", y);

        // BCD 6 (0110) -> Excess-3 9 (1001)
        a = 4'b0110; #10;
        if (y !== 4'b1001) $display("FAIL: Expected 9 for BCD 6, got %b", y);

        // BCD 7 (0111) -> Excess-3 10 (1010)
        a = 4'b0111; #10;
        if (y !== 4'b1010) $display("FAIL: Expected 10 for BCD 7, got %b", y);

        // BCD 8 (1000) -> Excess-3 11 (1011)
        a = 4'b1000; #10;
        if (y !== 4'b1011) $display("FAIL: Expected 11 for BCD 8, got %b", y);

        // BCD 9 (1001) -> Excess-3 12 (1100)
        a = 4'b1001; #10;
        if (y !== 4'b1100) $display("FAIL: Expected 12 for BCD 9, got %b", y);

        // BCD 10 (1010) -> Invalid BCD, Excess-3 should not be defined
        a = 4'b1010; #10;
        if (y !== 4'bxxxx) $display("FAIL: Expected undefined for BCD 10, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule