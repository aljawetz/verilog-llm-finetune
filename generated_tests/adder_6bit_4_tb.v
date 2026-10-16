`timescale 1ns/1ps

module tb_adder_6bit;

    reg [5:0] x;
    reg [5:0] y;
    wire [5:0] z;

    // Instantiate the module under test (uut)
    adder_6bit uut (
        .x(x),
        .y(y),
        .z(z)
    );

    initial begin
        // Test case 1: 0 + 0 = 0
        x = 6'b000000; y = 6'b000000; #10;
        if (z !== 6'b000000) $display("FAIL: Test case 1 failed, expected 0, got %b", z);

        // Test case 2: 1 + 1 = 2
        x = 6'b000001; y = 6'b000001; #10;
        if (z !== 6'b000010) $display("FAIL: Test case 2 failed, expected 2, got %b", z);

        // Test case 3: 15 + 15 = 30
        x = 6'b001111; y = 6'b001111; #10;
        if (z !== 6'b011110) $display("FAIL: Test case 3 failed, expected 30, got %b", z);

        // Test case 4: 32 + 32 = 64 (overflow case)
        x = 6'b100000; y = 6'b100000; #10;
        if (z !== 6'b000000) $display("FAIL: Test case 4 failed, expected 0 (overflow), got %b", z);

        // Test case 5: 20 + 10 = 30
        x = 6'b010100; y = 6'b001010; #10;
        if (z !== 6'b011110) $display("FAIL: Test case 5 failed, expected 30, got %b", z);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule