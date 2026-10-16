`timescale 1ns/1ps

module tb_mul_1;
    reg [3:0] a;
    reg [3:0] b;
    wire [7:0] p;

    // Instantiate the module under test (uut)
    mul_1 uut (
        .a(a),
        .b(b),
        .p(p)
    );

    initial begin
        // Test case 1: 3 * 2 = 6
        a = 4'b0011; // 3
        b = 4'b0010; // 2
        #10;
        if (p !== 8'b00000110) $display("FAIL: Test case 1 failed, expected 6, got %d", p);
        
        // Test case 2: 4 * 3 = 12
        a = 4'b0100; // 4
        b = 4'b0011; // 3
        #10;
        if (p !== 8'b00001100) $display("FAIL: Test case 2 failed, expected 12, got %d", p);
        
        // Test case 3: 1 * 15 = 15
        a = 4'b0001; // 1
        b = 4'b1111; // 15
        #10;
        if (p !== 8'b00001111) $display("FAIL: Test case 3 failed, expected 15, got %d", p);
        
        // Test case 4: 0 * 10 = 0
        a = 4'b0000; // 0
        b = 4'b1010; // 10
        #10;
        if (p !== 8'b00000000) $display("FAIL: Test case 4 failed, expected 0, got %d", p);
        
        // Test case 5: 7 * 7 = 49
        a = 4'b0111; // 7
        b = 4'b0111; // 7
        #10;
        if (p !== 8'b00110001) $display("FAIL: Test case 5 failed, expected 49, got %d", p);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule