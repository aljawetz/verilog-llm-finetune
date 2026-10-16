`timescale 1ns/1ps

module tb_f3_mult;

    reg [1:0] A;
    reg [1:0] B;
    wire [1:0] C;

    // Instantiate the module under test
    f3_mult uut (
        .A(A),
        .B(B),
        .C(C)
    );

    initial begin
        // Test case 1: A = 00, B = 00
        A = 2'b00; B = 2'b00; #10;
        if (C !== 2'b00) $display("FAIL: Test case 1 failed (A=00, B=00)"); 

        // Test case 2: A = 01, B = 00
        A = 2'b01; B = 2'b00; #10;
        if (C !== 2'b00) $display("FAIL: Test case 2 failed (A=01, B=00)"); 

        // Test case 3: A = 10, B = 00
        A = 2'b10; B = 2'b00; #10;
        if (C !== 2'b00) $display("FAIL: Test case 3 failed (A=10, B=00)"); 

        // Test case 4: A = 11, B = 00
        A = 2'b11; B = 2'b00; #10;
        if (C !== 2'b00) $display("FAIL: Test case 4 failed (A=11, B=00)"); 

        // Test case 5: A = 00, B = 01
        A = 2'b00; B = 2'b01; #10;
        if (C !== 2'b00) $display("FAIL: Test case 5 failed (A=00, B=01)"); 

        // Test case 6: A = 01, B = 01
        A = 2'b01; B = 2'b01; #10;
        if (C !== 2'b00) $display("FAIL: Test case 6 failed (A=01, B=01)"); 

        // Test case 7: A = 10, B = 01
        A = 2'b10; B = 2'b01; #10;
        if (C !== 2'b01) $display("FAIL: Test case 7 failed (A=10, B=01)"); 

        // Test case 8: A = 11, B = 01
        A = 2'b11; B = 2'b01; #10;
        if (C !== 2'b00) $display("FAIL: Test case 8 failed (A=11, B=01)"); 

        // Test case 9: A = 00, B = 10
        A = 2'b00; B = 2'b10; #10;
        if (C !== 2'b00) $display("FAIL: Test case 9 failed (A=00, B=10)"); 

        // Test case 10: A = 01, B = 10
        A = 2'b01; B = 2'b10; #10;
        if (C !== 2'b01) $display("FAIL: Test case 10 failed (A=01, B=10)"); 

        // Test case 11: A = 10, B = 10
        A = 2'b10; B = 2'b10; #10;
        if (C !== 2'b00) $display("FAIL: Test case 11 failed (A=10, B=10)"); 

        // Test case 12: A = 11, B = 10
        A = 2'b11; B = 2'b10; #10;
        if (C !== 2'b01) $display("FAIL: Test case 12 failed (A=11, B=10)"); 

        // Test case 13: A = 00, B = 11
        A = 2'b00; B = 2'b11; #10;
        if (C !== 2'b00) $display("FAIL: Test case 13 failed (A=00, B=11)"); 

        // Test case 14: A = 01, B = 11
        A = 2'b01; B = 2'b11; #10;
        if (C !== 2'b00) $display("FAIL: Test case 14 failed (A=01, B=11)"); 

        // Test case 15: A = 10, B = 11
        A = 2'b10; B = 2'b11; #10;
        if (C !== 2'b00) $display("FAIL: Test case 15 failed (A=10, B=11)"); 

        // Test case 16: A = 11, B = 11
        A = 2'b11; B = 2'b11; #10;
        if (C !== 2'b00) $display("FAIL: Test case 16 failed (A=11, B=11)"); 

        $display("PASS");
        $finish;
    end

endmodule