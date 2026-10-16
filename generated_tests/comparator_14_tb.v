`timescale 1ns/1ps

module tb_comparator;

    reg [3:0] a;
    reg [3:0] b;
    wire a_gt_b;
    wire a_lt_b;
    wire a_eq_b;

    // Instantiate the module under test
    comparator uut (
        .a(a),
        .b(b),
        .a_gt_b(a_gt_b),
        .a_lt_b(a_lt_b),
        .a_eq_b(a_eq_b)
    );

    initial begin
        // Test case 1: a = 4, b = 2 (a > b)
        a = 4'b0100; b = 4'b0010;
        #10;
        if (a_gt_b !== 1'b1 || a_lt_b !== 1'b0 || a_eq_b !== 1'b0) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: a = 2, b = 4 (a < b)
        a = 4'b0010; b = 4'b0100;
        #10;
        if (a_gt_b !== 1'b0 || a_lt_b !== 1'b1 || a_eq_b !== 1'b0) 
            $display("FAIL: Test case 2 failed");

        // Test case 3: a = 3, b = 3 (a == b)
        a = 4'b0011; b = 4'b0011;
        #10;
        if (a_gt_b !== 1'b0 || a_lt_b !== 1'b0 || a_eq_b !== 1'b1) 
            $display("FAIL: Test case 3 failed");

        // Test case 4: a = 0, b = 0 (a == b)
        a = 4'b0000; b = 4'b0000;
        #10;
        if (a_gt_b !== 1'b0 || a_lt_b !== 1'b0 || a_eq_b !== 1'b1) 
            $display("FAIL: Test case 4 failed");

        // Test case 5: a = 15, b = 1 (a > b)
        a = 4'b1111; b = 4'b0001;
        #10;
        if (a_gt_b !== 1'b1 || a_lt_b !== 1'b0 || a_eq_b !== 1'b0) 
            $display("FAIL: Test case 5 failed");

        // Test case 6: a = 1, b = 15 (a < b)
        a = 4'b0001; b = 4'b1111;
        #10;
        if (a_gt_b !== 1'b0 || a_lt_b !== 1'b1 || a_eq_b !== 1'b0) 
            $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule