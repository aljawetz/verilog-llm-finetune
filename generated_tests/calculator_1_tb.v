`timescale 1ns/1ps

module tb_calculator;

    reg [3:0] A;
    reg [3:0] B;
    reg [1:0] op;
    wire [7:0] result;
    wire divide_by_zero;

    // Instantiate the calculator module
    calculator uut (
        .A(A),
        .B(B),
        .op(op),
        .result(result),
        .divide_by_zero(divide_by_zero)
    );

    initial begin
        // Test case 1: Addition
        A = 4'b0011; // 3
        B = 4'b0001; // 1
        op = 2'b00;  // Add
        #10;
        if (result !== 8'b00000000_0000) $display("FAIL: Addition test failed");
        
        // Test case 2: Subtraction
        A = 4'b0100; // 4
        B = 4'b0010; // 2
        op = 2'b01;  // Subtract
        #10;
        if (result !== 8'b00000000_0010) $display("FAIL: Subtraction test failed");

        // Test case 3: Multiplication
        A = 4'b0010; // 2
        B = 4'b0011; // 3
        op = 2'b10;  // Multiply
        #10;
        if (result !== 8'b00000000_0110) $display("FAIL: Multiplication test failed");

        // Test case 4: Division
        A = 4'b1000; // 8
        B = 4'b0010; // 2
        op = 2'b11;  // Divide
        #10;
        if (result !== 8'b00000000_0100) $display("FAIL: Division test failed");

        // Test case 5: Division by zero
        A = 4'b1000; // 8
        B = 4'b0000; // 0
        op = 2'b11;  // Divide
        #10;
        if (result !== 8'b00000000_0000 || divide_by_zero !== 1) $display("FAIL: Division by zero test failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule