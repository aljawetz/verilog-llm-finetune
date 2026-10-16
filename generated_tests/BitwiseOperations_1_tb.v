`timescale 1ns/1ps

module tb_BitwiseOperations;

    reg [3:0] A;
    reg [3:0] B;
    reg [1:0] Op;
    wire [3:0] Y;

    // Instantiate the module under test (uut)
    BitwiseOperations uut (
        .A(A),
        .B(B),
        .Op(Op),
        .Y(Y)
    );

    initial begin
        // Test case 1: AND operation
        A = 4'b1100; B = 4'b1010; Op = 2'b00; #10;
        if (Y !== 4'b1000) $display("FAIL: Test case 1 failed (AND operation)");

        // Test case 2: OR operation
        A = 4'b1100; B = 4'b1010; Op = 2'b01; #10;
        if (Y !== 4'b1110) $display("FAIL: Test case 2 failed (OR operation)");

        // Test case 3: NOT operation on A
        A = 4'b1100; B = 4'b1010; Op = 2'b10; #10;
        if (Y !== 4'b0011) $display("FAIL: Test case 3 failed (NOT A)");

        // Test case 4: NOT operation on B
        A = 4'b1100; B = 4'b1010; Op = 2'b11; #10;
        if (Y !== 4'b0101) $display("FAIL: Test case 4 failed (NOT B)");

        // Test case 5: Default case
        A = 4'b0000; B = 4'b0000; Op = 2'bxx; #10; // Invalid Op
        if (Y !== 4'b0000) $display("FAIL: Test case 5 failed (default case)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule