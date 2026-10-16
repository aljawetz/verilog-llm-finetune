`timescale 1ns/1ps

module tb_Hexadecimal_to_Binary_Encoder;

    reg [15:0] in;
    wire A, B, C, D;

    // Instantiate the module under test (uut)
    Hexadecimal_to_Binary_Encoder uut (
        .in(in),
        .A(A),
        .B(B),
        .C(C),
        .D(D)
    );

    initial begin
        // Test case 1: Input is 0000 0000 0000 0001 (binary 1)
        in = 16'b0000_0000_0000_0001;
        #10;
        if ({D, C, B, A} !== 4'b0000) $display("FAIL: Test case 1 failed");
        
        // Test case 2: Input is 0000 0000 0000 0010 (binary 2)
        in = 16'b0000_0000_0000_0010;
        #10;
        if ({D, C, B, A} !== 4'b0001) $display("FAIL: Test case 2 failed");
        
        // Test case 3: Input is 0000 0000 0000 0100 (binary 4)
        in = 16'b0000_0000_0000_0100;
        #10;
        if ({D, C, B, A} !== 4'b0010) $display("FAIL: Test case 3 failed");
        
        // Test case 4: Input is 0000 0000 0000 1000 (binary 8)
        in = 16'b0000_0000_0000_1000;
        #10;
        if ({D, C, B, A} !== 4'b0011) $display("FAIL: Test case 4 failed");
        
        // Test case 5: Input is 0000 0000 0001 0000 (binary 16)
        in = 16'b0000_0000_0001_0000;
        #10;
        if ({D, C, B, A} !== 4'b0100) $display("FAIL: Test case 5 failed");
        
        // Test case 6: Input is 0000 0000 0010 0000 (binary 32)
        in = 16'b0000_0000_0010_0000;
        #10;
        if ({D, C, B, A} !== 4'b0101) $display("FAIL: Test case 6 failed");
        
        // Test case 7: Input is 0000 0000 0100 0000 (binary 64)
        in = 16'b0000_0000_0100_0000;
        #10;
        if ({D, C, B, A} !== 4'b0110) $display("FAIL: Test case 7 failed");
        
        // Test case 8: Input is 0000 0000 1000 0000 (binary 128)
        in = 16'b0000_0000_1000_0000;
        #10;
        if ({D, C, B, A} !== 4'b0111) $display("FAIL: Test case 8 failed");
        
        // Test case 9: Input is 1111 1111 1111 1111 (binary 15)
        in = 16'b1111_1111_1111_1111;
        #10;
        if ({D, C, B, A} !== 4'b1111) $display("FAIL: Test case 9 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule