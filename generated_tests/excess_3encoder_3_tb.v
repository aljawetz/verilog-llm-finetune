`timescale 1ns/1ps

module tb_excess_3encoder;

    reg [3:0] binary;
    wire [3:0] excess3;

    // Instantiate the module under test (uut)
    excess_3encoder uut (
        .binary(binary),
        .excess3(excess3)
    );

    initial begin
        // Test cases
        binary = 4'b0000; #10; // 0 + 3 = 3 -> 0011
        if (excess3 !== 4'b0011) $display("FAIL: Test case 0 failed");

        binary = 4'b0001; #10; // 1 + 3 = 4 -> 0100
        if (excess3 !== 4'b0100) $display("FAIL: Test case 1 failed");

        binary = 4'b0010; #10; // 2 + 3 = 5 -> 0101
        if (excess3 !== 4'b0101) $display("FAIL: Test case 2 failed");

        binary = 4'b0011; #10; // 3 + 3 = 6 -> 0110
        if (excess3 !== 4'b0110) $display("FAIL: Test case 3 failed");

        binary = 4'b0100; #10; // 4 + 3 = 7 -> 0111
        if (excess3 !== 4'b0111) $display("FAIL: Test case 4 failed");

        binary = 4'b0101; #10; // 5 + 3 = 8 -> 1000
        if (excess3 !== 4'b1000) $display("FAIL: Test case 5 failed");

        binary = 4'b0110; #10; // 6 + 3 = 9 -> 1001
        if (excess3 !== 4'b1001) $display("FAIL: Test case 6 failed");

        binary = 4'b0111; #10; // 7 + 3 = 10 -> 1010
        if (excess3 !== 4'b1010) $display("FAIL: Test case 7 failed");

        binary = 4'b1000; #10; // 8 + 3 = 11 -> 1011
        if (excess3 !== 4'b1011) $display("FAIL: Test case 8 failed");

        binary = 4'b1001; #10; // 9 + 3 = 12 -> 1100
        if (excess3 !== 4'b1100) $display("FAIL: Test case 9 failed");

        binary = 4'b1010; #10; // 10 + 3 = 13 -> 1101
        if (excess3 !== 4'b1101) $display("FAIL: Test case 10 failed");

        binary = 4'b1011; #10; // 11 + 3 = 14 -> 1110
        if (excess3 !== 4'b1110) $display("FAIL: Test case 11 failed");

        binary = 4'b1100; #10; // 12 + 3 = 15 -> 1111
        if (excess3 !== 4'b1111) $display("FAIL: Test case 12 failed");

        binary = 4'b1101; #10; // 13 + 3 = 16 -> 0000 (wrap around)
        if (excess3 !== 4'b0000) $display("FAIL: Test case 13 failed");

        binary = 4'b1110; #10; // 14 + 3 = 17 -> 0001 (wrap around)
        if (excess3 !== 4'b0001) $display("FAIL: Test case 14 failed");

        binary = 4'b1111; #10; // 15 + 3 = 18 -> 0010 (wrap around)
        if (excess3 !== 4'b0010) $display("FAIL: Test case 15 failed");

        $display("PASS");
        $finish;
    end

endmodule