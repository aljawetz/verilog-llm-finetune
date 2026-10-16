`timescale 1ns/1ps

module tb_full_adder;

    // Inputs
    reg in1;
    reg in2;
    reg carryin;

    // Outputs
    wire sum;
    wire carry;

    // Instantiate the Unit Under Test (UUT)
    full_adder uut (
        .in1(in1),
        .in2(in2),
        .carryin(carryin),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0, carry = 0
        in1 = 0; in2 = 0; carryin = 0;
        #10;
        if (sum !== 0 || carry !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: 0 + 0 + 1 = 1, carry = 0
        in1 = 0; in2 = 0; carryin = 1;
        #10;
        if (sum !== 1 || carry !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: 0 + 1 + 0 = 1, carry = 0
        in1 = 0; in2 = 1; carryin = 0;
        #10;
        if (sum !== 1 || carry !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: 0 + 1 + 1 = 0, carry = 1
        in1 = 0; in2 = 1; carryin = 1;
        #10;
        if (sum !== 0 || carry !== 1) $display("FAIL: Test case 4 failed");

        // Test case 5: 1 + 0 + 0 = 1, carry = 0
        in1 = 1; in2 = 0; carryin = 0;
        #10;
        if (sum !== 1 || carry !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: 1 + 0 + 1 = 0, carry = 1
        in1 = 1; in2 = 0; carryin = 1;
        #10;
        if (sum !== 0 || carry !== 1) $display("FAIL: Test case 6 failed");

        // Test case 7: 1 + 1 + 0 = 0, carry = 1
        in1 = 1; in2 = 1; carryin = 0;
        #10;
        if (sum !== 0 || carry !== 1) $display("FAIL: Test case 7 failed");

        // Test case 8: 1 + 1 + 1 = 1, carry = 1
        in1 = 1; in2 = 1; carryin = 1;
        #10;
        if (sum !== 1 || carry !== 1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule