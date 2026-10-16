`timescale 1ns/1ps

module tb_get_cki;
    reg clk;
    reg [4:0] index;
    wire [31:0] cki_out;

    // Instantiate the module under test
    get_cki uut (
        .clk(clk),
        .index(index),
        .cki_out(cki_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Wait for the clock to stabilize
        #10;

        // Test all index values
        index = 5'b00000; #10; if (cki_out !== 32'h00070e15) $display("FAIL: Expected 0x00070e15 for index 0");
        index = 5'b00001; #10; if (cki_out !== 32'h1c232a31) $display("FAIL: Expected 0x1c232a31 for index 1");
        index = 5'b00010; #10; if (cki_out !== 32'h383f464d) $display("FAIL: Expected 0x383f464d for index 2");
        index = 5'b00011; #10; if (cki_out !== 32'h545b6269) $display("FAIL: Expected 0x545b6269 for index 3");
        index = 5'b00100; #10; if (cki_out !== 32'h70777e85) $display("FAIL: Expected 0x70777e85 for index 4");
        index = 5'b00101; #10; if (cki_out !== 32'h8c939aa1) $display("FAIL: Expected 0x8c939aa1 for index 5");
        index = 5'b00110; #10; if (cki_out !== 32'ha8afb6bd) $display("FAIL: Expected 0xa8afb6bd for index 6");
        index = 5'b00111; #10; if (cki_out !== 32'hc4cbd2d9) $display("FAIL: Expected 0xc4cbd2d9 for index 7");
        index = 5'b01000; #10; if (cki_out !== 32'he0e7eef5) $display("FAIL: Expected 0xe0e7eef5 for index 8");
        index = 5'b01001; #10; if (cki_out !== 32'hfc030a11) $display("FAIL: Expected 0xfc030a11 for index 9");
        index = 5'b01010; #10; if (cki_out !== 32'h181f262d) $display("FAIL: Expected 0x181f262d for index 10");
        index = 5'b01011; #10; if (cki_out !== 32'h343b4249) $display("FAIL: Expected 0x343b4249 for index 11");
        index = 5'b01100; #10; if (cki_out !== 32'h50575e65) $display("FAIL: Expected 0x50575e65 for index 12");
        index = 5'b01101; #10; if (cki_out !== 32'h6c737a81) $display("FAIL: Expected 0x6c737a81 for index 13");
        index = 5'b01110; #10; if (cki_out !== 32'h888f969d) $display("FAIL: Expected 0x888f969d for index 14");
        index = 5'b01111; #10; if (cki_out !== 32'ha4abb2b9) $display("FAIL: Expected 0xa4abb2b9 for index 15");
        index = 5'b10000; #10; if (cki_out !== 32'hc0c7ced5) $display("FAIL: Expected 0xc0c7ced5 for index 16");
        index = 5'b10001; #10; if (cki_out !== 32'hdce3eaf1) $display("FAIL: Expected 0xdce3eaf1 for index 17");
        index = 5'b10010; #10; if (cki_out !== 32'hf8ff060d) $display("FAIL: Expected 0xf8ff060d for index 18");
        index = 5'b10011; #10; if (cki_out !== 32'h141b2229) $display("FAIL: Expected 0x141b2229 for index 19");
        index = 5'b10100; #10; if (cki_out !== 32'h30373e45) $display("FAIL: Expected 0x30373e45 for index 20");
        index = 5'b10101; #10; if (cki_out !== 32'h4c535a61) $display("FAIL: Expected 0x4c535a61 for index 21");
        index = 5'b10110; #10; if (cki_out !== 32'h686f767d) $display("FAIL: Expected 0x686f767d for index 22");
        index = 5'b10111; #10; if (cki_out !== 32'h848b9299) $display("FAIL: Expected 0x848b9299 for index 23");
        index = 5'b11000; #10; if (cki_out !== 32'ha0a7aeb5) $display("FAIL: Expected 0xa0a7aeb5 for index 24");
        index = 5'b11001; #10; if (cki_out !== 32'hbcc3cad1) $display("FAIL: Expected 0xbcc3cad1 for index 25");
        index = 5'b11010; #10; if (cki_out !== 32'hd8dfe6ed) $display("FAIL: Expected 0xd8dfe6ed for index 26");
        index = 5'b11011; #10; if (cki_out !== 32'hf4fb0209) $display("FAIL: Expected 0xf4fb0209 for index 27");
        index = 5'b11100; #10; if (cki_out !== 32'h10171e25) $display("FAIL: Expected 0x10171e25 for index 28");
        index = 5'b11101; #10; if (cki_out !== 32'h2c333a41) $display("FAIL: Expected 0x2c333a41 for index 29");
        index = 5'b11110; #10; if (cki_out !== 32'h484f565d) $display("FAIL: Expected 0x484f565d for index 30");
        index = 5'b11111; #10; if (cki_out !== 32'h646b7279) $display("FAIL: Expected 0x646b7279 for index 31");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule