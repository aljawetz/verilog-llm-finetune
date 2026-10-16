`timescale 1ns/1ps

module tb_comparator;

    reg [3:0] A;
    reg [3:0] B;
    wire Eq, Gt, St;

    // Instantiate the comparator module
    comparator uut (
        .Eq(Eq),
        .Gt(Gt),
        .St(St),
        .A(A),
        .B(B)
    );

    initial begin
        // Test case 1: A = 4'b0000, B = 4'b0000 (Equal)
        A = 4'b0000; B = 4'b0000;
        #10;
        if (Eq !== 1'b1 || Gt !== 1'b0 || St !== 1'b0) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: A = 4'b0001, B = 4'b0000 (A > B)
        A = 4'b0001; B = 4'b0000;
        #10;
        if (Eq !== 1'b0 || Gt !== 1'b1 || St !== 1'b0) 
            $display("FAIL: Test case 2 failed");

        // Test case 3: A = 4'b0000, B = 4'b0001 (A < B)
        A = 4'b0000; B = 4'b0001;
        #10;
        if (Eq !== 1'b0 || Gt !== 1'b0 || St !== 1'b1) 
            $display("FAIL: Test case 3 failed");

        // Test case 4: A = 4'b1111, B = 4'b1111 (Equal)
        A = 4'b1111; B = 4'b1111;
        #10;
        if (Eq !== 1'b1 || Gt !== 1'b0 || St !== 1'b0) 
            $display("FAIL: Test case 4 failed");

        // Test case 5: A = 4'b1110, B = 4'b1111 (A < B)
        A = 4'b1110; B = 4'b1111;
        #10;
        if (Eq !== 1'b0 || Gt !== 1'b0 || St !== 1'b1) 
            $display("FAIL: Test case 5 failed");

        // Test case 6: A = 4'b1111, B = 4'b1110 (A > B)
        A = 4'b1111; B = 4'b1110;
        #10;
        if (Eq !== 1'b0 || Gt !== 1'b1 || St !== 1'b0) 
            $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule