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
        // Test case 1: Only the first bit is high
        in = 4'b0001; #10;
        if (pos !== 2'b00) $display("FAIL: Test case 1 failed, expected pos=00, got pos=%b", pos);

        // Test case 2: Second bit is high
        in = 4'b0010; #10;
        if (pos !== 2'b01) $display("FAIL: Test case 2 failed, expected pos=01, got pos=%b", pos);

        // Test case 3: Third bit is high
        in = 4'b0100; #10;
        if (pos !== 2'b10) $display("FAIL: Test case 3 failed, expected pos=10, got pos=%b", pos);

        // Test case 4: Fourth bit is high
        in = 4'b1000; #10;
        if (pos !== 2'b11) $display("FAIL: Test case 4 failed, expected pos=11, got pos=%b", pos);

        // Test case 5: No bits are high
        in = 4'b0000; #10;
        if (pos !== 2'b00) $display("FAIL: Test case 5 failed, expected pos=00, got pos=%b", pos);

        // Test case 6: Multiple bits high (should prioritize lower index)
        in = 4'b0110; #10;
        if (pos !== 2'b01) $display("FAIL: Test case 6 failed, expected pos=01, got pos=%b", pos);

        // Test case 7: Multiple bits high (should prioritize lower index)
        in = 4'b1100; #10;
        if (pos !== 2'b00) $display("FAIL: Test case 7 failed, expected pos=00, got pos=%b", pos);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule