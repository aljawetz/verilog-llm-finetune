`timescale 1ns/1ps

module tb_design_1_muladd;

    reg [31:0] a;
    reg [31:0] b;
    reg [31:0] c;
    wire [63:0] d;

    // Instantiate the module under test (uut)
    design_1_muladd uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d)
    );

    initial begin
        // Test case 1: Simple multiplication and addition
        a = 2; b = 3; c = 4; #10;
        if (d !== (a + b) * c) begin
            $display("FAIL: Test case 1 failed. Expected %d, got %d", (a + b) * c, d);
            $finish;
        end

        // Test case 2: Zero case
        a = 0; b = 0; c = 0; #10;
        if (d !== (a + b) * c) begin
            $display("FAIL: Test case 2 failed. Expected %d, got %d", (a + b) * c, d);
            $finish;
        end

        // Test case 3: Negative values (using 32-bit signed representation)
        a = 32'hFFFFFFFF; b = 32'hFFFFFFFE; c = 32'h00000002; #10; // -1 + -2 = -3, -3 * 2 = -6
        if (d !== (a + b) * c) begin
            $display("FAIL: Test case 3 failed. Expected %d, got %d", (a + b) * c, d);
            $finish;
        end

        // Test case 4: Large values
        a = 32'h7FFFFFFF; b = 32'h7FFFFFFF; c = 32'h00000002; #10; // (2147483647 + 2147483647) * 2
        if (d !== (a + b) * c) begin
            $display("FAIL: Test case 4 failed. Expected %d, got %d", (a + b) * c, d);
            $finish;
        end

        // Test case 5: Random values
        a = 10; b = 20; c = 30; #10;
        if (d !== (a + b) * c) begin
            $display("FAIL: Test case 5 failed. Expected %d, got %d", (a + b) * c, d);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule