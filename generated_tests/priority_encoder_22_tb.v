`timescale 1ns/1ps

module tb_priority_encoder;

    reg [3:0] in;
    wire [1:0] pos;

    // Instantiate the module under test (uut)
    priority_encoder uut (
        .in(in),
        .pos(pos)
    );

    initial begin
        // Test case 1: Input is 4'b0001
        in = 4'b0001; #10;
        if (pos !== 2'b00) $display("FAIL: Test case 1 failed, expected 00, got %b", pos);

        // Test case 2: Input is 4'b0010
        in = 4'b0010; #10;
        if (pos !== 2'b01) $display("FAIL: Test case 2 failed, expected 01, got %b", pos);

        // Test case 3: Input is 4'b0100
        in = 4'b0100; #10;
        if (pos !== 2'b10) $display("FAIL: Test case 3 failed, expected 10, got %b", pos);

        // Test case 4: Input is 4'b1000
        in = 4'b1000; #10;
        if (pos !== 2'b11) $display("FAIL: Test case 4 failed, expected 11, got %b", pos);

        // Test case 5: Input is 4'b0000
        in = 4'b0000; #10;
        if (pos !== 2'b00) $display("FAIL: Test case 5 failed, expected 00, got %b", pos);

        // Test case 6: Input is 4'b1100 (highest priority should be 3)
        in = 4'b1100; #10;
        if (pos !== 2'b11) $display("FAIL: Test case 6 failed, expected 11, got %b", pos);

        // Test case 7: Input is 4'b1010 (highest priority should be 2)
        in = 4'b1010; #10;
        if (pos !== 2'b10) $display("FAIL: Test case 7 failed, expected 10, got %b", pos);

        // Test case 8: Input is 4'b0110 (highest priority should be 1)
        in = 4'b0110; #10;
        if (pos !== 2'b01) $display("FAIL: Test case 8 failed, expected 01, got %b", pos);

        // Test case 9: Input is 4'b1111 (highest priority should be 3)
        in = 4'b1111; #10;
        if (pos !== 2'b11) $display("FAIL: Test case 9 failed, expected 11, got %b", pos);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule