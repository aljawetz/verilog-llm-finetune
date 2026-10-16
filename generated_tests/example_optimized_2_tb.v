`timescale 1ns/1ps

module tb_example_optimized;

    // Inputs
    reg [7:0] a;
    reg [7:0] b;
    reg [7:0] c;
    reg [7:0] d;

    // Output
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
        // Test case 1: Simple addition without overflow
        a = 8'd10; b = 8'd20; c = 8'd30; d = 8'd40;
        #10;
        if (sum !== 10'd100) $display("FAIL: Test case 1 failed, expected 100 but got %d", sum);

        // Test case 2: Addition with overflow in first sum
        a = 8'd200; b = 8'd100; c = 8'd50; d = 8'd30;
        #10;
        if (sum !== 10'd380) $display("FAIL: Test case 2 failed, expected 380 but got %d", sum);

        // Test case 3: Addition with overflow in second sum
        a = 8'd255; b = 8'd1; c = 8'd255; d = 8'd1;
        #10;
        if (sum !== 10'd512) $display("FAIL: Test case 3 failed, expected 512 but got %d", sum);

        // Test case 4: All inputs zero
        a = 8'd0; b = 8'd0; c = 8'd0; d = 8'd0;
        #10;
        if (sum !== 10'd0) $display("FAIL: Test case 4 failed, expected 0 but got %d", sum);

        // Test case 5: Maximum values
        a = 8'd255; b = 8'd255; c = 8'd255; d = 8'd255;
        #10;
        if (sum !== 10'd1020) $display("FAIL: Test case 5 failed, expected 1020 but got %d", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule