`timescale 1ns/1ps

module tb_carry_skip_adder;
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;
    wire carry_out;

    // Instantiate the carry_skip_adder module
    carry_skip_adder #(4) uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry_out(carry_out)
    );

    initial begin
        // Test case 1: 0 + 0
        a = 4'b0000; b = 4'b0000; #10;
        if (sum !== 4'b0000 || carry_out !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 + 1
        a = 4'b0001; b = 4'b0001; #10;
        if (sum !== 4'b0010 || carry_out !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 3 + 2
        a = 4'b0011; b = 4'b0010; #10;
        if (sum !== 4'b0101 || carry_out !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: 7 + 1
        a = 4'b0111; b = 4'b0001; #10;
        if (sum !== 4'b1000 || carry_out !== 1'b0) $display("FAIL: Test case 4 failed");

        // Test case 5: 8 + 7
        a = 4'b1000; b = 4'b0111; #10;
        if (sum !== 4'b1111 || carry_out !== 1'b1) $display("FAIL: Test case 5 failed");

        // Test case 6: 15 + 1
        a = 4'b1111; b = 4'b0001; #10;
        if (sum !== 4'b0000 || carry_out !== 1'b1) $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule