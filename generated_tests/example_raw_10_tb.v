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
        if (s1 !== (10 + 5 + 15)) $display("FAIL: Test case 1, s1 mismatch");
        if (s2 !== (10 * 5)) $display("FAIL: Test case 1, s2 mismatch");
        if (s3 !== (10 - 5 + 6)) $display("FAIL: Test case 1, s3 mismatch");

        // Test case 2
        a = 8'd20; b = 8'd10; c = 8'd0; 
        #10;
        if (s1 !== (20 + 10 + 15)) $display("FAIL: Test case 2, s1 mismatch");
        if (s2 !== (20 * 10)) $display("FAIL: Test case 2, s2 mismatch");
        if (s3 !== (20 - 10 + 6)) $display("FAIL: Test case 2, s3 mismatch");

        // Test case 3
        a = 8'd255; b = 8'd1; c = 8'd0; 
        #10;
        if (s1 !== (255 + 1 + 15)) $display("FAIL: Test case 3, s1 mismatch");
        if (s2 !== (255 * 1)) $display("FAIL: Test case 3, s2 mismatch");
        if (s3 !== (255 - 1 + 6)) $display("FAIL: Test case 3, s3 mismatch");

        // Test case 4
        a = 8'd0; b = 8'd0; c = 8'd0; 
        #10;
        if (s1 !== (0 + 0 + 15)) $display("FAIL: Test case 4, s1 mismatch");
        if (s2 !== (0 * 0)) $display("FAIL: Test case 4, s2 mismatch");
        if (s3 !== (0 - 0 + 6)) $display("FAIL: Test case 4, s3 mismatch");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule