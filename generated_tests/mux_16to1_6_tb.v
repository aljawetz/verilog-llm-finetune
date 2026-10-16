`timescale 1ns/1ps

module tb_mux_16to1;

    reg [15:0] d;
    reg [3:0] s;
    wire y;

    // Instantiate the module under test
    mux_16to1 uut (
        .d(d),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select 0
        d = 16'b1010101010101010; // Input vector
        s = 4'b0000; // Select line
        #10; // Wait for a short time
        if (y !== d[0]) $display("FAIL: Test case 1 failed, expected %b but got %b", d[0], y);

        // Test case 2: Select 1
        s = 4'b0001; 
        #10; 
        if (y !== d[1]) $display("FAIL: Test case 2 failed, expected %b but got %b", d[1], y);

        // Test case 3: Select 2
        s = 4'b0010; 
        #10; 
        if (y !== d[2]) $display("FAIL: Test case 3 failed, expected %b but got %b", d[2], y);

        // Test case 4: Select 3
        s = 4'b0011; 
        #10; 
        if (y !== d[3]) $display("FAIL: Test case 4 failed, expected %b but got %b", d[3], y);

        // Test case 5: Select 4
        s = 4'b0100; 
        #10; 
        if (y !== d[4]) $display("FAIL: Test case 5 failed, expected %b but got %b", d[4], y);

        // Test case 6: Select 5
        s = 4'b0101; 
        #10; 
        if (y !== d[5]) $display("FAIL: Test case 6 failed, expected %b but got %b", d[5], y);

        // Test case 7: Select 6
        s = 4'b0110; 
        #10; 
        if (y !== d[6]) $display("FAIL: Test case 7 failed, expected %b but got %b", d[6], y);

        // Test case 8: Select 7
        s = 4'b0111; 
        #10; 
        if (y !== d[7]) $display("FAIL: Test case 8 failed, expected %b but got %b", d[7], y);

        // Test case 9: Select 8
        s = 4'b1000; 
        #10; 
        if (y !== d[8]) $display("FAIL: Test case 9 failed, expected %b but got %b", d[8], y);

        // Test case 10: Select 9
        s = 4'b1001; 
        #10; 
        if (y !== d[9]) $display("FAIL: Test case 10 failed, expected %b but got %b", d[9], y);

        // Test case 11: Select 10
        s = 4'b1010; 
        #10; 
        if (y !== d[10]) $display("FAIL: Test case 11 failed, expected %b but got %b", d[10], y);

        // Test case 12: Select 11
        s = 4'b1011; 
        #10; 
        if (y !== d[11]) $display("FAIL: Test case 12 failed, expected %b but got %b", d[11], y);

        // Test case 13: Select 12
        s = 4'b1100; 
        #10; 
        if (y !== d[12]) $display("FAIL: Test case 13 failed, expected %b but got %b", d[12], y);

        // Test case 14: Select 13
        s = 4'b1101; 
        #10; 
        if (y !== d[13]) $display("FAIL: Test case 14 failed, expected %b but got %b", d[13], y);

        // Test case 15: Select 14
        s = 4'b1110; 
        #10; 
        if (y !== d[14]) $display("FAIL: Test case 15 failed, expected %b but got %b", d[14], y);

        // Test case 16: Select 15
        s = 4'b1111; 
        #10; 
        if (y !== d[15]) $display("FAIL: Test case 16 failed, expected %b but got %b", d[15], y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule