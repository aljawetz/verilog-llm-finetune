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
        // Test case 0: binary = 0000 (0 in decimal)
        binary = 4'b0000; #10;
        if (excess3 !== 4'b0011) $display("FAIL: Expected 0011 for input 0000, got %b", excess3);

        // Test case 1: binary = 0001 (1 in decimal)
        binary = 4'b0001; #10;
        if (excess3 !== 4'b0100) $display("FAIL: Expected 0100 for input 0001, got %b", excess3);

        // Test case 2: binary = 0010 (2 in decimal)
        binary = 4'b0010; #10;
        if (excess3 !== 4'b0101) $display("FAIL: Expected 0101 for input 0010, got %b", excess3);

        // Test case 3: binary = 0011 (3 in decimal)
        binary = 4'b0011; #10;
        if (excess3 !== 4'b0110) $display("FAIL: Expected 0110 for input 0011, got %b", excess3);

        // Test case 4: binary = 0100 (4 in decimal)
        binary = 4'b0100; #10;
        if (excess3 !== 4'b0111) $display("FAIL: Expected 0111 for input 0100, got %b", excess3);

        // Test case 5: binary = 0101 (5 in decimal)
        binary = 4'b0101; #10;
        if (excess3 !== 4'b1000) $display("FAIL: Expected 1000 for input 0101, got %b", excess3);

        // Test case 6: binary = 0110 (6 in decimal)
        binary = 4'b0110; #10;
        if (excess3 !== 4'b1001) $display("FAIL: Expected 1001 for input 0110, got %b", excess3);

        // Test case 7: binary = 0111 (7 in decimal)
        binary = 4'b0111; #10;
        if (excess3 !== 4'b1010) $display("FAIL: Expected 1010 for input 0111, got %b", excess3);

        // Test case 8: binary = 1000 (8 in decimal)
        binary = 4'b1000; #10;
        if (excess3 !== 4'b1011) $display("FAIL: Expected 1011 for input 1000, got %b", excess3);

        // Test case 9: binary = 1001 (9 in decimal)
        binary = 4'b1001; #10;
        if (excess3 !== 4'b1100) $display("FAIL: Expected 1100 for input 1001, got %b", excess3);

        // Test case 10: binary = 1010 (10 in decimal)
        binary = 4'b1010; #10;
        if (excess3 !== 4'b1101) $display("FAIL: Expected 1101 for input 1010, got %b", excess3);

        // Test case 11: binary = 1011 (11 in decimal)
        binary = 4'b1011; #10;
        if (excess3 !== 4'b1110) $display("FAIL: Expected 1110 for input 1011, got %b", excess3);

        // Test case 12: binary = 1100 (12 in decimal)
        binary = 4'b1100; #10;
        if (excess3 !== 4'b1111) $display("FAIL: Expected 1111 for input 1100, got %b", excess3);

        // Test case 13: binary = 1101 (13 in decimal)
        binary = 4'b1101; #10;
        if (excess3 !== 4'b0000) $display("FAIL: Expected 0000 for input 1101, got %b", excess3);

        // Test case 14: binary = 1110 (14 in decimal)
        binary = 4'b1110; #10;
        if (excess3 !== 4'b0001) $display("FAIL: Expected 0001 for input 1110, got %b", excess3);

        // Test case 15: binary = 1111 (15 in decimal)
        binary = 4'b1111; #10;
        if (excess3 !== 4'b0010) $display("FAIL: Expected 0010 for input 1111, got %b", excess3);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule