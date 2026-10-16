`timescale 1ns/1ps

module tb_example_raw;

    // Parameters
    parameter BW = 8;

    // Inputs
    reg [BW-1:0] a;
    reg [BW-1:0] b;
    reg [BW-1:0] c;
    reg [BW-1:0] d;

    // Outputs
    wire [BW-1:0] s1;

    // Instantiate the Unit Under Test (UUT)
    example_raw #(.BW(BW)) uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .s1(s1)
    );

    initial begin
        // Test case 1
        a = 8'd0; b = 8'd0; c = 8'd0; d = 8'd0;
        #10;
        if (s1 !== 8'd23) begin
            $display("FAIL: Test case 1 failed, expected s1 = 23, got s1 = %d", s1);
            $finish;
        end

        // Test case 2
        a = 8'd5; b = 8'd0; c = 8'd0; d = 8'd0;
        #10;
        if (s1 !== 8'd28) begin
            $display("FAIL: Test case 2 failed, expected s1 = 28, got s1 = %d", s1);
            $finish;
        end

        // Test case 3
        a = 8'd10; b = 8'd5; c = 8'd3; d = 8'd2;
        #10;
        if (s1 !== 8'd33) begin
            $display("FAIL: Test case 3 failed, expected s1 = 33, got s1 = %d", s1);
            $finish;
        end

        // Test case 4
        a = 8'd255; b = 8'd1; c = 8'd1; d = 8'd1;
        #10;
        if (s1 !== 8'd278) begin
            $display("FAIL: Test case 4 failed, expected s1 = 278, got s1 = %d", s1);
            $finish;
        end

        // Test case 5
        a = 8'd100; b = 8'd50; c = 8'd25; d = 8'd10;
        #10;
        if (s1 !== 8'd123) begin
            $display("FAIL: Test case 5 failed, expected s1 = 123, got s1 = %d", s1);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule