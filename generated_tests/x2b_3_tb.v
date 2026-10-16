`timescale 1ns/1ps

module tb_x2b;

    reg [3:0] inp;
    wire invalid;
    wire [3:0] op;

    // Instantiate the module under test
    x2b uut (
        .inp(inp),
        .invalid(invalid),
        .op(op)
    );

    initial begin
        // Test valid inputs
        inp = 4'b0011; #10;
        if (op !== 4'b0000 || invalid !== 0) $display("FAIL: Test case 1 failed");
        
        inp = 4'b0100; #10;
        if (op !== 4'b0001 || invalid !== 0) $display("FAIL: Test case 2 failed");
        
        inp = 4'b0101; #10;
        if (op !== 4'b0010 || invalid !== 0) $display("FAIL: Test case 3 failed");
        
        inp = 4'b0110; #10;
        if (op !== 4'b0011 || invalid !== 0) $display("FAIL: Test case 4 failed");
        
        inp = 4'b0111; #10;
        if (op !== 4'b0100 || invalid !== 0) $display("FAIL: Test case 5 failed");
        
        inp = 4'b1000; #10;
        if (op !== 4'b0101 || invalid !== 0) $display("FAIL: Test case 6 failed");
        
        inp = 4'b1001; #10;
        if (op !== 4'b0110 || invalid !== 0) $display("FAIL: Test case 7 failed");
        
        inp = 4'b1010; #10;
        if (op !== 4'b0111 || invalid !== 0) $display("FAIL: Test case 8 failed");
        
        inp = 4'b1011; #10;
        if (op !== 4'b1000 || invalid !== 0) $display("FAIL: Test case 9 failed");
        
        inp = 4'b1100; #10;
        if (op !== 4'b1001 || invalid !== 0) $display("FAIL: Test case 10 failed");

        // Test invalid inputs
        inp = 4'b0000; #10;
        if (op !== 4'bxxxx || invalid !== 1) $display("FAIL: Test case 11 failed");
        
        inp = 4'b0001; #10;
        if (op !== 4'bxxxx || invalid !== 1) $display("FAIL: Test case 12 failed");
        
        inp = 4'b0010; #10;
        if (op !== 4'bxxxx || invalid !== 1) $display("FAIL: Test case 13 failed");
        
        inp = 4'b1111; #10;
        if (op !== 4'bxxxx || invalid !== 1) $display("FAIL: Test case 14 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule