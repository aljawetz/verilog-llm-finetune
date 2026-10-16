`timescale 1ns/1ps

module tb_f3_add1;

    reg [1:0] a;
    wire [1:0] c;

    // Instantiate the module under test (uut)
    f3_add1 uut (
        .a(a),
        .c(c)
    );

    initial begin
        // Test case 1: a = 00
        a = 2'b00; #10;
        if (c !== 2'b00) $display("FAIL: Test case 1 failed for a = 00, got c = %b", c);

        // Test case 2: a = 01
        a = 2'b01; #10;
        if (c !== 2'b01) $display("FAIL: Test case 2 failed for a = 01, got c = %b", c);

        // Test case 3: a = 10
        a = 2'b10; #10;
        if (c !== 2'b00) $display("FAIL: Test case 3 failed for a = 10, got c = %b", c);

        // Test case 4: a = 11
        a = 2'b11; #10;
        if (c !== 2'b10) $display("FAIL: Test case 4 failed for a = 11, got c = %b", c);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule