`timescale 1ns/1ps

module tb_design_1_mul;

    // Parameters
    parameter DataWidth = 32;

    // Inputs
    reg [DataWidth-1:0] a;
    reg [DataWidth-1:0] b;

    // Outputs
    wire [(2*DataWidth):0] c;

    // Instantiate the Unit Under Test (UUT)
    design_1_mul #(DataWidth) uut (
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        // Test case 1: 2 * 3 = 6
        a = 32'd2;
        b = 32'd3;
        #10;
        if (c !== 32'd6) begin
            $display("FAIL: Test case 1 failed, expected 6 but got %d", c);
            $finish;
        end

        // Test case 2: 10 * 5 = 50
        a = 32'd10;
        b = 32'd5;
        #10;
        if (c !== 32'd50) begin
            $display("FAIL: Test case 2 failed, expected 50 but got %d", c);
            $finish;
        end

        // Test case 3: 0 * 100 = 0
        a = 32'd0;
        b = 32'd100;
        #10;
        if (c !== 32'd0) begin
            $display("FAIL: Test case 3 failed, expected 0 but got %d", c);
            $finish;
        end

        // Test case 4: 100 * 100 = 10000
        a = 32'd100;
        b = 32'd100;
        #10;
        if (c !== 32'd10000) begin
            $display("FAIL: Test case 4 failed, expected 10000 but got %d", c);
            $finish;
        end

        // Test case 5: Max values multiplication
        a = 32'hFFFFFFFF; // Max value for 32-bit
        b = 32'hFFFFFFFF; // Max value for 32-bit
        #10;
        if (c !== 64'hFFFFFFFE00000001) begin
            $display("FAIL: Test case 5 failed, expected 64'hFFFFFFFE00000001 but got %h", c);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule