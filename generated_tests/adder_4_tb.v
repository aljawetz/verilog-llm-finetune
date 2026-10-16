`timescale 1ns/1ps

module tb_adder;

    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] c;

    // Instantiate the adder module
    adder uut (
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        // Test case 1: Simple addition
        a = 32'h00000001; // 1
        b = 32'h00000001; // 1
        #10;
        if (c !== 32'h00000002) begin
            $display("FAIL: Test case 1 failed, expected 2 but got %h", c);
            $finish;
        end

        // Test case 2: Adding zero
        a = 32'h00000000; // 0
        b = 32'h00000005; // 5
        #10;
        if (c !== 32'h00000005) begin
            $display("FAIL: Test case 2 failed, expected 5 but got %h", c);
            $finish;
        end

        // Test case 3: Maximum values
        a = 32'hFFFFFFFF; // Max value
        b = 32'h00000001; // 1
        #10;
        if (c !== 32'h00000000) begin // Overflow case
            $display("FAIL: Test case 3 failed, expected 0 but got %h", c);
            $finish;
        end

        // Test case 4: Negative values (using two's complement)
        a = 32'hFFFFFFFE; // -2
        b = 32'hFFFFFFFD; // -3
        #10;
        if (c !== 32'hFFFFFFFB) begin
            $display("FAIL: Test case 4 failed, expected -5 but got %h", c);
            $finish;
        end

        // Test case 5: Random values
        a = 32'h12345678; // 305419896
        b = 32'h87654321; // 2271560481
        #10;
        if (c !== 32'h99999999) begin
            $display("FAIL: Test case 5 failed, expected 99999999 but got %h", c);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule