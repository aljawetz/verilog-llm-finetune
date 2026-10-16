`timescale 1ns/1ps

module tb_bcdtodec;

    reg [3:0] a;
    wire [9:0] y;

    // Instantiate the module under test
    bcdtodec uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test all BCD inputs from 0 to 9
        a = 4'b0000; #10; // Input 0
        if (y !== 10'b0000000000) $display("FAIL: Expected y=0000000001 for a=0000, got y=%b", y);
        
        a = 4'b0001; #10; // Input 1
        if (y !== 10'b0000000001) $display("FAIL: Expected y=0000000010 for a=0001, got y=%b", y);
        
        a = 4'b0010; #10; // Input 2
        if (y !== 10'b0000000010) $display("FAIL: Expected y=0000000100 for a=0010, got y=%b", y);
        
        a = 4'b0011; #10; // Input 3
        if (y !== 10'b0000000100) $display("FAIL: Expected y=0000001000 for a=0011, got y=%b", y);
        
        a = 4'b0100; #10; // Input 4
        if (y !== 10'b0000001000) $display("FAIL: Expected y=0000010000 for a=0100, got y=%b", y);
        
        a = 4'b0101; #10; // Input 5
        if (y !== 10'b0000010000) $display("FAIL: Expected y=0000100000 for a=0101, got y=%b", y);
        
        a = 4'b0110; #10; // Input 6
        if (y !== 10'b0000100000) $display("FAIL: Expected y=0001000000 for a=0110, got y=%b", y);
        
        a = 4'b0111; #10; // Input 7
        if (y !== 10'b0001000000) $display("FAIL: Expected y=0010000000 for a=0111, got y=%b", y);
        
        a = 4'b1000; #10; // Input 8
        if (y !== 10'b0010000000) $display("FAIL: Expected y=0100000000 for a=1000, got y=%b", y);
        
        a = 4'b1001; #10; // Input 9
        if (y !== 10'b0100000000) $display("FAIL: Expected y=1000000000 for a=1001, got y=%b", y);
        
        // Test invalid BCD input (10)
        a = 4'b1010; #10; // Input 10
        if (y !== 10'b0000000000) $display("FAIL: Expected y=0000000000 for a=1010, got y=%b", y);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule