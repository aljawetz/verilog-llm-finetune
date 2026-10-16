`timescale 1ns/1ps

module tb_extender_block;

    // Input signals
    reg [7:0] data_in;
    reg imm_len;
    reg imm_sign;

    // Output signals
    wire [15:0] extended_data;

    // Instantiate the module under test (uut)
    extender_block uut (
        .data_in(data_in),
        .extended_data(extended_data),
        .imm_len(imm_len),
        .imm_sign(imm_sign)
    );

    initial begin
        // Test case 1: Zero extend 8 bits
        imm_len = 0; imm_sign = 0; data_in = 8'b00000001; // Expect 0000_0000_0000_0001
        #10;
        if (extended_data !== 16'b0000000000000001) $display("FAIL: Test case 1 failed");

        // Test case 2: Sign extend 8 bits
        imm_len = 0; imm_sign = 1; data_in = 8'b11111111; // Expect 1111_1111_1111_1111
        #10;
        if (extended_data !== 16'b1111111111111111) $display("FAIL: Test case 2 failed");

        // Test case 3: Zero extend 5 bits
        imm_len = 1; imm_sign = 0; data_in = 8'b00000101; // Expect 0000_0000_0000_0101
        #10;
        if (extended_data !== 16'b0000000000000101) $display("FAIL: Test case 3 failed");

        // Test case 4: Sign extend 5 bits
        imm_len = 1; imm_sign = 1; data_in = 8'b10000101; // Expect 1111_1111_1110_0101
        #10;
        if (extended_data !== 16'b1111111111100101) $display("FAIL: Test case 4 failed");

        // Test case 5: Zero extend 5 bits with zero input
        imm_len = 1; imm_sign = 0; data_in = 8'b00000000; // Expect 0000_0000_0000_0000
        #10;
        if (extended_data !== 16'b0000000000000000) $display("FAIL: Test case 5 failed");

        // Test case 6: Sign extend 5 bits with negative input
        imm_len = 1; imm_sign = 1; data_in = 8'b11111000; // Expect 1111_1111_1111_1000
        #10;
        if (extended_data !== 16'b1111111111111000) $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule