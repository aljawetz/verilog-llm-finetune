`timescale 1ns/1ps

module tb_ha_cum_hs;

    reg a, b, cntrl;
    wire sum, carry, barrow, differnce;

    // Instantiate the module under test (uut)
    ha_cum_hs uut (
        .a(a),
        .b(b),
        .cntrl(cntrl),
        .sum(sum),
        .carry(carry),
        .barrow(barrow),
        .differnce(differnce)
    );

    initial begin
        // Test Case 1: Half Subtractor (cntrl = 1)
        a = 0; b = 0; cntrl = 1; #10;
        if (differnce !== 0 || barrow !== 0) $display("FAIL: Test Case 1 Failed");
        
        a = 0; b = 1; cntrl = 1; #10;
        if (differnce !== 1 || barrow !== 1) $display("FAIL: Test Case 2 Failed");
        
        a = 1; b = 0; cntrl = 1; #10;
        if (differnce !== 1 || barrow !== 0) $display("FAIL: Test Case 3 Failed");
        
        a = 1; b = 1; cntrl = 1; #10;
        if (differnce !== 0 || barrow !== 0) $display("FAIL: Test Case 4 Failed");

        // Test Case 2: Half Adder (cntrl = 0)
        a = 0; b = 0; cntrl = 0; #10;
        if (sum !== 0 || carry !== 0) $display("FAIL: Test Case 5 Failed");
        
        a = 0; b = 1; cntrl = 0; #10;
        if (sum !== 1 || carry !== 0) $display("FAIL: Test Case 6 Failed");
        
        a = 1; b = 0; cntrl = 0; #10;
        if (sum !== 1 || carry !== 0) $display("FAIL: Test Case 7 Failed");
        
        a = 1; b = 1; cntrl = 0; #10;
        if (sum !== 0 || carry !== 1) $display("FAIL: Test Case 8 Failed");

        $display("PASS");
        $finish;
    end

endmodule