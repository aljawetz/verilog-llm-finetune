`timescale 1ns/1ps

module tb_timeToDisplay;

    reg [3:0] x;
    wire [6:0] r;

    // Instantiate the module under test
    timeToDisplay uut (
        .x(x),
        .r(r)
    );

    initial begin
        // Test cases
        x = 4'b0000; #10; // Expect r = 7'b0000001
        if (r !== 7'b0000001) $display("FAIL: Test case x=0 failed");

        x = 4'b0001; #10; // Expect r = 7'b1001111
        if (r !== 7'b1001111) $display("FAIL: Test case x=1 failed");

        x = 4'b0010; #10; // Expect r = 7'b0010010
        if (r !== 7'b0010010) $display("FAIL: Test case x=2 failed");

        x = 4'b0011; #10; // Expect r = 7'b0000110
        if (r !== 7'b0000110) $display("FAIL: Test case x=3 failed");

        x = 4'b0100; #10; // Expect r = 7'b1001100
        if (r !== 7'b1001100) $display("FAIL: Test case x=4 failed");

        x = 4'b0101; #10; // Expect r = 7'b0100100
        if (r !== 7'b0100100) $display("FAIL: Test case x=5 failed");

        x = 4'b0110; #10; // Expect r = 7'b0100000
        if (r !== 7'b0100000) $display("FAIL: Test case x=6 failed");

        x = 4'b0111; #10; // Expect r = 7'b0001111
        if (r !== 7'b0001111) $display("FAIL: Test case x=7 failed");

        x = 4'b1000; #10; // Expect r = 7'b0000000
        if (r !== 7'b0000000) $display("FAIL: Test case x=8 failed");

        x = 4'b1001; #10; // Expect r = 7'b0000100
        if (r !== 7'b0000100) $display("FAIL: Test case x=9 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule