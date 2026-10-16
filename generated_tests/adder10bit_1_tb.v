`timescale 1ns/1ps

module tb_adder10bit;
    reg [9:0] A, B;
    reg Cin;
    wire [9:0] S;
    wire Co;

    // Instantiate the module under test (uut)
    adder10bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Co(Co)
    );

    initial begin
        // Test case 1: Simple addition without carry
        A = 10'b0000000001; // 1
        B = 10'b0000000001; // 1
        Cin = 1'b0;         // No carry-in
        #10;
        if (S !== 10'b0000000010 || Co !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: Addition with carry
        A = 10'b0000000111; // 7
        B = 10'b0000000111; // 7
        Cin = 1'b0;         // No carry-in
        #10;
        if (S !== 10'b0000001110 || Co !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: Addition with carry-in
        A = 10'b0000000111; // 7
        B = 10'b0000000111; // 7
        Cin = 1'b1;         // Carry-in
        #10;
        if (S !== 10'b0000001111 || Co !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: Maximum value addition
        A = 10'b1111111111; // 1023
        B = 10'b0000000001; // 1
        Cin = 1'b0;         // No carry-in
        #10;
        if (S !== 10'b0000000000 || Co !== 1'b1) $display("FAIL: Test case 4 failed");

        // Test case 5: Addition resulting in carry-out
        A = 10'b1111111111; // 1023
        B = 10'b1111111111; // 1023
        Cin = 1'b1;         // Carry-in
        #10;
        if (S !== 10'b1111111111 || Co !== 1'b1) $display("FAIL: Test case 5 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule