`timescale 1ns/1ps

module tb_bcdtosevensegment;

    reg [3:0] a;
    wire [6:0] y;

    // Instantiate the module under test (uut)
    bcdtosevensegment uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test cases for BCD to seven-segment display conversion
        // Expected outputs are in comments
        
        // Test for 0
        a = 4'b0000; #10;
        if (y !== 7'b1111110) $display("FAIL: Test case for 0 failed, got %b", y);
        
        // Test for 1
        a = 4'b0001; #10;
        if (y !== 7'b0110000) $display("FAIL: Test case for 1 failed, got %b", y);
        
        // Test for 2
        a = 4'b0010; #10;
        if (y !== 7'b1101101) $display("FAIL: Test case for 2 failed, got %b", y);
        
        // Test for 3
        a = 4'b0011; #10;
        if (y !== 7'b1111001) $display("FAIL: Test case for 3 failed, got %b", y);
        
        // Test for 4
        a = 4'b0100; #10;
        if (y !== 7'b0110011) $display("FAIL: Test case for 4 failed, got %b", y);
        
        // Test for 5
        a = 4'b0101; #10;
        if (y !== 7'b1011011) $display("FAIL: Test case for 5 failed, got %b", y);
        
        // Test for 6
        a = 4'b0110; #10;
        if (y !== 7'b1011111) $display("FAIL: Test case for 6 failed, got %b", y);
        
        // Test for 7
        a = 4'b0111; #10;
        if (y !== 7'b1110000) $display("FAIL: Test case for 7 failed, got %b", y);
        
        // Test for 8
        a = 4'b1000; #10;
        if (y !== 7'b1111111) $display("FAIL: Test case for 8 failed, got %b", y);
        
        // Test for 9
        a = 4'b1001; #10;
        if (y !== 7'b1111011) $display("FAIL: Test case for 9 failed, got %b", y);
        
        // Test for invalid input (10)
        a = 4'b1010; #10;
        if (y !== 7'b0000000) $display("FAIL: Test case for invalid input 10 failed, got %b", y);
        
        // Test for invalid input (15)
        a = 4'b1111; #10;
        if (y !== 7'b0000000) $display("FAIL: Test case for invalid input 15 failed, got %b", y);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule