`timescale 1ns/1ps

module tb_adder_4bit;

    reg [3:0] x;
    reg [3:0] y;
    wire [3:0] z;

    // Instantiate the module under test (uut)
    adder_4bit uut (
        .x(x),
        .y(y),
        .z(z)
    );

    initial begin
        // Test case 1: 0 + 0 = 0
        x = 4'b0000; y = 4'b0000;
        #10;
        if (z !== 4'b0000) $display("FAIL: Test case 1 failed (0 + 0)");

        // Test case 2: 1 + 1 = 2
        x = 4'b0001; y = 4'b0001;
        #10;
        if (z !== 4'b0010) $display("FAIL: Test case 2 failed (1 + 1)");

        // Test case 3: 2 + 3 = 5
        x = 4'b0010; y = 4'b0011;
        #10;
        if (z !== 4'b0101) $display("FAIL: Test case 3 failed (2 + 3)");

        // Test case 4: 7 + 1 = 8
        x = 4'b0111; y = 4'b0001;
        #10;
        if (z !== 4'b1000) $display("FAIL: Test case 4 failed (7 + 1)");

        // Test case 5: 15 + 1 = 0 (overflow)
        x = 4'b1111; y = 4'b0001;
        #10;
        if (z !== 4'b0000) $display("FAIL: Test case 5 failed (15 + 1)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule