`timescale 1ns/1ps

module tb_adder;

    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] sum;

    // Instantiate the adder module
    adder uut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        // Test case 1: 0 + 0 = 0
        a = 8'd0; b = 8'd0;
        #10;
        if (sum !== 8'd0) begin
            $display("FAIL: Test case 1 failed, expected sum = 0, got sum = %d", sum);
            $finish;
        end

        // Test case 2: 1 + 1 = 2
        a = 8'd1; b = 8'd1;
        #10;
        if (sum !== 8'd2) begin
            $display("FAIL: Test case 2 failed, expected sum = 2, got sum = %d", sum);
            $finish;
        end

        // Test case 3: 255 + 1 = 0 (overflow)
        a = 8'd255; b = 8'd1;
        #10;
        if (sum !== 8'd0) begin
            $display("FAIL: Test case 3 failed, expected sum = 0, got sum = %d", sum);
            $finish;
        end

        // Test case 4: 100 + 50 = 150
        a = 8'd100; b = 8'd50;
        #10;
        if (sum !== 8'd150) begin
            $display("FAIL: Test case 4 failed, expected sum = 150, got sum = %d", sum);
            $finish;
        end

        // Test case 5: 200 + 55 = 255
        a = 8'd200; b = 8'd55;
        #10;
        if (sum !== 8'd255) begin
            $display("FAIL: Test case 5 failed, expected sum = 255, got sum = %d", sum);
            $finish;
        end

        // Test case 6: 128 + 127 = 255
        a = 8'd128; b = 8'd127;
        #10;
        if (sum !== 8'd255) begin
            $display("FAIL: Test case 6 failed, expected sum = 255, got sum = %d", sum);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule