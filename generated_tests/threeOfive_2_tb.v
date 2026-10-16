`timescale 1ns/1ps

module tb_threeOfive;

    reg in_1;
    reg in_2;
    reg in_3;
    reg in_4;
    reg in_5;
    wire out;

    // Instantiate the module under test (uut)
    threeOfive uut (
        .in_1(in_1),
        .in_2(in_2),
        .in_3(in_3),
        .in_4(in_4),
        .in_5(in_5),
        .out(out)
    );

    initial begin
        // Test case 1: 3 inputs high (1, 1, 1, 0, 0)
        in_1 = 1; in_2 = 1; in_3 = 1; in_4 = 0; in_5 = 0;
        #10;
        if (out !== 1) $display("FAIL: Test case 1 failed");

        // Test case 2: 2 inputs high (1, 1, 0, 0, 0)
        in_1 = 1; in_2 = 1; in_3 = 0; in_4 = 0; in_5 = 0;
        #10;
        if (out !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: 4 inputs high (1, 1, 1, 1, 0)
        in_1 = 1; in_2 = 1; in_3 = 1; in_4 = 1; in_5 = 0;
        #10;
        if (out !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: 3 inputs high (1, 0, 1, 1, 0)
        in_1 = 1; in_2 = 0; in_3 = 1; in_4 = 1; in_5 = 0;
        #10;
        if (out !== 1) $display("FAIL: Test case 4 failed");

        // Test case 5: 5 inputs high (1, 1, 1, 1, 1)
        in_1 = 1; in_2 = 1; in_3 = 1; in_4 = 1; in_5 = 1;
        #10;
        if (out !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: 0 inputs high (0, 0, 0, 0, 0)
        in_1 = 0; in_2 = 0; in_3 = 0; in_4 = 0; in_5 = 0;
        #10;
        if (out !== 0) $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule