`timescale 1ns/1ps

module tb_binary_to_gray_assign;

    reg [3:0] binary;
    wire [3:0] gray;

    // Instantiate the module under test (uut)
    binary_to_gray_assign uut (
        .binary(binary),
        .gray(gray)
    );

    initial begin
        // Test sequence
        binary = 4'b0000; #10;
        if (gray !== 4'b0000) $display("FAIL: Test case binary=0000 failed, got gray=%b", gray);

        binary = 4'b0001; #10;
        if (gray !== 4'b0001) $display("FAIL: Test case binary=0001 failed, got gray=%b", gray);

        binary = 4'b0010; #10;
        if (gray !== 4'b0011) $display("FAIL: Test case binary=0010 failed, got gray=%b", gray);

        binary = 4'b0011; #10;
        if (gray !== 4'b0010) $display("FAIL: Test case binary=0011 failed, got gray=%b", gray);

        binary = 4'b0100; #10;
        if (gray !== 4'b0110) $display("FAIL: Test case binary=0100 failed, got gray=%b", gray);

        binary = 4'b0101; #10;
        if (gray !== 4'b0111) $display("FAIL: Test case binary=0101 failed, got gray=%b", gray);

        binary = 4'b0110; #10;
        if (gray !== 4'b0101) $display("FAIL: Test case binary=0110 failed, got gray=%b", gray);

        binary = 4'b0111; #10;
        if (gray !== 4'b0100) $display("FAIL: Test case binary=0111 failed, got gray=%b", gray);

        binary = 4'b1000; #10;
        if (gray !== 4'b1100) $display("FAIL: Test case binary=1000 failed, got gray=%b", gray);

        binary = 4'b1001; #10;
        if (gray !== 4'b1101) $display("FAIL: Test case binary=1001 failed, got gray=%b", gray);

        binary = 4'b1010; #10;
        if (gray !== 4'b1111) $display("FAIL: Test case binary=1010 failed, got gray=%b", gray);

        binary = 4'b1011; #10;
        if (gray !== 4'b1110) $display("FAIL: Test case binary=1011 failed, got gray=%b", gray);

        binary = 4'b1100; #10;
        if (gray !== 4'b1010) $display("FAIL: Test case binary=1100 failed, got gray=%b", gray);

        binary = 4'b1101; #10;
        if (gray !== 4'b1011) $display("FAIL: Test case binary=1101 failed, got gray=%b", gray);

        binary = 4'b1110; #10;
        if (gray !== 4'b1001) $display("FAIL: Test case binary=1110 failed, got gray=%b", gray);

        binary = 4'b1111; #10;
        if (gray !== 4'b1000) $display("FAIL: Test case binary=1111 failed, got gray=%b", gray);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule