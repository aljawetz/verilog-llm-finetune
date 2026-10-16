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
        // Test case 1
        a = 8'd10; b = 8'd5; c = 8'd0;
        #10;
        if (s1 !== 8'd28) $display("FAIL: Test case 1, expected s1 = 28, got %d", s1);
        if (s2 !== 8'd50) $display("FAIL: Test case 1, expected s2 = 50, got %d", s2);
        if (s3 !== 8'd7) $display("FAIL: Test case 1, expected s3 = 7, got %d", s3);

        // Test case 2
        a = 8'd15; b = 8'd3; c = 8'd2;
        #10;
        if (s1 !== 8'd28) $display("FAIL: Test case 2, expected s1 = 28, got %d", s1);
        if (s2 !== 8'd45) $display("FAIL: Test case 2, expected s2 = 45, got %d", s2);
        if (s3 !== 8'd14) $display("FAIL: Test case 2, expected s3 = 14, got %d", s3);

        // Test case 3
        a = 8'd0; b = 8'd0; c = 8'd0;
        #10;
        if (s1 !== 8'd15) $display("FAIL: Test case 3, expected s1 = 15, got %d", s1);
        if (s2 !== 8'd0) $display("FAIL: Test case 3, expected s2 = 0, got %d", s2);
        if (s3 !== 8'd6) $display("FAIL: Test case 3, expected s3 = 6, got %d", s3);

        // Test case 4
        a = 8'd255; b = 8'd255; c = 8'd255;
        #10;
        if (s1 !== 8'd268) $display("FAIL: Test case 4, expected s1 = 268, got %d", s1);
        if (s2 !== 8'd0) $display("FAIL: Test case 4, expected s2 = 0, got %d", s2);
        if (s3 !== 8'd1) $display("FAIL: Test case 4, expected s3 = 1, got %d", s3);

        $display("PASS");
        $finish;
    end

endmodule