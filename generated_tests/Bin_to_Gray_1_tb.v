`timescale 1ns/1ps

module tb_Bin_to_Gray;

    reg [3:0] binary;
    wire [3:0] gray;

    // Instantiate the module under test (uut)
    Bin_to_Gray uut (
        .binary(binary),
        .gray(gray)
    );

    initial begin
        // Test cases
        // Test case 0: binary = 0000
        binary = 4'b0000; #10;
        if (gray !== 4'b0000) $display("FAIL: Test case 0 failed, expected 0000, got %b", gray);

        // Test case 1: binary = 0001
        binary = 4'b0001; #10;
        if (gray !== 4'b0001) $display("FAIL: Test case 1 failed, expected 0001, got %b", gray);

        // Test case 2: binary = 0010
        binary = 4'b0010; #10;
        if (gray !== 4'b0011) $display("FAIL: Test case 2 failed, expected 0011, got %b", gray);

        // Test case 3: binary = 0011
        binary = 4'b0011; #10;
        if (gray !== 4'b0010) $display("FAIL: Test case 3 failed, expected 0010, got %b", gray);

        // Test case 4: binary = 0100
        binary = 4'b0100; #10;
        if (gray !== 4'b0110) $display("FAIL: Test case 4 failed, expected 0110, got %b", gray);

        // Test case 5: binary = 0101
        binary = 4'b0101; #10;
        if (gray !== 4'b0111) $display("FAIL: Test case 5 failed, expected 0111, got %b", gray);

        // Test case 6: binary = 0110
        binary = 4'b0110; #10;
        if (gray !== 4'b0101) $display("FAIL: Test case 6 failed, expected 0101, got %b", gray);

        // Test case 7: binary = 0111
        binary = 4'b0111; #10;
        if (gray !== 4'b0100) $display("FAIL: Test case 7 failed, expected 0100, got %b", gray);

        // Test case 8: binary = 1000
        binary = 4'b1000; #10;
        if (gray !== 4'b1100) $display("FAIL: Test case 8 failed, expected 1100, got %b", gray);

        // Test case 9: binary = 1001
        binary = 4'b1001; #10;
        if (gray !== 4'b1101) $display("FAIL: Test case 9 failed, expected 1101, got %b", gray);

        // Test case 10: binary = 1010
        binary = 4'b1010; #10;
        if (gray !== 4'b1111) $display("FAIL: Test case 10 failed, expected 1111, got %b", gray);

        // Test case 11: binary = 1011
        binary = 4'b1011; #10;
        if (gray !== 4'b1110) $display("FAIL: Test case 11 failed, expected 1110, got %b", gray);

        // Test case 12: binary = 1100
        binary = 4'b1100; #10;
        if (gray !== 4'b1010) $display("FAIL: Test case 12 failed, expected 1010, got %b", gray);

        // Test case 13: binary = 1101
        binary = 4'b1101; #10;
        if (gray !== 4'b1011) $display("FAIL: Test case 13 failed, expected 1011, got %b", gray);

        // Test case 14: binary = 1110
        binary = 4'b1110; #10;
        if (gray !== 4'b1001) $display("FAIL: Test case 14 failed, expected 1001, got %b", gray);

        // Test case 15: binary = 1111
        binary = 4'b1111; #10;
        if (gray !== 4'b1000) $display("FAIL: Test case 15 failed, expected 1000, got %b", gray);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule