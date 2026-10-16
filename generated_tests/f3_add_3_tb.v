`timescale 1ns/1ps

module tb_f3_add;

    reg [1:0] A, B;
    wire [1:0] C;

    // Instantiate the module under test (uut)
    f3_add uut (
        .A(A),
        .B(B),
        .C(C)
    );

    initial begin
        // Test cases for addition modulo 3
        // Test case 1: 0 + 0 = 0
        A = 2'b00; B = 2'b00; #10;
        if (C !== 2'b00) $display("FAIL: Test case 1 failed (0 + 0)");

        // Test case 2: 0 + 1 = 1
        A = 2'b00; B = 2'b01; #10;
        if (C !== 2'b01) $display("FAIL: Test case 2 failed (0 + 1)");

        // Test case 3: 0 + 2 = 2
        A = 2'b00; B = 2'b10; #10;
        if (C !== 2'b10) $display("FAIL: Test case 3 failed (0 + 2)");

        // Test case 4: 1 + 1 = 2
        A = 2'b01; B = 2'b01; #10;
        if (C !== 2'b10) $display("FAIL: Test case 4 failed (1 + 1)");

        // Test case 5: 1 + 2 = 0 (mod 3)
        A = 2'b01; B = 2'b10; #10;
        if (C !== 2'b00) $display("FAIL: Test case 5 failed (1 + 2)");

        // Test case 6: 2 + 2 = 1 (mod 3)
        A = 2'b10; B = 2'b10; #10;
        if (C !== 2'b01) $display("FAIL: Test case 6 failed (2 + 2)");

        // Test case 7: 1 + 0 = 1
        A = 2'b01; B = 2'b00; #10;
        if (C !== 2'b01) $display("FAIL: Test case 7 failed (1 + 0)");

        // Test case 8: 2 + 1 = 0 (mod 3)
        A = 2'b10; B = 2'b01; #10;
        if (C !== 2'b00) $display("FAIL: Test case 8 failed (2 + 1)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule