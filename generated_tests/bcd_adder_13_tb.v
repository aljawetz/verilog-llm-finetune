`timescale 1ns/1ps

module tb_bcd_adder;

    reg [3:0] a;
    reg [3:0] b;
    reg carry_in;
    wire [3:0] sum;
    wire carry_out;

    // Instantiate the Unit Under Test (UUT)
    bcd_adder uut (
        .a(a),
        .b(b),
        .carry_in(carry_in),
        .sum(sum),
        .carry_out(carry_out)
    );

    initial begin
        // Test case 1: 4 + 5 + 0 = 9
        a = 4'b0100; // 4
        b = 4'b0101; // 5
        carry_in = 1'b0;
        #10;
        if (sum !== 4'b1001 || carry_out !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 7 + 3 + 0 = 10 (needs correction)
        a = 4'b0111; // 7
        b = 4'b0011; // 3
        carry_in = 1'b0;
        #10;
        if (sum !== 4'b0000 || carry_out !== 1'b1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 9 + 1 + 0 = 10 (needs correction)
        a = 4'b1001; // 9
        b = 4'b0001; // 1
        carry_in = 1'b0;
        #10;
        if (sum !== 4'b0000 || carry_out !== 1'b1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: 5 + 4 + 1 = 10 (needs correction)
        a = 4'b0101; // 5
        b = 4'b0100; // 4
        carry_in = 1'b1;
        #10;
        if (sum !== 4'b0000 || carry_out !== 1'b1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: 2 + 2 + 0 = 4
        a = 4'b0010; // 2
        b = 4'b0010; // 2
        carry_in = 1'b0;
        #10;
        if (sum !== 4'b0100 || carry_out !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: 8 + 1 + 1 = 10 (needs correction)
        a = 4'b1000; // 8
        b = 4'b0001; // 1
        carry_in = 1'b1;
        #10;
        if (sum !== 4'b0000 || carry_out !== 1'b1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule