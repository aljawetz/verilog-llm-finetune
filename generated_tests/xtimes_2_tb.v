`timescale 1ns/1ps

module tb_xtimes;

    reg [7:0] in;
    wire [7:0] out;

    // Instantiate the module under test (uut)
    xtimes uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: in = 8'b00000000
        in = 8'b00000000;
        #10;
        if (out !== 8'b00000000) $display("FAIL: Test case 1 failed, expected 00000000, got %b", out);

        // Test case 2: in = 8'b11111111
        in = 8'b11111111;
        #10;
        if (out !== 8'b11111111) $display("FAIL: Test case 2 failed, expected 11111111, got %b", out);

        // Test case 3: in = 8'b10101010
        in = 8'b10101010;
        #10;
        if (out !== 8'b10101010) $display("FAIL: Test case 3 failed, expected 10101010, got %b", out);

        // Test case 4: in = 8'b01010101
        in = 8'b01010101;
        #10;
        if (out !== 8'b01010101) $display("FAIL: Test case 4 failed, expected 01010101, got %b", out);

        // Test case 5: in = 8'b11001100
        in = 8'b11001100;
        #10;
        if (out !== 8'b11001100) $display("FAIL: Test case 5 failed, expected 11001100, got %b", out);

        // Test case 6: in = 8'b00110011
        in = 8'b00110011;
        #10;
        if (out !== 8'b00110011) $display("FAIL: Test case 6 failed, expected 00110011, got %b", out);

        // Test case 7: in = 8'b11110000
        in = 8'b11110000;
        #10;
        if (out !== 8'b11110000) $display("FAIL: Test case 7 failed, expected 11110000, got %b", out);

        // Test case 8: in = 8'b00001111
        in = 8'b00001111;
        #10;
        if (out !== 8'b00001111) $display("FAIL: Test case 8 failed, expected 00001111, got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule