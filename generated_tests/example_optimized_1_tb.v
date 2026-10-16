`timescale 1ns/1ps

module tb_example_optimized;

    // Inputs
    reg [7:0] a;
    reg [7:0] b;
    reg [7:0] c;
    reg [7:0] d;

    // Outputs
    wire [9:0] sum;

    // Instantiate the Unit Under Test (UUT)
    example_optimized uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sum(sum)
    );

    initial begin
        // Test case 1: Simple addition
        a = 8'd10; b = 8'd20; c = 8'd30; d = 8'd40;
        #10;
        if (sum !== 10'd100) begin
            $display("FAIL: Test case 1 failed, expected sum = 100, got sum = %d", sum);
            $finish;
        end

        // Test case 2: Overflow case
        a = 8'd255; b = 8'd1; c = 8'd0; d = 8'd0;
        #10;
        if (sum !== 10'd256) begin
            $display("FAIL: Test case 2 failed, expected sum = 256, got sum = %d", sum);
            $finish;
        end

        // Test case 3: All zeros
        a = 8'd0; b = 8'd0; c = 8'd0; d = 8'd0;
        #10;
        if (sum !== 10'd0) begin
            $display("FAIL: Test case 3 failed, expected sum = 0, got sum = %d", sum);
            $finish;
        end

        // Test case 4: Maximum values
        a = 8'd255; b = 8'd255; c = 8'd255; d = 8'd255;
        #10;
        if (sum !== 10'd1020) begin
            $display("FAIL: Test case 4 failed, expected sum = 1020, got sum = %d", sum);
            $finish;
        end

        // Test case 5: Random values
        a = 8'd123; b = 8'd234; c = 8'd45; d = 8'd67;
        #10;
        if (sum !== 10'd469) begin
            $display("FAIL: Test case 5 failed, expected sum = 469, got sum = %d", sum);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule