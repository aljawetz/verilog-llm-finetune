`timescale 1ns/1ps

module tb_bcd_to_excess3;

    reg [3:0] in;
    wire [3:0] out;

    // Instantiate the module under test (uut)
    bcd_to_excess3 uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test cases
        // BCD 0 (0000) -> Excess-3 3 (0011)
        in = 4'b0000; #10;
        if (out !== 4'b0011) $display("FAIL: Test case BCD 0 failed");

        // BCD 1 (0001) -> Excess-3 4 (0100)
        in = 4'b0001; #10;
        if (out !== 4'b0100) $display("FAIL: Test case BCD 1 failed");

        // BCD 2 (0010) -> Excess-3 5 (0101)
        in = 4'b0010; #10;
        if (out !== 4'b0101) $display("FAIL: Test case BCD 2 failed");

        // BCD 3 (0011) -> Excess-3 6 (0110)
        in = 4'b0011; #10;
        if (out !== 4'b0110) $display("FAIL: Test case BCD 3 failed");

        // BCD 4 (0100) -> Excess-3 7 (0111)
        in = 4'b0100; #10;
        if (out !== 4'b0111) $display("FAIL: Test case BCD 4 failed");

        // BCD 5 (0101) -> Excess-3 8 (1000)
        in = 4'b0101; #10;
        if (out !== 4'b1000) $display("FAIL: Test case BCD 5 failed");

        // BCD 6 (0110) -> Excess-3 9 (1001)
        in = 4'b0110; #10;
        if (out !== 4'b1001) $display("FAIL: Test case BCD 6 failed");

        // BCD 7 (0111) -> Excess-3 A (1010)
        in = 4'b0111; #10;
        if (out !== 4'b1010) $display("FAIL: Test case BCD 7 failed");

        // BCD 8 (1000) -> Excess-3 B (1011)
        in = 4'b1000; #10;
        if (out !== 4'b1011) $display("FAIL: Test case BCD 8 failed");

        // BCD 9 (1001) -> Excess-3 C (1100)
        in = 4'b1001; #10;
        if (out !== 4'b1100) $display("FAIL: Test case BCD 9 failed");

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule