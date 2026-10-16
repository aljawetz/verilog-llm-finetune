`timescale 1ns/1ps

module tb_full_adder_df;

    // Inputs
    reg a;
    reg b;
    reg c;

    // Outputs
    wire sum;

    // Instantiate the Unit Under Test (UUT)
    full_adder_df uut (
        .a(a),
        .b(b),
        .c(c),
        .sum(sum)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0
        a = 0; b = 0; c = 0;
        #10;
        if (sum !== 0) $display("FAIL: Test case 1 failed, expected sum=0, got sum=%b", sum);

        // Test case 2: 0 + 0 + 1 = 1
        a = 0; b = 0; c = 1;
        #10;
        if (sum !== 1) $display("FAIL: Test case 2 failed, expected sum=1, got sum=%b", sum);

        // Test case 3: 0 + 1 + 0 = 1
        a = 0; b = 1; c = 0;
        #10;
        if (sum !== 1) $display("FAIL: Test case 3 failed, expected sum=1, got sum=%b", sum);

        // Test case 4: 1 + 0 + 0 = 1
        a = 1; b = 0; c = 0;
        #10;
        if (sum !== 1) $display("FAIL: Test case 4 failed, expected sum=1, got sum=%b", sum);

        // Test case 5: 1 + 1 + 0 = 0
        a = 1; b = 1; c = 0;
        #10;
        if (sum !== 0) $display("FAIL: Test case 5 failed, expected sum=0, got sum=%b", sum);

        // Test case 6: 1 + 0 + 1 = 0
        a = 1; b = 0; c = 1;
        #10;
        if (sum !== 0) $display("FAIL: Test case 6 failed, expected sum=0, got sum=%b", sum);

        // Test case 7: 0 + 1 + 1 = 0
        a = 0; b = 1; c = 1;
        #10;
        if (sum !== 0) $display("FAIL: Test case 7 failed, expected sum=0, got sum=%b", sum);

        // Test case 8: 1 + 1 + 1 = 1
        a = 1; b = 1; c = 1;
        #10;
        if (sum !== 1) $display("FAIL: Test case 8 failed, expected sum=1, got sum=%b", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule