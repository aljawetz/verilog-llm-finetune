`timescale 1ns/1ps

module tb_comparator_3bit;

    reg [2:0] a;
    reg [2:0] b;
    wire equal;
    wire gt;
    wire lt;

    // Instantiate the module under test (uut)
    comparator_3bit uut (
        .a(a),
        .b(b),
        .equal(equal),
        .gt(gt),
        .lt(lt)
    );

    initial begin
        // Test case 1: a = 3'b000, b = 3'b000 (equal)
        a = 3'b000; b = 3'b000;
        #10;
        if (!(equal && !gt && !lt)) $display("FAIL: Test case 1 failed");
        
        // Test case 2: a = 3'b001, b = 3'b000 (greater)
        a = 3'b001; b = 3'b000;
        #10;
        if (!(equal == 0 && gt && lt == 0)) $display("FAIL: Test case 2 failed");
        
        // Test case 3: a = 3'b000, b = 3'b001 (less)
        a = 3'b000; b = 3'b001;
        #10;
        if (!(equal == 0 && gt == 0 && lt)) $display("FAIL: Test case 3 failed");
        
        // Test case 4: a = 3'b010, b = 3'b010 (equal)
        a = 3'b010; b = 3'b010;
        #10;
        if (!(equal && !gt && !lt)) $display("FAIL: Test case 4 failed");
        
        // Test case 5: a = 3'b011, b = 3'b010 (greater)
        a = 3'b011; b = 3'b010;
        #10;
        if (!(equal == 0 && gt && lt == 0)) $display("FAIL: Test case 5 failed");
        
        // Test case 6: a = 3'b010, b = 3'b011 (less)
        a = 3'b010; b = 3'b011;
        #10;
        if (!(equal == 0 && gt == 0 && lt)) $display("FAIL: Test case 6 failed");
        
        // Test case 7: a = 3'b111, b = 3'b111 (equal)
        a = 3'b111; b = 3'b111;
        #10;
        if (!(equal && !gt && !lt)) $display("FAIL: Test case 7 failed");
        
        // Test case 8: a = 3'b110, b = 3'b111 (less)
        a = 3'b110; b = 3'b111;
        #10;
        if (!(equal == 0 && gt == 0 && lt)) $display("FAIL: Test case 8 failed");
        
        // Test case 9: a = 3'b111, b = 3'b110 (greater)
        a = 3'b111; b = 3'b110;
        #10;
        if (!(equal == 0 && gt && lt == 0)) $display("FAIL: Test case 9 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule