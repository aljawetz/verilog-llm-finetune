`timescale 1ns/1ps

module tb_ss_decoder;

    reg [14:0] in_data;
    wire [6:0] out_data;

    // Instantiate the module under test
    ss_decoder uut (
        .in_data(in_data),
        .out_data(out_data)
    );

    initial begin
        // Test cases
        // Test case 1: One-hot input for '0'
        in_data = 15'b000_0000_0000_0001; // Expect out_data = 7'b1000000
        #10;
        if (out_data !== 7'b1000000) $display("FAIL: Test case 1 failed");

        // Test case 2: One-hot input for '1'
        in_data = 15'b000_0000_0000_0010; // Expect out_data = 7'b1111001
        #10;
        if (out_data !== 7'b1111001) $display("FAIL: Test case 2 failed");

        // Test case 3: One-hot input for '2'
        in_data = 15'b000_0000_0000_0100; // Expect out_data = 7'b0100100
        #10;
        if (out_data !== 7'b0100100) $display("FAIL: Test case 3 failed");

        // Test case 4: One-hot input for '3'
        in_data = 15'b000_0000_0000_1000; // Expect out_data = 7'b0110000
        #10;
        if (out_data !== 7'b0110000) $display("FAIL: Test case 4 failed");

        // Test case 5: One-hot input for '4'
        in_data = 15'b000_0000_0001_0000; // Expect out_data = 7'b0011001
        #10;
        if (out_data !== 7'b0011001) $display("FAIL: Test case 5 failed");

        // Test case 6: One-hot input for '5'
        in_data = 15'b000_0000_0010_0000; // Expect out_data = 7'b0010010
        #10;
        if (out_data !== 7'b0010010) $display("FAIL: Test case 6 failed");

        // Test case 7: One-hot input for '6'
        in_data = 15'b000_0000_0100_0000; // Expect out_data = 7'b0000010
        #10;
        if (out_data !== 7'b0000010) $display("FAIL: Test case 7 failed");

        // Test case 8: One-hot input for '7'
        in_data = 15'b000_0000_1000_0000; // Expect out_data = 7'b1111000
        #10;
        if (out_data !== 7'b1111000) $display("FAIL: Test case 8 failed");

        // Test case 9: One-hot input for '8'
        in_data = 15'b000_0001_0000_0000; // Expect out_data = 7'b0000000
        #10;
        if (out_data !== 7'b0000000) $display("FAIL: Test case 9 failed");

        // Test case 10: One-hot input for '9'
        in_data = 15'b000_0010_0000_0000; // Expect out_data = 7'b0010000
        #10;
        if (out_data !== 7'b0010000) $display("FAIL: Test case 10 failed");

        // Test case 11: One-hot input for 'A'
        in_data = 15'b000_0100_0000_0000; // Expect out_data = 7'b0001000
        #10;
        if (out_data !== 7'b0001000) $display("FAIL: Test case 11 failed");

        // Test case 12: One-hot input for 'B'
        in_data = 15'b000_1000_0000_0000; // Expect out_data = 7'b0000011
        #10;
        if (out_data !== 7'b0000011) $display("FAIL: Test case 12 failed");

        // Test case 13: One-hot input for 'C'
        in_data = 15'b001_0000_0000_0000; // Expect out_data = 7'b1000110
        #10;
        if (out_data !== 7'b1000110) $display("FAIL: Test case 13 failed");

        // Test case 14: One-hot input for 'D'
        in_data = 15'b010_0000_0000_0000; // Expect out_data = 7'b0100001
        #10;
        if (out_data !== 7'b0100001) $display("FAIL: Test case 14 failed");

        // Test case 15: One-hot input for 'E'
        in_data = 15'b100_0000_0000_0000; // Expect out_data = 7'b0000110
        #10;
        if (out_data !== 7'b0000110) $display("FAIL: Test case 15 failed");

        // Test case 16: Invalid input
        in_data = 15'b000_0000_0000_0000; // Expect out_data = 7'b1111111 (default case)
        #10;
        if (out_data !== 7'b1111111) $display("FAIL: Test case 16 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule