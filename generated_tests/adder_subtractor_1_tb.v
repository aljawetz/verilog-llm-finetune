`timescale 1ns/1ps

module tb_adder_subtractor;

    reg [3:0] A;
    reg [3:0] B;
    reg MODE;
    wire [3:0] RESULT;
    wire CARRY;
    wire OVERFLOW;

    // Instantiate the module under test (uut)
    adder_subtractor uut (
        .A(A),
        .B(B),
        .MODE(MODE),
        .RESULT(RESULT),
        .CARRY(CARRY),
        .OVERFLOW(OVERFLOW)
    );

    initial begin
        // Test case 1: Addition without overflow
        A = 4'b0011; // 3
        B = 4'b0001; // 1
        MODE = 0;    // Add
        #10;
        if (RESULT !== 4'b0100 || CARRY !== 0 || OVERFLOW !== 0) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: Addition with overflow
        A = 4'b0111; // 7
        B = 4'b0001; // 1
        MODE = 0;    // Add
        #10;
        if (RESULT !== 4'b1000 || CARRY !== 1 || OVERFLOW !== 1) 
            $display("FAIL: Test case 2 failed");
        
        // Test case 3: Subtraction without borrow
        A = 4'b0100; // 4
        B = 4'b0010; // 2
        MODE = 1;    // Subtract
        #10;
        if (RESULT !== 4'b0010 || CARRY !== 1 || OVERFLOW !== 0) 
            $display("FAIL: Test case 3 failed");
        
        // Test case 4: Subtraction with borrow
        A = 4'b0010; // 2
        B = 4'b0100; // 4
        MODE = 1;    // Subtract
        #10;
        if (RESULT !== 4'b1110 || CARRY !== 0 || OVERFLOW !== 0) 
            $display("FAIL: Test case 4 failed");
        
        // Test case 5: Subtraction resulting in overflow
        A = 4'b1000; // -8 in two's complement
        B = 4'b0111; // 7
        MODE = 1;    // Subtract
        #10;
        if (RESULT !== 4'b0001 || CARRY !== 1 || OVERFLOW !== 1) 
            $display("FAIL: Test case 5 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule