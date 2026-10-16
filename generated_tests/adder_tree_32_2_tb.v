`timescale 1ns/1ps

module tb_adder_tree_32;

    reg [32:0] a_in;
    reg [32:0] b_in;
    wire sum;
    wire n125_tree_32, n124_tree_32, n121_tree_32, n120_tree_32, n117_tree_32;
    wire n116_tree_32, n113_tree_32, n112_tree_32, n109_tree_32, n108_tree_32;
    wire n105_tree_32, n104_tree_32, n101_tree_32, n100_tree_32, n97_tree_32;
    wire n96_tree_32, n93_tree_32, n92_tree_32, n89_tree_32, n88_tree_32;
    wire n85_tree_32, n84_tree_32, n81_tree_32, n80_tree_32, n77_tree_32;
    wire n76_tree_32, n73_tree_32, n72_tree_32, n69_tree_32, n68_tree_32;
    wire n65_tree_32, n64_tree_32, n61_tree_32, n60_tree_32, n57_tree_32;
    wire n56_tree_32, n53_tree_32, n52_tree_32, n49_tree_32, n48_tree_32;
    wire n45_tree_32, n44_tree_32, n41_tree_32, n40_tree_32, n37_tree_32;
    wire n36_tree_32, n33_tree_32, n32_tree_32, n29_tree_32, n28_tree_32;
    wire n25_tree_32, n24_tree_32, n21_tree_32, n20_tree_32, n17_tree_32;
    wire n16_tree_32, n13_tree_32, n12_tree_32, n9_tree_32, n8_tree_32;
    wire n10_tree_32, n11_tree_32, n18_tree_32, n19_tree_32, n26_tree_32;
    wire n27_tree_32, n34_tree_32, n35_tree_32, n42_tree_32, n43_tree_32;
    wire n50_tree_32, n51_tree_32, n58_tree_32, n59_tree_32, n66_tree_32;
    wire n67_tree_32, n74_tree_32, n75_tree_32, n82_tree_32, n83_tree_32;
    wire n90_tree_32, n91_tree_32, n98_tree_32, n99_tree_32, n106_tree_32;
    wire n107_tree_32, n114_tree_32, n115_tree_32, n134_tree_32;

    adder_tree_32 uut (
        .a_in(a_in),
        .b_in(b_in),
        .sum(sum),
        .n125_tree_32(n125_tree_32),
        .n124_tree_32(n124_tree_32),
        .n121_tree_32(n121_tree_32),
        .n120_tree_32(n120_tree_32),
        .n117_tree_32(n117_tree_32),
        .n116_tree_32(n116_tree_32),
        .n113_tree_32(n113_tree_32),
        .n112_tree_32(n112_tree_32),
        .n109_tree_32(n109_tree_32),
        .n108_tree_32(n108_tree_32),
        .n105_tree_32(n105_tree_32),
        .n104_tree_32(n104_tree_32),
        .n101_tree_32(n101_tree_32),
        .n100_tree_32(n100_tree_32),
        .n97_tree_32(n97_tree_32),
        .n96_tree_32(n96_tree_32),
        .n93_tree_32(n93_tree_32),
        .n92_tree_32(n92_tree_32),
        .n89_tree_32(n89_tree_32),
        .n88_tree_32(n88_tree_32),
        .n85_tree_32(n85_tree_32),
        .n84_tree_32(n84_tree_32),
        .n81_tree_32(n81_tree_32),
        .n80_tree_32(n80_tree_32),
        .n77_tree_32(n77_tree_32),
        .n76_tree_32(n76_tree_32),
        .n73_tree_32(n73_tree_32),
        .n72_tree_32(n72_tree_32),
        .n69_tree_32(n69_tree_32),
        .n68_tree_32(n68_tree_32),
        .n65_tree_32(n65_tree_32),
        .n64_tree_32(n64_tree_32),
        .n61_tree_32(n61_tree_32),
        .n60_tree_32(n60_tree_32),
        .n57_tree_32(n57_tree_32),
        .n56_tree_32(n56_tree_32),
        .n53_tree_32(n53_tree_32),
        .n52_tree_32(n52_tree_32),
        .n49_tree_32(n49_tree_32),
        .n48_tree_32(n48_tree_32),
        .n45_tree_32(n45_tree_32),
        .n44_tree_32(n44_tree_32),
        .n41_tree_32(n41_tree_32),
        .n40_tree_32(n40_tree_32),
        .n37_tree_32(n37_tree_32),
        .n36_tree_32(n36_tree_32),
        .n33_tree_32(n33_tree_32),
        .n32_tree_32(n32_tree_32),
        .n29_tree_32(n29_tree_32),
        .n28_tree_32(n28_tree_32),
        .n25_tree_32(n25_tree_32),
        .n24_tree_32(n24_tree_32),
        .n21_tree_32(n21_tree_32),
        .n20_tree_32(n20_tree_32),
        .n17_tree_32(n17_tree_32),
        .n16_tree_32(n16_tree_32),
        .n13_tree_32(n13_tree_32),
        .n12_tree_32(n12_tree_32),
        .n9_tree_32(n9_tree_32),
        .n8_tree_32(n8_tree_32),
        .n10_tree_32(n10_tree_32),
        .n11_tree_32(n11_tree_32),
        .n18_tree_32(n18_tree_32),
        .n19_tree_32(n19_tree_32),
        .n26_tree_32(n26_tree_32),
        .n27_tree_32(n27_tree_32),
        .n34_tree_32(n34_tree_32),
        .n35_tree_32(n35_tree_32),
        .n42_tree_32(n42_tree_32),
        .n43_tree_32(n43_tree_32),
        .n50_tree_32(n50_tree_32),
        .n51_tree_32(n51_tree_32),
        .n58_tree_32(n58_tree_32),
        .n59_tree_32(n59_tree_32),
        .n66_tree_32(n66_tree_32),
        .n67_tree_32(n67_tree_32),
        .n74_tree_32(n74_tree_32),
        .n75_tree_32(n75_tree_32),
        .n82_tree_32(n82_tree_32),
        .n83_tree_32(n83_tree_32),
        .n90_tree_32(n90_tree_32),
        .n91_tree_32(n91_tree_32),
        .n98_tree_32(n98_tree_32),
        .n99_tree_32(n99_tree_32),
        .n106_tree_32(n106_tree_32),
        .n107_tree_32(n107_tree_32),
        .n114_tree_32(n114_tree_32),
        .n115_tree_32(n115_tree_32),
        .n134_tree_32(n134_tree_32)
    );

    initial begin
        // Test case 1: Adding two zero inputs
        a_in = 33'b0;
        b_in = 33'b0;
        #10;
        if (sum !== 1'b0) $display("FAIL: Test case 1 failed (sum should be 0)");

        // Test case 2: Adding two maximum inputs
        a_in = 33'b111111111111111111111111111111111;
        b_in = 33'b111111111111111111111111111111111;
        #10;
        if (sum !== 1'b1) $display("FAIL: Test case 2 failed (sum should be 1)");

        // Test case 3: Adding two random inputs
        a_in = 33'b101010101010101010101010101010101;
        b_in = 33'b010101010101010101010101010101010;
        #10;
        if (sum !== 1'b1) $display("FAIL: Test case 3 failed (sum should be 1)");

        // Test case 4: Adding a number and its complement
        a_in = 33'b110011001100110011001100110011001;
        b_in = 33'b001100110011001100110011001100110;
        #10;
        if (sum !== 1'b1) $display("FAIL: Test case 4 failed (sum should be 1)");

        // Test case 5: Adding two numbers with carry
        a_in = 33'b000000000000000000000000000000001;
        b_in = 33'b000000000000000000000000000000001;
        #10;
        if (sum !== 1'b0) $display("FAIL: Test case 5 failed (sum should be 0)");

        $display("PASS");
        $finish;
    end

endmodule