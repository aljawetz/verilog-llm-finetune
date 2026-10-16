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
        x = 4'b0000; y = 4'b0000; #10;
        if (z !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0, got %b", z);

        // Test case 2: 1 + 1 = 2
        x = 4'b0001; y = 4'b0001; #10;
        if (z !== 4'b0010) $display("FAIL: Test case 2 failed, expected 2, got %b", z);

        // Test case 3: 3 + 2 = 5
        x = 4'b0011; y = 4'b0010; #10;
        if (z !== 4'b0101) $display("FAIL: Test case 3 failed, expected 5, got %b", z);

        // Test case 4: 7 + 1 = 8
        x = 4'b0111; y = 4'b0001; #10;
        if (z !== 4'b1000) $display("FAIL: Test case 4 failed, expected 8, got %b", z);

        // Test case 5: 15 + 1 = 0 (overflow)
        x = 4'b1111; y = 4'b0001; #10;
        if (z !== 4'b0000) $display("FAIL: Test case 5 failed, expected 0, got %b", z);

        // Test case 6: 10 + 5 = 15
        x = 4'b1010; y = 4'b0101; #10;
        if (z !== 4'b1111) $display("FAIL: Test case 6 failed, expected 15, got %b", z);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule