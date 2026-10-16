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
        // Test case 1: Input = 16'b0000_0000_0000_0001 (1)
        in = 16'b0000_0000_0000_0001;
        #10;
        if ({D, C, B, A} !== 4'b0000) $display("FAIL: Test case 1 failed");
        
        // Test case 2: Input = 16'b0000_0000_0000_0010 (2)
        in = 16'b0000_0000_0000_0010;
        #10;
        if ({D, C, B, A} !== 4'b0001) $display("FAIL: Test case 2 failed");
        
        // Test case 3: Input = 16'b0000_0000_0000_0100 (4)
        in = 16'b0000_0000_0000_0100;
        #10;
        if ({D, C, B, A} !== 4'b0010) $display("FAIL: Test case 3 failed");
        
        // Test case 4: Input = 16'b0000_0000_0000_1000 (8)
        in = 16'b0000_0000_0000_1000;
        #10;
        if ({D, C, B, A} !== 4'b0011) $display("FAIL: Test case 4 failed");
        
        // Test case 5: Input = 16'b0000_0000_0001_0000 (16)
        in = 16'b0000_0000_0001_0000;
        #10;
        if ({D, C, B, A} !== 4'b0100) $display("FAIL: Test case 5 failed");
        
        // Test case 6: Input = 16'b0000_0000_0010_0000 (32)
        in = 16'b0000_0000_0010_0000;
        #10;
        if ({D, C, B, A} !== 4'b0101) $display("FAIL: Test case 6 failed");
        
        // Test case 7: Input = 16'b0000_0000_0100_0000 (64)
        in = 16'b0000_0000_0100_0000;
        #10;
        if ({D, C, B, A} !== 4'b0110) $display("FAIL: Test case 7 failed");
        
        // Test case 8: Input = 16'b0000_0001_0000_0000 (128)
        in = 16'b0000_0001_0000_0000;
        #10;
        if ({D, C, B, A} !== 4'b0111) $display("FAIL: Test case 8 failed");
        
        // Test case 9: Input = 16'b0000_0000_0000_1111 (15)
        in = 16'b0000_0000_0000_1111;
        #10;
        if ({D, C, B, A} !== 4'b0011) $display("FAIL: Test case 9 failed");
        
        // Test case 10: Input = 16'b1111_1111_1111_1111 (15)
        in = 16'b1111_1111_1111_1111;
        #10;
        if ({D, C, B, A} !== 4'b1111) $display("FAIL: Test case 10 failed");
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule