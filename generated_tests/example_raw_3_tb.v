`timescale 1ns/1ps

module tb_example_raw;

    reg [7:0] a;
    reg [7:0] b;
    reg [7:0] c;
    reg [7:0] d;
    wire [7:0] s1;

    // Instantiate the module under test (uut)
    example_raw uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .s1(s1)
    );

    initial begin
        // Test case 1
        a = 8'd5; b = 8'd3; c = 8'd2; d = 8'd1;
        #10;
        if (s1 !== 8'd28) begin
            $display("FAIL: Test case 1 failed, expected s1 = 28, got s1 = %d", s1);
            $finish;
        end

        // Test case 2
        a = 8'd0; b = 8'd0; c = 8'd0; d = 8'd0;
        #10;
        if (s1 !== 8'd23) begin
            $display("FAIL: Test case 2 failed, expected s1 = 23, got s1 = %d", s1);
            $finish;
        end

        // Test case 3
        a = 8'd255; b = 8'd1; c = 8'd2; d = 8'd3;
        #10;
        if (s1 !== 8'd278) begin
            $display("FAIL: Test case 3 failed, expected s1 = 278, got s1 = %d", s1);
            $finish;
        end

        // Test case 4
        a = 8'd100; b = 8'd50; c = 8'd25; d = 8'd10;
        #10;
        if (s1 !== 8'd123) begin
            $display("FAIL: Test case 4 failed, expected s1 = 123, got s1 = %d", s1);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule