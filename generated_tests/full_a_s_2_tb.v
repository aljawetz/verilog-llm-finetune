`timescale 1ns/1ps

module tb_full_a_s;

    // Inputs
    reg in1;
    reg in2;
    reg mode;
    reg carryin;

    // Outputs
    wire sum_diff;
    wire carry_borr;

    // Instantiate the Unit Under Test (UUT)
    full_a_s uut (
        .in1(in1),
        .in2(in2),
        .mode(mode),
        .carryin(carryin),
        .sum_diff(sum_diff),
        .carry_borr(carry_borr)
    );

    initial begin
        // Test Case 1: Full Adder with in1=0, in2=0, carryin=0, mode=0
        in1 = 0; in2 = 0; carryin = 0; mode = 0;
        #10;
        if (sum_diff !== 0 || carry_borr !== 0) $display("FAIL: Test Case 1 Failed");

        // Test Case 2: Full Adder with in1=0, in2=1, carryin=0, mode=0
        in1 = 0; in2 = 1; carryin = 0; mode = 0;
        #10;
        if (sum_diff !== 1 || carry_borr !== 0) $display("FAIL: Test Case 2 Failed");

        // Test Case 3: Full Adder with in1=1, in2=1, carryin=0, mode=0
        in1 = 1; in2 = 1; carryin = 0; mode = 0;
        #10;
        if (sum_diff !== 0 || carry_borr !== 1) $display("FAIL: Test Case 3 Failed");

        // Test Case 4: Full Subtractor with in1=1, in2=0, carryin=0, mode=1
        in1 = 1; in2 = 0; carryin = 0; mode = 1;
        #10;
        if (sum_diff !== 1 || carry_borr !== 0) $display("FAIL: Test Case 4 Failed");

        // Test Case 5: Full Subtractor with in1=0, in2=1, carryin=0, mode=1
        in1 = 0; in2 = 1; carryin = 0; mode = 1;
        #10;
        if (sum_diff !== 1 || carry_borr !== 1) $display("FAIL: Test Case 5 Failed");

        // Test Case 6: Full Subtractor with in1=1, in2=1, carryin=1, mode=1
        in1 = 1; in2 = 1; carryin = 1; mode = 1;
        #10;
        if (sum_diff !== 1 || carry_borr !== 0) $display("FAIL: Test Case 6 Failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule