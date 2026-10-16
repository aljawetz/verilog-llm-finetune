`timescale 1ns/1ps

module tb_comparator3bit;

    reg [2:0] a, b;
    wire equal, greater, lower;

    // Instantiate the module under test (uut)
    comparator3bit uut (
        .a(a),
        .b(b),
        .equal(equal),
        .greater(greater),
        .lower(lower)
    );

    initial begin
        // Test case 1: a < b
        a = 3'b001; b = 3'b010; 
        #10;
        if (equal !== 0 || greater !== 0 || lower !== 1) 
            $display("FAIL: Test case 1 failed (a < b)");
        
        // Test case 2: a == b
        a = 3'b011; b = 3'b011; 
        #10;
        if (equal !== 1 || greater !== 0 || lower !== 0) 
            $display("FAIL: Test case 2 failed (a == b)");

        // Test case 3: a > b
        a = 3'b100; b = 3'b011; 
        #10;
        if (equal !== 0 || greater !== 1 || lower !== 0) 
            $display("FAIL: Test case 3 failed (a > b)");

        // Test case 4: a < b (different values)
        a = 3'b000; b = 3'b111; 
        #10;
        if (equal !== 0 || greater !== 0 || lower !== 1) 
            $display("FAIL: Test case 4 failed (a < b)");

        // Test case 5: a == b (different values)
        a = 3'b101; b = 3'b101; 
        #10;
        if (equal !== 1 || greater !== 0 || lower !== 0) 
            $display("FAIL: Test case 5 failed (a == b)");

        // Test case 6: a > b (different values)
        a = 3'b110; b = 3'b010; 
        #10;
        if (equal !== 0 || greater !== 1 || lower !== 0) 
            $display("FAIL: Test case 6 failed (a > b)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule