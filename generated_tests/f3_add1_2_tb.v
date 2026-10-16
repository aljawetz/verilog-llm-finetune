`timescale 1ns/1ps

module tb_f3_add1;

    reg [1:0] a;
    wire [1:0] c;

    // Instantiate the module under test (uut)
    f3_add1 uut (
        .a(a),
        .c(c)
    );

    initial begin
        // Test case 1: Input 0, expect output 1
        a = 2'b00; #10;
        if (c !== 2'b01) begin
            $display("FAIL: Test case 1 failed, expected 01, got %b", c);
            $finish;
        end

        // Test case 2: Input 1, expect output 2
        a = 2'b01; #10;
        if (c !== 2'b10) begin
            $display("FAIL: Test case 2 failed, expected 10, got %b", c);
            $finish;
        end

        // Test case 3: Input 2, expect output 0
        a = 2'b10; #10;
        if (c !== 2'b00) begin
            $display("FAIL: Test case 3 failed, expected 00, got %b", c);
            $finish;
        end

        // Test case 4: Input 0 again, expect output 1
        a = 2'b00; #10;
        if (c !== 2'b01) begin
            $display("FAIL: Test case 4 failed, expected 01, got %b", c);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule