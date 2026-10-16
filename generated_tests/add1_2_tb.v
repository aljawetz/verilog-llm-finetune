`timescale 1ns/1ps

module tb_add1;

    reg a;
    reg b;
    reg Cin;
    wire y;
    wire Co;

    // Instantiate the module under test (uut)
    add1 uut (
        .a(a),
        .b(b),
        .Cin(Cin),
        .y(y),
        .Co(Co)
    );

    initial begin
        // Test cases
        // Test case 1: 0 + 0 + 0 = 0, Co = 0
        a = 0; b = 0; Cin = 0; #10;
        if (y !== 0 || Co !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: 0 + 0 + 1 = 1, Co = 0
        a = 0; b = 0; Cin = 1; #10;
        if (y !== 1 || Co !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: 0 + 1 + 0 = 1, Co = 0
        a = 0; b = 1; Cin = 0; #10;
        if (y !== 1 || Co !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: 0 + 1 + 1 = 0, Co = 1
        a = 0; b = 1; Cin = 1; #10;
        if (y !== 0 || Co !== 1) $display("FAIL: Test case 4 failed");

        // Test case 5: 1 + 0 + 0 = 1, Co = 0
        a = 1; b = 0; Cin = 0; #10;
        if (y !== 1 || Co !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: 1 + 0 + 1 = 0, Co = 1
        a = 1; b = 0; Cin = 1; #10;
        if (y !== 0 || Co !== 1) $display("FAIL: Test case 6 failed");

        // Test case 7: 1 + 1 + 0 = 0, Co = 1
        a = 1; b = 1; Cin = 0; #10;
        if (y !== 0 || Co !== 1) $display("FAIL: Test case 7 failed");

        // Test case 8: 1 + 1 + 1 = 1, Co = 1
        a = 1; b = 1; Cin = 1; #10;
        if (y !== 1 || Co !== 1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule