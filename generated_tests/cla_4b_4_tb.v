`timescale 1ns/1ps

module tb_cla_4b;

    reg [3:0] a;
    reg [3:0] b;
    reg c0;
    wire [3:0] sum;
    wire c_out;

    // Instantiate the Unit Under Test (UUT)
    cla_4b uut (
        .a(a),
        .b(b),
        .c0(c0),
        .sum(sum),
        .c_out(c_out)
    );

    initial begin
        // Test case 1: 0 + 0 + 0
        a = 4'b0000; b = 4'b0000; c0 = 1'b0;
        #10;
        if (sum !== 4'b0000 || c_out !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 + 1 + 0
        a = 4'b0001; b = 4'b0001; c0 = 1'b0;
        #10;
        if (sum !== 4'b0010 || c_out !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 3 + 3 + 0
        a = 4'b0011; b = 4'b0011; c0 = 1'b0;
        #10;
        if (sum !== 4'b0110 || c_out !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: 7 + 8 + 0
        a = 4'b0111; b = 4'b1000; c0 = 1'b0;
        #10;
        if (sum !== 4'b1111 || c_out !== 1'b0) $display("FAIL: Test case 4 failed");

        // Test case 5: 15 + 1 + 0 (overflow)
        a = 4'b1111; b = 4'b0001; c0 = 1'b0;
        #10;
        if (sum !== 4'b0000 || c_out !== 1'b1) $display("FAIL: Test case 5 failed");

        // Test case 6: 1 + 1 + 1 (with carry in)
        a = 4'b0001; b = 4'b0001; c0 = 1'b1;
        #10;
        if (sum !== 4'b0011 || c_out !== 1'b0) $display("FAIL: Test case 6 failed");

        // Test case 7: 2 + 2 + 1
        a = 4'b0010; b = 4'b0010; c0 = 1'b1;
        #10;
        if (sum !== 4'b0101 || c_out !== 1'b0) $display("FAIL: Test case 7 failed");

        // Test case 8: 5 + 5 + 1
        a = 4'b0101; b = 4'b0101; c0 = 1'b1;
        #10;
        if (sum !== 4'b1011 || c_out !== 1'b0) $display("FAIL: Test case 8 failed");

        // Test case 9: 8 + 8 + 1
        a = 4'b1000; b = 4'b1000; c0 = 1'b1;
        #10;
        if (sum !== 4'b0001 || c_out !== 1'b1) $display("FAIL: Test case 9 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule