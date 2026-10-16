`timescale 1ns/1ps

module tb_mul;
    reg signed [3:0] a;
    reg signed [3:0] b;
    wire signed [7:0] y;

    // Instantiate the module under test (uut)
    mul uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Test case 1: 3 * 2 = 6
        a = 4'd3; b = 4'd2; #10;
        if (y !== 8'd6) begin
            $display("FAIL: Expected 6, got %d", y);
            $finish;
        end

        // Test case 2: -3 * 2 = -6
        a = -4'd3; b = 4'd2; #10;
        if (y !== -8'd6) begin
            $display("FAIL: Expected -6, got %d", y);
            $finish;
        end

        // Test case 3: 3 * -2 = -6
        a = 4'd3; b = -4'd2; #10;
        if (y !== -8'd6) begin
            $display("FAIL: Expected -6, got %d", y);
            $finish;
        end

        // Test case 4: -3 * -2 = 6
        a = -4'd3; b = -4'd2; #10;
        if (y !== 8'd6) begin
            $display("FAIL: Expected 6, got %d", y);
            $finish;
        end

        // Test case 5: 4 * 8 = -32 (special case)
        a = 4'd4; b = 4'd8; #10;
        if (y !== -8'd32) begin
            $display("FAIL: Expected -32, got %d", y);
            $finish;
        end

        // Test case 6: 0 * 0 = 0
        a = 4'd0; b = 4'd0; #10;
        if (y !== 8'd0) begin
            $display("FAIL: Expected 0, got %d", y);
            $finish;
        end

        // Test case 7: 7 * 1 = 7
        a = 4'd7; b = 4'd1; #10;
        if (y !== 8'd7) begin
            $display("FAIL: Expected 7, got %d", y);
            $finish;
        end

        // Test case 8: -8 * 1 = -8
        a = -4'd8; b = 4'd1; #10;
        if (y !== -8'd8) begin
            $display("FAIL: Expected -8, got %d", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule