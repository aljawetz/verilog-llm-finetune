`timescale 1ns/1ps

module tb_example_raw;

    reg [7:0] a;
    reg [7:0] b;
    reg [7:0] c;
    reg [7:0] d;
    wire [7:0] s1;
    wire [7:0] s2;
    wire [7:0] s3;
    wire [7:0] s4;
    wire [7:0] s5;
    wire [7:0] s6;

    // Instantiate the module under test
    example_raw uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .s1(s1),
        .s2(s2),
        .s3(s3),
        .s4(s4),
        .s5(s5),
        .s6(s6)
    );

    initial begin
        // Test case 1
        a = 8'd10; b = 8'd5; c = 8'd3; d = 8'd2;
        #10;
        if (s1 !== 8'd15) $display("FAIL: Test case 1, s1 incorrect");
        if (s2 !== 8'd50) $display("FAIL: Test case 1, s2 incorrect");
        if (s3 !== 8'd3) $display("FAIL: Test case 1, s3 incorrect");
        if (s4 !== 8'd63) $display("FAIL: Test case 1, s4 incorrect");
        if (s5 !== 8'd5) $display("FAIL: Test case 1, s5 incorrect");
        if (s6 !== 8'd65) $display("FAIL: Test case 1, s6 incorrect");

        // Test case 2
        a = 8'd20; b = 8'd10; c = 8'd5; d = 8'd1;
        #10;
        if (s1 !== 8'd30) $display("FAIL: Test case 2, s1 incorrect");
        if (s2 !== 8'd200) $display("FAIL: Test case 2, s2 incorrect");
        if (s3 !== 8'd1) $display("FAIL: Test case 2, s3 incorrect");
        if (s4 !== 8'd105) $display("FAIL: Test case 2, s4 incorrect");
        if (s5 !== 8'd10) $display("FAIL: Test case 2, s5 incorrect");
        if (s6 !== 8'd201) $display("FAIL: Test case 2, s6 incorrect");

        // Test case 3
        a = 8'd0; b = 8'd0; c = 8'd0; d = 8'd0;
        #10;
        if (s1 !== 8'd0) $display("FAIL: Test case 3, s1 incorrect");
        if (s2 !== 8'd0) $display("FAIL: Test case 3, s2 incorrect");
        if (s3 !== 8'd0) $display("FAIL: Test case 3, s3 incorrect");
        if (s4 !== 8'd0) $display("FAIL: Test case 3, s4 incorrect");
        if (s5 !== 8'd0) $display("FAIL: Test case 3, s5 incorrect");
        if (s6 !== 8'd0) $display("FAIL: Test case 3, s6 incorrect");

        // If all assertions pass
        $display("PASS");
        $finish;
    end

endmodule