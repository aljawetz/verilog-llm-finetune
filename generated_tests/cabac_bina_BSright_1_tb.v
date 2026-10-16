`timescale 1ns/1ps

module tb_cabac_bina_BSright;

    reg [17:0] in;
    reg [4:0] right;
    wire [17:0] out;

    // Instantiate the module under test (uut)
    cabac_bina_BSright uut (
        .in(in),
        .right(right),
        .out(out)
    );

    initial begin
        // Test case 1: Shift by 1
        in = 18'b000000000000000001; // 1
        right = 5'b00001; // Shift by 1
        #10;
        if (out !== 18'b000000000000000000) $display("FAIL: Test case 1 failed, expected 000000000000000000, got %b", out);

        // Test case 2: Shift by 2
        in = 18'b000000000000000011; // 3
        right = 5'b00010; // Shift by 2
        #10;
        if (out !== 18'b000000000000000000) $display("FAIL: Test case 2 failed, expected 000000000000000000, got %b", out);

        // Test case 3: Shift by 4
        in = 18'b000000000000111100; // 60
        right = 5'b00100; // Shift by 4
        #10;
        if (out !== 18'b000000000000000011) $display("FAIL: Test case 3 failed, expected 000000000000000011, got %b", out);

        // Test case 4: Shift by 8
        in = 18'b111111111111111111; // 262143
        right = 5'b01000; // Shift by 8
        #10;
        if (out !== 18'b000000001111111111) $display("FAIL: Test case 4 failed, expected 000000001111111111, got %b", out);

        // Test case 5: Shift by 16
        in = 18'b000000000000000011; // 3
        right = 5'b10000; // Shift by 16
        #10;
        if (out !== 18'b000000000000000000) $display("FAIL: Test case 5 failed, expected 000000000000000000, got %b", out);

        // Test case 6: No shift
        in = 18'b101010101010101010; // 0xAAAA
        right = 5'b00000; // No shift
        #10;
        if (out !== 18'b101010101010101010) $display("FAIL: Test case 6 failed, expected 101010101010101010, got %b", out);

        // Test case 7: Multiple shifts
        in = 18'b000000000000000111; // 7
        right = 5'b11111; // Shift by 1, 2, 4, 8, and 16
        #10;
        if (out !== 18'b000000000000000000) $display("FAIL: Test case 7 failed, expected 000000000000000000, got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule