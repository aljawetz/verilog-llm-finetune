`timescale 1ns/1ps

module tb_FS_dataflow;

    reg a;
    reg b;
    reg c;
    wire differ;
    wire barrow;

    // Instantiate the module under test (uut)
    FS_dataflow uut (
        .a(a),
        .b(b),
        .c(c),
        .differ(differ),
        .barrow(barrow)
    );

    initial begin
        // Test case 1: a=0, b=0, c=0
        a = 0; b = 0; c = 0;
        #10;
        if (differ !== 0 || barrow !== 0) 
            $display("FAIL: Test case 1 failed (a=0, b=0, c=0)");
        
        // Test case 2: a=0, b=0, c=1
        a = 0; b = 0; c = 1;
        #10;
        if (differ !== 1 || barrow !== 0) 
            $display("FAIL: Test case 2 failed (a=0, b=0, c=1)");

        // Test case 3: a=0, b=1, c=0
        a = 0; b = 1; c = 0;
        #10;
        if (differ !== 1 || barrow !== 1) 
            $display("FAIL: Test case 3 failed (a=0, b=1, c=0)");

        // Test case 4: a=0, b=1, c=1
        a = 0; b = 1; c = 1;
        #10;
        if (differ !== 0 || barrow !== 1) 
            $display("FAIL: Test case 4 failed (a=0, b=1, c=1)");

        // Test case 5: a=1, b=0, c=0
        a = 1; b = 0; c = 0;
        #10;
        if (differ !== 1 || barrow !== 0) 
            $display("FAIL: Test case 5 failed (a=1, b=0, c=0)");

        // Test case 6: a=1, b=0, c=1
        a = 1; b = 0; c = 1;
        #10;
        if (differ !== 0 || barrow !== 1) 
            $display("FAIL: Test case 6 failed (a=1, b=0, c=1)");

        // Test case 7: a=1, b=1, c=0
        a = 1; b = 1; c = 0;
        #10;
        if (differ !== 0 || barrow !== 0) 
            $display("FAIL: Test case 7 failed (a=1, b=1, c=0)");

        // Test case 8: a=1, b=1, c=1
        a = 1; b = 1; c = 1;
        #10;
        if (differ !== 1 || barrow !== 0) 
            $display("FAIL: Test case 8 failed (a=1, b=1, c=1)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule