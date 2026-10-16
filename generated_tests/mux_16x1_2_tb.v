`timescale 1ns/1ps

module tb_mux_16x1;

    reg [16:0] a;
    reg [3:0] s;
    wire y;

    // Instantiate the module under test (uut)
    mux_16x1 uut (
        .a(a),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Check output for each input
        a = 17'b00000000000000001; s = 4'b0000; #10;
        if (y !== a[0]) $display("FAIL: Test case 1 failed for s=0000, expected %b, got %b", a[0], y);
        
        a = 17'b00000000000000010; s = 4'b0001; #10;
        if (y !== a[1]) $display("FAIL: Test case 2 failed for s=0001, expected %b, got %b", a[1], y);
        
        a = 17'b00000000000000100; s = 4'b0010; #10;
        if (y !== a[2]) $display("FAIL: Test case 3 failed for s=0010, expected %b, got %b", a[2], y);
        
        a = 17'b00000000000001000; s = 4'b0011; #10;
        if (y !== a[3]) $display("FAIL: Test case 4 failed for s=0011, expected %b, got %b", a[3], y);
        
        a = 17'b00000000000010000; s = 4'b0100; #10;
        if (y !== a[4]) $display("FAIL: Test case 5 failed for s=0100, expected %b, got %b", a[4], y);
        
        a = 17'b00000000000100000; s = 4'b0101; #10;
        if (y !== a[5]) $display("FAIL: Test case 6 failed for s=0101, expected %b, got %b", a[5], y);
        
        a = 17'b00000000001000000; s = 4'b0110; #10;
        if (y !== a[6]) $display("FAIL: Test case 7 failed for s=0110, expected %b, got %b", a[6], y);
        
        a = 17'b00000000010000000; s = 4'b0111; #10;
        if (y !== a[7]) $display("FAIL: Test case 8 failed for s=0111, expected %b, got %b", a[7], y);
        
        a = 17'b00000000100000000; s = 4'b1000; #10;
        if (y !== a[8]) $display("FAIL: Test case 9 failed for s=1000, expected %b, got %b", a[8], y);
        
        a = 17'b00000001000000000; s = 4'b1001; #10;
        if (y !== a[9]) $display("FAIL: Test case 10 failed for s=1001, expected %b, got %b", a[9], y);
        
        a = 17'b00000010000000000; s = 4'b1010; #10;
        if (y !== a[10]) $display("FAIL: Test case 11 failed for s=1010, expected %b, got %b", a[10], y);
        
        a = 17'b00000100000000000; s = 4'b1011; #10;
        if (y !== a[11]) $display("FAIL: Test case 12 failed for s=1011, expected %b, got %b", a[11], y);
        
        a = 17'b00001000000000000; s = 4'b1100; #10;
        if (y !== a[12]) $display("FAIL: Test case 13 failed for s=1100, expected %b, got %b", a[12], y);
        
        a = 17'b00010000000000000; s = 4'b1101; #10;
        if (y !== a[13]) $display("FAIL: Test case 14 failed for s=1101, expected %b, got %b", a[13], y);
        
        a = 17'b00100000000000000; s = 4'b1110; #10;
        if (y !== a[14]) $display("FAIL: Test case 15 failed for s=1110, expected %b, got %b", a[14], y);
        
        a = 17'b01000000000000000; s = 4'b1111; #10;
        if (y !== a[15]) $display("FAIL: Test case 16 failed for s=1111, expected %b, got %b", a[15], y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule