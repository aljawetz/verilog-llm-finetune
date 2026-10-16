`timescale 1ns/1ps

module tb_nand3;

    reg in1, in2, in3;
    wire out;

    // Instantiate the module under test (uut)
    nand3 uut (
        .out(out),
        .in1(in1),
        .in2(in2),
        .in3(in3)
    );

    initial begin
        // Test case 1: All inputs are 0
        in1 = 0; in2 = 0; in3 = 0;
        #10;
        if (out !== 1) $display("FAIL: Test case 1 failed (0, 0, 0)"); 

        // Test case 2: One input is 1
        in1 = 1; in2 = 0; in3 = 0;
        #10;
        if (out !== 1) $display("FAIL: Test case 2 failed (1, 0, 0)"); 

        // Test case 3: Two inputs are 1
        in1 = 1; in2 = 1; in3 = 0;
        #10;
        if (out !== 1) $display("FAIL: Test case 3 failed (1, 1, 0)"); 

        // Test case 4: All inputs are 1
        in1 = 1; in2 = 1; in3 = 1;
        #10;
        if (out !== 0) $display("FAIL: Test case 4 failed (1, 1, 1)"); 

        // Test case 5: Two inputs are 1, one is 0 (different combination)
        in1 = 0; in2 = 1; in3 = 1;
        #10;
        if (out !== 1) $display("FAIL: Test case 5 failed (0, 1, 1)"); 

        // Test case 6: Two inputs are 1, one is 0 (another combination)
        in1 = 1; in2 = 0; in3 = 1;
        #10;
        if (out !== 1) $display("FAIL: Test case 6 failed (1, 0, 1)"); 

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule