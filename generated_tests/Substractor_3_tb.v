`timescale 1ns/1ps

module tb_Substractor;

    reg A, B, C;
    wire D, Brw;

    // Instantiate the Substractor module
    Substractor uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .Brw(Brw)
    );

    initial begin
        // Test case 1: A=0, B=0, C=0
        A = 0; B = 0; C = 0;
        #10;
        if (D !== 0 || Brw !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: A=0, B=0, C=1
        A = 0; B = 0; C = 1;
        #10;
        if (D !== 1 || Brw !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: A=0, B=1, C=0
        A = 0; B = 1; C = 0;
        #10;
        if (D !== 1 || Brw !== 1) $display("FAIL: Test case 3 failed");

        // Test case 4: A=0, B=1, C=1
        A = 0; B = 1; C = 1;
        #10;
        if (D !== 0 || Brw !== 1) $display("FAIL: Test case 4 failed");

        // Test case 5: A=1, B=0, C=0
        A = 1; B = 0; C = 0;
        #10;
        if (D !== 1 || Brw !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: A=1, B=0, C=1
        A = 1; B = 0; C = 1;
        #10;
        if (D !== 0 || Brw !== 1) $display("FAIL: Test case 6 failed");

        // Test case 7: A=1, B=1, C=0
        A = 1; B = 1; C = 0;
        #10;
        if (D !== 0 || Brw !== 0) $display("FAIL: Test case 7 failed");

        // Test case 8: A=1, B=1, C=1
        A = 1; B = 1; C = 1;
        #10;
        if (D !== 1 || Brw !== 1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule