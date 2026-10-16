`timescale 1ns/1ps

module tb_example_raw;

    reg [7:0] a;
    reg [7:0] b;
    reg [7:0] c;
    wire [7:0] s1;
    wire [7:0] s2;
    wire [7:0] s3;

    // Instantiate the module under test
    example_raw uut (
        .a(a),
        .b(b),
        .c(c),
        .s1(s1),
        .s2(s2),
        .s3(s3)
    );

    initial begin
        // Test case 1
        a = 8'd10; b = 8'd5; c = 8'd0;
        #10;
        if (s1 !== 8'd20) $display("FAIL: Test case 1, expected s1 = 20, got s1 = %d", s1);
        if (s2 !== 8'd50) $display("FAIL: Test case 1, expected s2 = 50, got s2 = %d", s2);
        if (s3 !== 8'd7) $display("FAIL: Test case 1, expected s3 = 7, got s3 = %d", s3);

        // Test case 2
        a = 8'd15; b = 8'd10; c = 8'd0;
        #10;
        if (s1 !== 8'd30) $display("FAIL: Test case 2, expected s1 = 30, got s1 = %d", s1);
        if (s2 !== 8'd150) $display("FAIL: Test case 2, expected s2 = 150, got s2 = %d", s2);
        if (s3 !== 8'd11) $display("FAIL: Test case 2, expected s3 = 11, got s3 = %d", s3);

        // Test case 3
        a = 8'd0; b = 8'd0; c = 8'd0;
        #10;
        if (s1 !== 8'd15) $display("FAIL: Test case 3, expected s1 = 15, got s1 = %d", s1);
        if (s2 !== 8'd0) $display("FAIL: Test case 3, expected s2 = 0, got s2 = %d", s2);
        if (s3 !== 8'd6) $display("FAIL: Test case 3, expected s3 = 6, got s3 = %d", s3);

        // Test case 4
        a = 8'd255; b = 8'd1; c = 8'd0;
        #10;
        if (s1 !== 8'd261) $display("FAIL: Test case 4, expected s1 = 261, got s1 = %d", s1);
        if (s2 !== 8'd255) $display("FAIL: Test case 4, expected s2 = 255, got s2 = %d", s2);
        if (s3 !== 8'd254) $display("FAIL: Test case 4, expected s3 = 254, got s3 = %d", s3);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule