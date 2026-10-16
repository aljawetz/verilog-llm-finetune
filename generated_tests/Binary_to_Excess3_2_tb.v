`timescale 1ns/1ps

module tb_Binary_to_Excess3;

    reg [3:0] B_IN;
    wire [3:0] EX_OUT;
    
    // Instantiate the module under test (uut)
    Binary_to_Excess3 uut (
        .B_IN(B_IN),
        .EX_OUT(EX_OUT)
    );

    initial begin
        // Test cases
        // Test case 1: B_IN = 0
        B_IN = 4'b0000; #10;
        if (EX_OUT !== 4'b0011) $display("FAIL: Expected 0011 for input 0000, got %b", EX_OUT);

        // Test case 2: B_IN = 5
        B_IN = 4'b0101; #10;
        if (EX_OUT !== 4'b1000) $display("FAIL: Expected 1000 for input 0101, got %b", EX_OUT);

        // Test case 3: B_IN = 9
        B_IN = 4'b1001; #10;
        if (EX_OUT !== 4'b1100) $display("FAIL: Expected 1100 for input 1001, got %b", EX_OUT);

        // Test case 4: B_IN = 12
        B_IN = 4'b1100; #10;
        if (EX_OUT !== 4'b1111) $display("FAIL: Expected 1111 for input 1100, got %b", EX_OUT);

        // Test case 5: B_IN = 13 (undefined case)
        B_IN = 4'b1101; #10;
        if (EX_OUT !== 4'bxxxx) $display("FAIL: Expected xxxx for input 1101, got %b", EX_OUT);

        // Test case 6: B_IN = 15 (undefined case)
        B_IN = 4'b1111; #10;
        if (EX_OUT !== 4'bxxxx) $display("FAIL: Expected xxxx for input 1111, got %b", EX_OUT);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule