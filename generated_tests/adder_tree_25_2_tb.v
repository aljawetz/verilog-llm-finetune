`timescale 1ns/1ps

module tb_adder_tree_25;

    reg [25:0] a_in;
    reg [25:0] b_in;
    reg n33_tree_32;
    reg n32_tree_32;
    reg n38_tree_30;
    reg n39_tree_30;
    reg n114_tree_28;
    wire sum;

    // Instantiate the module under test (uut)
    adder_tree_25 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n33_tree_32(n33_tree_32),
        .n32_tree_32(n32_tree_32),
        .n38_tree_30(n38_tree_30),
        .n39_tree_30(n39_tree_30),
        .n114_tree_28(n114_tree_28),
        .sum(sum)
    );

    initial begin
        // Test case 1
        a_in = 26'b00000000000000000000000000; 
        b_in = 26'b00000000000000000000000000; 
        n33_tree_32 = 0; n32_tree_32 = 0; n38_tree_30 = 0; n39_tree_30 = 0; n114_tree_28 = 0;
        #10;
        if (sum !== 0) $display("FAIL: Test case 1 failed, expected sum=0, got sum=%b", sum);

        // Test case 2
        a_in = 26'b00000000000000000000000001; 
        b_in = 26'b00000000000000000000000001; 
        n33_tree_32 = 0; n32_tree_32 = 0; n38_tree_30 = 0; n39_tree_30 = 0; n114_tree_28 = 0;
        #10;
        if (sum !== 0) $display("FAIL: Test case 2 failed, expected sum=0, got sum=%b", sum);

        // Test case 3
        a_in = 26'b00000000000000000000000001; 
        b_in = 26'b00000000000000000000000000; 
        n33_tree_32 = 0; n32_tree_32 = 0; n38_tree_30 = 0; n39_tree_30 = 0; n114_tree_28 = 0;
        #10;
        if (sum !== 1) $display("FAIL: Test case 3 failed, expected sum=1, got sum=%b", sum);

        // Test case 4
        a_in = 26'b00000000000000000000000001; 
        b_in = 26'b00000000000000000000000001; 
        n33_tree_32 = 1; n32_tree_32 = 0; n38_tree_30 = 0; n39_tree_30 = 0; n114_tree_28 = 0;
        #10;
        if (sum !== 1) $display("FAIL: Test case 4 failed, expected sum=1, got sum=%b", sum);

        // Test case 5
        a_in = 26'b00000000000000000000000011; 
        b_in = 26'b00000000000000000000000011; 
        n33_tree_32 = 1; n32_tree_32 = 0; n38_tree_30 = 1; n39_tree_30 = 1; n114_tree_28 = 1;
        #10;
        if (sum !== 0) $display("FAIL: Test case 5 failed, expected sum=0, got sum=%b", sum);

        // Test case 6
        a_in = 26'b00000000000000000000000010; 
        b_in = 26'b00000000000000000000000001; 
        n33_tree_32 = 1; n32_tree_32 = 1; n38_tree_30 = 0; n39_tree_30 = 0; n114_tree_28 = 1;
        #10;
        if (sum !== 1) $display("FAIL: Test case 6 failed, expected sum=1, got sum=%b", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule