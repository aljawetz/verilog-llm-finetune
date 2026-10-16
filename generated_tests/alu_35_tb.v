`timescale 1ns/1ps

module tb_alu;

    reg a;
    reg b;
    reg [1:0] operation;
    wire Result;

    // Instantiate the ALU module
    alu uut (
        .a(a),
        .b(b),
        .operation(operation),
        .Result(Result)
    );

    initial begin
        // Test case 1: AND operation
        a = 1; b = 1; operation = 2'b00; #10;
        if (Result !== 1) $display("FAIL: Test case 1 failed (AND)");
        
        // Test case 2: OR operation
        a = 1; b = 0; operation = 2'b01; #10;
        if (Result !== 1) $display("FAIL: Test case 2 failed (OR)");
        
        // Test case 3: Addition operation
        a = 2; b = 3; operation = 2'b10; #10;
        if (Result !== 5) $display("FAIL: Test case 3 failed (Addition)");
        
        // Test case 4: Subtraction operation
        a = 5; b = 3; operation = 2'b11; #10;
        if (Result !== 2) $display("FAIL: Test case 4 failed (Subtraction)");

        // Test case 5: Edge case for subtraction (negative result)
        a = 3; b = 5; operation = 2'b11; #10;
        if (Result !== 0) $display("FAIL: Test case 5 failed (Negative Subtraction)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule