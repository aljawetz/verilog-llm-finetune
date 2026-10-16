`timescale 1ns/1ps

module tb_adder_4bit;

    reg [3:0] augend;
    reg [3:0] addend;
    reg carryin;
    wire cout;
    wire [3:0] sum;

    // Instantiate the adder_4bit module
    adder_4bit uut (
        .augend(augend),
        .addend(addend),
        .carryin(carryin),
        .cout(cout),
        .sum(sum)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0, cout = 0
        augend = 4'b0000; addend = 4'b0000; carryin = 1'b0;
        #10;
        if (sum !== 4'b0000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 + 1 + 0 = 10, cout = 1
        augend = 4'b0001; addend = 4'b0001; carryin = 1'b0;
        #10;
        if (sum !== 4'b0010 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 3 + 3 + 0 = 6, cout = 0
        augend = 4'b0011; addend = 4'b0011; carryin = 1'b0;
        #10;
        if (sum !== 4'b0110 || cout !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: 7 + 1 + 0 = 8, cout = 0
        augend = 4'b0111; addend = 4'b0001; carryin = 1'b0;
        #10;
        if (sum !== 4'b1000 || cout !== 1'b0) $display("FAIL: Test case 4 failed");

        // Test case 5: 8 + 7 + 0 = 15, cout = 0
        augend = 4'b1000; addend = 4'b0111; carryin = 1'b0;
        #10;
        if (sum !== 4'b1111 || cout !== 1'b0) $display("FAIL: Test case 5 failed");

        // Test case 6: 8 + 8 + 0 = 0, cout = 1 (overflow)
        augend = 4'b1000; addend = 4'b1000; carryin = 1'b0;
        #10;
        if (sum !== 4'b0000 || cout !== 1'b1) $display("FAIL: Test case 6 failed");

        // Test case 7: 15 + 1 + 0 = 0, cout = 1 (overflow)
        augend = 4'b1111; addend = 4'b0001; carryin = 1'b0;
        #10;
        if (sum !== 4'b0000 || cout !== 1'b1) $display("FAIL: Test case 7 failed");

        // Test case 8: 0 + 0 + 1 = 1, cout = 0
        augend = 4'b0000; addend = 4'b0000; carryin = 1'b1;
        #10;
        if (sum !== 4'b0001 || cout !== 1'b0) $display("FAIL: Test case 8 failed");

        // Test case 9: 1 + 1 + 1 = 11, cout = 1
        augend = 4'b0001; addend = 4'b0001; carryin = 1'b1;
        #10;
        if (sum !== 4'b0011 || cout !== 1'b0) $display("FAIL: Test case 9 failed");

        // Test case 10: 7 + 1 + 1 = 9, cout = 0
        augend = 4'b0111; addend = 4'b0001; carryin = 1'b1;
        #10;
        if (sum !== 4'b1001 || cout !== 1'b0) $display("FAIL: Test case 10 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule