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
        a = 8'd10; b = 8'd5; c = 8'd2; d = 8'd3;
        #10;
        if (s1 !== 8'd15) $display("FAIL: Test case 1, s1 expected 15, got %d", s1);
        if (s2 !== 8'd50) $display("FAIL: Test case 1, s2 expected 50, got %d", s2);
        if (s3 !== 8'd8) $display("FAIL: Test case 1, s3 expected 8, got %d", s3);
        if (s4 !== 8'd63) $display("FAIL: Test case 1, s4 expected 63, got %d", s4);
        if (s5 !== 8'd5) $display("FAIL: Test case 1, s5 expected 5, got %d", s5);
        if (s6 !== 8'd65) $display("FAIL: Test case 1, s6 expected 65, got %d", s6);

        // Test case 2
        a = 8'd20; b = 8'd4; c = 8'd1; d = 8'd2;
        #10;
        if (s1 !== 8'd24) $display("FAIL: Test case 2, s1 expected 24, got %d", s1);
        if (s2 !== 8'd80) $display("FAIL: Test case 2, s2 expected 80, got %d", s2);
        if (s3 !== 8'd2) $display("FAIL: Test case 2, s3 expected 2, got %d", s3);
        if (s4 !== 8'd82) $display("FAIL: Test case 2, s4 expected 82, got %d", s4);
        if (s5 !== 8'd16) $display("FAIL: Test case 2, s5 expected 16, got %d", s5);
        if (s6 !== 8'd66) $display("FAIL: Test case 2, s6 expected 66, got %d", s6);

        // Test case 3
        a = 8'd255; b = 8'd1; c = 8'd0; d = 8'd0;
        #10;
        if (s1 !== 8'd0) $display("FAIL: Test case 3, s1 expected 0, got %d", s1);
        if (s2 !== 8'd255) $display("FAIL: Test case 3, s2 expected 255, got %d", s2);
        if (s3 !== 8'd0) $display("FAIL: Test case 3, s3 expected 0, got %d", s3);
        if (s4 !== 8'd255) $display("FAIL: Test case 3, s4 expected 255, got %d", s4);
        if (s5 !== 8'd254) $display("FAIL: Test case 3, s5 expected 254, got %d", s5);
        if (s6 !== 8'd0) $display("FAIL: Test case 3, s6 expected 0, got %d", s6);

        // If all tests passed
        $display("PASS");
        $finish;
    end

endmodule