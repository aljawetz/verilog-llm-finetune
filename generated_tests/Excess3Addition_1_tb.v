`timescale 1ns/1ps

module tb_Excess3Addition;
    reg [3:0] A, B;
    wire [3:0] Exc3Sum, Exc3Carry, BCDSum, BCDCarry;

    // Instantiate the module under test
    Excess3Addition uut (
        .A(A),
        .B(B),
        .Exc3Sum(Exc3Sum),
        .Exc3Carry(Exc3Carry),
        .BCDSum(BCDSum),
        .BCDCarry(BCDCarry)
    );

    initial begin
        // Test cases
        // Test case 1: A = 0, B = 0
        A = 4'b0000; B = 4'b0000; #10;
        if (Exc3Sum !== 4'b0011 || Exc3Carry !== 4'b0000 || BCDSum !== 4'b0000 || BCDCarry !== 4'b0000) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: A = 1, B = 1
        A = 4'b0001; B = 4'b0001; #10;
        if (Exc3Sum !== 4'b0100 || Exc3Carry !== 4'b0000 || BCDSum !== 4'b0001 || BCDCarry !== 4'b0000) 
            $display("FAIL: Test case 2 failed");
        
        // Test case 3: A = 5, B = 5
        A = 4'b0101; B = 4'b0101; #10;
        if (Exc3Sum !== 4'b1000 || Exc3Carry !== 4'b0000 || BCDSum !== 4'b0100 || BCDCarry !== 4'b0000) 
            $display("FAIL: Test case 3 failed");
        
        // Test case 4: A = 9, B = 9
        A = 4'b1001; B = 4'b1001; #10;
        if (Exc3Sum !== 4'b0001 || Exc3Carry !== 4'b0001 || BCDSum !== 4'b0000 || BCDCarry !== 4'b0001) 
            $display("FAIL: Test case 4 failed");
        
        // Test case 5: A = 3, B = 6
        A = 4'b0011; B = 4'b0110; #10;
        if (Exc3Sum !== 4'b1001 || Exc3Carry !== 4'b0000 || BCDSum !== 4'b0010 || BCDCarry !== 4'b0000) 
            $display("FAIL: Test case 5 failed");

        // Test case 6: A = 7, B = 8
        A = 4'b0111; B = 4'b1000; #10;
        if (Exc3Sum !== 4'b0001 || Exc3Carry !== 4'b0001 || BCDSum !== 4'b0000 || BCDCarry !== 4'b0001) 
            $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule