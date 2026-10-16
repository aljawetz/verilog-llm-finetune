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
        // Test cases for f3_add
        // Test case 1: 0 + 0 = 0
        A = 2'b00; B = 2'b00; #10;
        if (C !== 2'b00) $display("FAIL: Test case 1 failed, expected 00, got %b", C);

        // Test case 2: 0 + 1 = 1
        A = 2'b00; B = 2'b01; #10;
        if (C !== 2'b01) $display("FAIL: Test case 2 failed, expected 01, got %b", C);

        // Test case 3: 0 + 2 = 2
        A = 2'b00; B = 2'b10; #10;
        if (C !== 2'b10) $display("FAIL: Test case 3 failed, expected 10, got %b", C);

        // Test case 4: 1 + 1 = 2
        A = 2'b01; B = 2'b01; #10;
        if (C !== 2'b10) $display("FAIL: Test case 4 failed, expected 10, got %b", C);

        // Test case 5: 1 + 2 = 0 (mod 3)
        A = 2'b01; B = 2'b10; #10;
        if (C !== 2'b00) $display("FAIL: Test case 5 failed, expected 00, got %b", C);

        // Test case 6: 2 + 2 = 1 (mod 3)
        A = 2'b10; B = 2'b10; #10;
        if (C !== 2'b01) $display("FAIL: Test case 6 failed, expected 01, got %b", C);

        // Test case 7: 1 + 0 = 1
        A = 2'b01; B = 2'b00; #10;
        if (C !== 2'b01) $display("FAIL: Test case 7 failed, expected 01, got %b", C);

        // Test case 8: 2 + 0 = 2
        A = 2'b10; B = 2'b00; #10;
        if (C !== 2'b10) $display("FAIL: Test case 8 failed, expected 10, got %b", C);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule