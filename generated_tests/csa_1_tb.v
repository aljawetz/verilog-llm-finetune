`timescale 1ns/1ps

module tb_csa;

    reg [3:0] a, b, c;
    wire [3:0] sum, carry;

    // Instantiate the carry-save adder
    csa uut (
        .a(a),
        .b(b),
        .c(c),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        // Test case 1: All inputs are 0
        a = 4'b0000; b = 4'b0000; c = 4'b0000;
        #10;
        if (sum !== 4'b0000 || carry !== 4'b0000) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: All inputs are 1
        a = 4'b1111; b = 4'b1111; c = 4'b1111;
        #10;
        if (sum !== 4'b1111 || carry !== 4'b1110) 
            $display("FAIL: Test case 2 failed");

        // Test case 3: Mixed inputs
        a = 4'b1010; b = 4'b0101; c = 4'b0011;
        #10;
        if (sum !== 4'b1100 || carry !== 4'b1111) 
            $display("FAIL: Test case 3 failed");

        // Test case 4: All inputs are different
        a = 4'b0001; b = 4'b0010; c = 4'b0100;
        #10;
        if (sum !== 4'b0111 || carry !== 4'b0000) 
            $display("FAIL: Test case 4 failed");

        // Test case 5: Random values
        a = 4'b1100; b = 4'b1010; c = 4'b0111;
        #10;
        if (sum !== 4'b0001 || carry !== 4'b1111) 
            $display("FAIL: Test case 5 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule