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
        // Test case 1: in = 16'h0000 (0)
        in = 16'h0000;
        #10;
        if (A !== 1'b0 || B !== 1'b0 || C !== 1'b0 || D !== 1'b0) 
            $display("FAIL: Test case 1 failed for input 0");
        
        // Test case 2: in = 16'h0001 (1)
        in = 16'h0001;
        #10;
        if (A !== 1'b1 || B !== 1'b0 || C !== 1'b0 || D !== 1'b0) 
            $display("FAIL: Test case 2 failed for input 1");
        
        // Test case 3: in = 16'h000F (15)
        in = 16'h000F;
        #10;
        if (A !== 1'b1 || B !== 1'b1 || C !== 1'b1 || D !== 1'b0) 
            $display("FAIL: Test case 3 failed for input 15");
        
        // Test case 4: in = 16'h00FF (255)
        in = 16'h00FF;
        #10;
        if (A !== 1'b1 || B !== 1'b1 || C !== 1'b1 || D !== 1'b1) 
            $display("FAIL: Test case 4 failed for input 255");
        
        // Test case 5: in = 16'hFFFF (65535)
        in = 16'hFFFF;
        #10;
        if (A !== 1'b1 || B !== 1'b1 || C !== 1'b1 || D !== 1'b1) 
            $display("FAIL: Test case 5 failed for input 65535");
        
        // Test case 6: in = 16'h1234 (4660)
        in = 16'h1234;
        #10;
        if (A !== 1'b1 || B !== 1'b0 || C !== 1'b1 || D !== 1'b0) 
            $display("FAIL: Test case 6 failed for input 4660");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule