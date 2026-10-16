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
        // Test case 1: A = 0, B = 0
        A = 2'b00; B = 2'b00; #10;
        if (C !== 2'b00) $display("FAIL: Test case 1 failed, expected C = 00, got C = %b", C);

        // Test case 2: A = 0, B = 1
        A = 2'b00; B = 2'b01; #10;
        if (C !== 2'b00) $display("FAIL: Test case 2 failed, expected C = 00, got C = %b", C);

        // Test case 3: A = 1, B = 0
        A = 2'b01; B = 2'b00; #10;
        if (C !== 2'b00) $display("FAIL: Test case 3 failed, expected C = 00, got C = %b", C);

        // Test case 4: A = 1, B = 1
        A = 2'b01; B = 2'b01; #10;
        if (C !== 2'b01) $display("FAIL: Test case 4 failed, expected C = 01, got C = %b", C);

        // Test case 5: A = 2, B = 0
        A = 2'b10; B = 2'b00; #10;
        if (C !== 2'b00) $display("FAIL: Test case 5 failed, expected C = 00, got C = %b", C);

        // Test case 6: A = 2, B = 1
        A = 2'b10; B = 2'b01; #10;
        if (C !== 2'b01) $display("FAIL: Test case 6 failed, expected C = 01, got C = %b", C);

        // Test case 7: A = 1, B = 2
        A = 2'b01; B = 2'b10; #10;
        if (C !== 2'b01) $display("FAIL: Test case 7 failed, expected C = 01, got C = %b", C);

        // Test case 8: A = 2, B = 2
        A = 2'b10; B = 2'b10; #10;
        if (C !== 2'b00) $display("FAIL: Test case 8 failed, expected C = 00, got C = %b", C);

        // Test case 9: A = 3, B = 1
        A = 2'b11; B = 2'b01; #10;
        if (C !== 2'b10) $display("FAIL: Test case 9 failed, expected C = 10, got C = %b", C);

        // Test case 10: A = 3, B = 3
        A = 2'b11; B = 2'b11; #10;
        if (C !== 2'b00) $display("FAIL: Test case 10 failed, expected C = 00, got C = %b", C);

        $display("PASS");
        $finish;
    end

endmodule