`timescale 1ns/1ps

module tb_example_raw;

    reg [7:0] a;
    reg [7:0] b;
    reg [7:0] c;
    wire [7:0] s1;
    wire [7:0] s2;
    wire [7:0] s3;

    // Instantiate the module under test (uut)
    example_raw uut (
        .a(a),
        .b(b),
        .c(c),
        .s1(s1),
        .s2(s2),
        .s3(s3)
    );

    initial begin
        // Test sequence
        // Test case 1
        a = 8'd1; b = 8'd1; c = 8'd1;
        #10;
        if (s1 !== 8'd4) $display("FAIL: Test case 1, expected s1=4, got s1=%d", s1);
        if (s2 !== 8'd5) $display("FAIL: Test case 1, expected s2=5, got s2=%d", s2);
        if (s3 !== 8'd9) $display("FAIL: Test case 1, expected s3=9, got s3=%d", s3);

        // Test case 2
        a = 8'd2; b = 8'd2; c = 8'd2;
        #10;
        if (s1 !== 8'd8) $display("FAIL: Test case 2, expected s1=8, got s1=%d", s1);
        if (s2 !== 8'd10) $display("FAIL: Test case 2, expected s2=10, got s2=%d", s2);
        if (s3 !== 8'd18) $display("FAIL: Test case 2, expected s3=18, got s3=%d", s3);

        // Test case 3
        a = 8'd10; b = 8'd20; c = 8'd30;
        #10;
        if (s1 !== 8'd40) $display("FAIL: Test case 3, expected s1=40, got s1=%d", s1);
        if (s2 !== 8'd100) $display("FAIL: Test case 3, expected s2=100, got s2=%d", s2);
        if (s3 !== 8'd270) $display("FAIL: Test case 3, expected s3=270, got s3=%d", s3);

        // Test case 4
        a = 8'd255; b = 8'd255; c = 8'd255;
        #10;
        if (s1 !== 8'd4) $display("FAIL: Test case 4, expected s1=4, got s1=%d", s1);
        if (s2 !== 8'd5) $display("FAIL: Test case 4, expected s2=5, got s2=%d", s2);
        if (s3 !== 8'd9) $display("FAIL: Test case 4, expected s3=9, got s3=%d", s3);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule