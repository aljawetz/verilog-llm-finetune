`timescale 1ns/1ps

module tb_bcd_to_excess3;

    reg [3:0] b;
    wire [3:0] e;

    // Instantiate the module under test (uut)
    bcd_to_excess3 uut (
        .b(b),
        .e(e)
    );

    initial begin
        // Test cases for BCD to Excess-3 conversion
        // BCD 0 (0000) -> Excess-3 3 (0011)
        b = 4'b0000; #10;
        if (e !== 4'b0011) $display("FAIL: BCD 0 failed, got %b instead of 0011", e);

        // BCD 1 (0001) -> Excess-3 4 (0100)
        b = 4'b0001; #10;
        if (e !== 4'b0100) $display("FAIL: BCD 1 failed, got %b instead of 0100", e);

        // BCD 2 (0010) -> Excess-3 5 (0101)
        b = 4'b0010; #10;
        if (e !== 4'b0101) $display("FAIL: BCD 2 failed, got %b instead of 0101", e);

        // BCD 3 (0011) -> Excess-3 6 (0110)
        b = 4'b0011; #10;
        if (e !== 4'b0110) $display("FAIL: BCD 3 failed, got %b instead of 0110", e);

        // BCD 4 (0100) -> Excess-3 7 (0111)
        b = 4'b0100; #10;
        if (e !== 4'b0111) $display("FAIL: BCD 4 failed, got %b instead of 0111", e);

        // BCD 5 (0101) -> Excess-3 8 (1000)
        b = 4'b0101; #10;
        if (e !== 4'b1000) $display("FAIL: BCD 5 failed, got %b instead of 1000", e);

        // BCD 6 (0110) -> Excess-3 9 (1001)
        b = 4'b0110; #10;
        if (e !== 4'b1001) $display("FAIL: BCD 6 failed, got %b instead of 1001", e);

        // BCD 7 (0111) -> Excess-3 A (1010)
        b = 4'b0111; #10;
        if (e !== 4'b1010) $display("FAIL: BCD 7 failed, got %b instead of 1010", e);

        // BCD 8 (1000) -> Excess-3 B (1011)
        b = 4'b1000; #10;
        if (e !== 4'b1011) $display("FAIL: BCD 8 failed, got %b instead of 1011", e);

        // BCD 9 (1001) -> Excess-3 C (1100)
        b = 4'b1001; #10;
        if (e !== 4'b1100) $display("FAIL: BCD 9 failed, got %b instead of 1100", e);

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule