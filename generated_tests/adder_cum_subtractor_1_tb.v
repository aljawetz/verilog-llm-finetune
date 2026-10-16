`timescale 1ns/1ps

module tb_adder_cum_subtractor;

    reg a, b, c, cntrl;
    wire barrow, diff, sum, carry;

    // Instantiate the module under test (uut)
    adder_cum_subtractor uut (
        .a(a),
        .b(b),
        .c(c),
        .cntrl(cntrl),
        .barrow(barrow),
        .diff(diff),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        // Test addition
        cntrl = 0; // Set control to addition
        a = 0; b = 0; c = 0; #10;
        if (sum !== 0 || carry !== 0 || barrow !== 0 || diff !== 0) 
            $display("FAIL: Test 1 (0 + 0 + 0) failed");

        a = 0; b = 0; c = 1; #10;
        if (sum !== 1 || carry !== 0 || barrow !== 0 || diff !== 0) 
            $display("FAIL: Test 2 (0 + 0 + 1) failed");

        a = 0; b = 1; c = 0; #10;
        if (sum !== 1 || carry !== 0 || barrow !== 0 || diff !== 0) 
            $display("FAIL: Test 3 (0 + 1 + 0) failed");

        a = 1; b = 0; c = 0; #10;
        if (sum !== 1 || carry !== 0 || barrow !== 0 || diff !== 0) 
            $display("FAIL: Test 4 (1 + 0 + 0) failed");

        a = 1; b = 1; c = 0; #10;
        if (sum !== 0 || carry !== 1 || barrow !== 0 || diff !== 0) 
            $display("FAIL: Test 5 (1 + 1 + 0) failed");

        a = 1; b = 1; c = 1; #10;
        if (sum !== 1 || carry !== 1 || barrow !== 0 || diff !== 0) 
            $display("FAIL: Test 6 (1 + 1 + 1) failed");

        // Test subtraction
        cntrl = 1; // Set control to subtraction
        a = 0; b = 0; c = 0; #10;
        if (diff !== 0 || barrow !== 0 || sum !== 0 || carry !== 0) 
            $display("FAIL: Test 7 (0 - 0 - 0) failed");

        a = 0; b = 0; c = 1; #10;
        if (diff !== 1 || barrow !== 1 || sum !== 0 || carry !== 0) 
            $display("FAIL: Test 8 (0 - 0 - 1) failed");

        a = 0; b = 1; c = 0; #10;
        if (diff !== 1 || barrow !== 1 || sum !== 0 || carry !== 0) 
            $display("FAIL: Test 9 (0 - 1 - 0) failed");

        a = 1; b = 0; c = 0; #10;
        if (diff !== 1 || barrow !== 0 || sum !== 0 || carry !== 0) 
            $display("FAIL: Test 10 (1 - 0 - 0) failed");

        a = 1; b = 1; c = 0; #10;
        if (diff !== 0 || barrow !== 0 || sum !== 0 || carry !== 0) 
            $display("FAIL: Test 11 (1 - 1 - 0) failed");

        a = 1; b = 1; c = 1; #10;
        if (diff !== 0 || barrow !== 1 || sum !== 0 || carry !== 0) 
            $display("FAIL: Test 12 (1 - 1 - 1) failed");

        $display("PASS");
        $finish;
    end

endmodule