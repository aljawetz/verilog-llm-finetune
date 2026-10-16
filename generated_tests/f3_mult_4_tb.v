`timescale 1ns/1ps

module tb_f3_mult;

    reg [1:0] A;
    reg [1:0] B;
    wire [1:0] C;

    // Instantiate the module under test (uut)
    f3_mult uut (
        .A(A),
        .B(B),
        .C(C)
    );

    initial begin
        // Test cases
        // Test 1: 1 * 1 = 1
        A = 2'b01; B = 2'b01; #10;
        if (C !== 2'b01) $display("FAIL: Test 1 failed, expected 01, got %b", C);

        // Test 2: 1 * 2 = 2
        A = 2'b01; B = 2'b10; #10;
        if (C !== 2'b10) $display("FAIL: Test 2 failed, expected 10, got %b", C);

        // Test 3: 2 * 1 = 2
        A = 2'b10; B = 2'b01; #10;
        if (C !== 2'b10) $display("FAIL: Test 3 failed, expected 10, got %b", C);

        // Test 4: 2 * 2 = 1
        A = 2'b10; B = 2'b10; #10;
        if (C !== 2'b01) $display("FAIL: Test 4 failed, expected 01, got %b", C);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule