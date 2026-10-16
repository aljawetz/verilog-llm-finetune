`timescale 1ns/1ps

module tb_adder_subtractor;

    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg c_in;

    // Outputs
    wire [3:0] sum;
    wire cy;

    // Instantiate the Unit Under Test (UUT)
    adder_subtractor uut (
        .a(a),
        .b(b),
        .c_in(c_in),
        .sum(sum),
        .cy(cy)
    );

    initial begin
        // Test Case 1: Addition (0 + 1)
        a = 4'b0000; b = 4'b0001; c_in = 0;
        #10;
        if (sum !== 4'b0001 || cy !== 0) $display("FAIL: Test Case 1 Failed");

        // Test Case 2: Addition (3 + 2)
        a = 4'b0011; b = 4'b0010; c_in = 0;
        #10;
        if (sum !== 4'b0101 || cy !== 0) $display("FAIL: Test Case 2 Failed");

        // Test Case 3: Subtraction (3 - 2)
        a = 4'b0011; b = 4'b0010; c_in = 1;
        #10;
        if (sum !== 4'b0001 || cy !== 0) $display("FAIL: Test Case 3 Failed");

        // Test Case 4: Subtraction (2 - 3)
        a = 4'b0010; b = 4'b0011; c_in = 1;
        #10;
        if (sum !== 4'b1111 || cy !== 1) $display("FAIL: Test Case 4 Failed");

        // Test Case 5: Addition with carry (7 + 1)
        a = 4'b0111; b = 4'b0001; c_in = 0;
        #10;
        if (sum !== 4'b1000 || cy !== 1) $display("FAIL: Test Case 5 Failed");

        // Test Case 6: Subtraction resulting in negative (1 - 2)
        a = 4'b0001; b = 4'b0010; c_in = 1;
        #10;
        if (sum !== 4'b1111 || cy !== 1) $display("FAIL: Test Case 6 Failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule