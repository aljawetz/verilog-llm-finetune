`timescale 1ns/1ps

module tb_half_adder;

    parameter DATA_WIDTH = 4;

    reg [DATA_WIDTH - 1 : 0] A;
    reg [DATA_WIDTH - 1 : 0] B;
    wire [DATA_WIDTH - 1 : 0] Sum;
    wire Carry;

    // Instantiate the half_adder module
    half_adder #(.DATA_WIDTH(DATA_WIDTH)) uut (
        .A(A),
        .B(B),
        .Sum(Sum),
        .Carry(Carry)
    );

    initial begin
        // Test case 1: A = 0000, B = 0000
        A = 4'b0000; B = 4'b0000;
        #10;
        if (Sum !== 4'b0000 || Carry !== 1'b0) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: A = 0001, B = 0001
        A = 4'b0001; B = 4'b0001;
        #10;
        if (Sum !== 4'b0000 || Carry !== 1'b1) 
            $display("FAIL: Test case 2 failed");
        
        // Test case 3: A = 0011, B = 0001
        A = 4'b0011; B = 4'b0001;
        #10;
        if (Sum !== 4'b0010 || Carry !== 1'b0) 
            $display("FAIL: Test case 3 failed");
        
        // Test case 4: A = 1111, B = 1111
        A = 4'b1111; B = 4'b1111;
        #10;
        if (Sum !== 4'b0000 || Carry !== 1'b1) 
            $display("FAIL: Test case 4 failed");
        
        // Test case 5: A = 1010, B = 0101
        A = 4'b1010; B = 4'b0101;
        #10;
        if (Sum !== 4'b1111 || Carry !== 1'b0) 
            $display("FAIL: Test case 5 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule