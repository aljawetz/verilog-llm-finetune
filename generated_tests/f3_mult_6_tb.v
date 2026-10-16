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
        // Test cases for GF(3) multiplication
        // 01 (1) * 01 (1) = 01 (1)
        A = 2'b01; B = 2'b01; #10;
        if (C !== 2'b01) $display("FAIL: Test case 1 failed (1 * 1)");

        // 01 (1) * 10 (2) = 10 (2)
        A = 2'b01; B = 2'b10; #10;
        if (C !== 2'b10) $display("FAIL: Test case 2 failed (1 * 2)");

        // 10 (2) * 01 (1) = 10 (2)
        A = 2'b10; B = 2'b01; #10;
        if (C !== 2'b10) $display("FAIL: Test case 3 failed (2 * 1)");

        // 10 (2) * 10 (2) = 01 (1)
        A = 2'b10; B = 2'b10; #10;
        if (C !== 2'b01) $display("FAIL: Test case 4 failed (2 * 2)");

        // 01 (1) * 01 (1) = 01 (1) again to confirm consistency
        A = 2'b01; B = 2'b01; #10;
        if (C !== 2'b01) $display("FAIL: Test case 5 failed (1 * 1)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule