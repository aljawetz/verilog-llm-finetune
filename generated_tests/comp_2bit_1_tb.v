`timescale 1ns/1ps

module tb_comp_2bit;

    reg [1:0] a;
    reg [1:0] b;
    wire AgtB;
    wire AeqB;
    wire AltB;

    // Instantiate the module under test (uut)
    comp_2bit uut (
        .AltB(AltB),
        .AeqB(AeqB),
        .AgtB(AgtB),
        .a(a),
        .b(b)
    );

    initial begin
        // Test case 1: a = 00, b = 00 (Equal)
        a = 2'b00; b = 2'b00;
        #10;
        if (AgtB !== 0 || AeqB !== 1 || AltB !== 0) $display("FAIL: Test case 1 failed");
        
        // Test case 2: a = 01, b = 00 (Greater)
        a = 2'b01; b = 2'b00;
        #10;
        if (AgtB !== 1 || AeqB !== 0 || AltB !== 0) $display("FAIL: Test case 2 failed");
        
        // Test case 3: a = 00, b = 01 (Less)
        a = 2'b00; b = 2'b01;
        #10;
        if (AgtB !== 0 || AeqB !== 0 || AltB !== 1) $display("FAIL: Test case 3 failed");
        
        // Test case 4: a = 10, b = 01 (Greater)
        a = 2'b10; b = 2'b01;
        #10;
        if (AgtB !== 1 || AeqB !== 0 || AltB !== 0) $display("FAIL: Test case 4 failed");
        
        // Test case 5: a = 01, b = 10 (Less)
        a = 2'b01; b = 2'b10;
        #10;
        if (AgtB !== 0 || AeqB !== 0 || AltB !== 1) $display("FAIL: Test case 5 failed");
        
        // Test case 6: a = 11, b = 11 (Equal)
        a = 2'b11; b = 2'b11;
        #10;
        if (AgtB !== 0 || AeqB !== 1 || AltB !== 0) $display("FAIL: Test case 6 failed");
        
        // Test case 7: a = 10, b = 10 (Equal)
        a = 2'b10; b = 2'b10;
        #10;
        if (AgtB !== 0 || AeqB !== 1 || AltB !== 0) $display("FAIL: Test case 7 failed");
        
        // Test case 8: a = 11, b = 10 (Greater)
        a = 2'b11; b = 2'b10;
        #10;
        if (AgtB !== 1 || AeqB !== 0 || AltB !== 0) $display("FAIL: Test case 8 failed");
        
        // Test case 9: a = 10, b = 11 (Less)
        a = 2'b10; b = 2'b11;
        #10;
        if (AgtB !== 0 || AeqB !== 0 || AltB !== 1) $display("FAIL: Test case 9 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule