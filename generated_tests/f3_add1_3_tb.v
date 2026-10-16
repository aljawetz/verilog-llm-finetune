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
        // Test case 1: Input 0
        a = 2'b00; #10;
        if (c !== 2'b01) begin
            $display("FAIL: Test case 1 failed for input 0, expected 01 but got %b", c);
            $finish;
        end

        // Test case 2: Input 1
        a = 2'b01; #10;
        if (c !== 2'b10) begin
            $display("FAIL: Test case 2 failed for input 1, expected 10 but got %b", c);
            $finish;
        end

        // Test case 3: Input 2
        a = 2'b10; #10;
        if (c !== 2'b00) begin
            $display("FAIL: Test case 3 failed for input 2, expected 00 but got %b", c);
            $finish;
        end

        // Test case 4: Input 0 again to check wrap around
        a = 2'b00; #10;
        if (c !== 2'b01) begin
            $display("FAIL: Test case 4 failed for input 0 again, expected 01 but got %b", c);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule