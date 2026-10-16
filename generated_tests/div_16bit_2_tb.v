`timescale 1ns/1ps

module tb_div_16bit;

    // Inputs
    reg [15:0] A;
    reg [7:0] B;

    // Outputs
    wire [15:0] result;
    wire [15:0] odd;

    // Instantiate the Unit Under Test (UUT)
    div_16bit uut (
        .A(A),
        .B(B),
        .result(result),
        .odd(odd)
    );

    initial begin
        // Test case 1: 16 / 4 = 4, remainder 0
        A = 16'd16; B = 8'd4;
        #10;
        if (result !== 16'd4 || odd !== 16'd0) begin
            $display("FAIL: Test case 1 failed (16 / 4)");
            $finish;
        end

        // Test case 2: 15 / 2 = 7, remainder 1
        A = 16'd15; B = 8'd2;
        #10;
        if (result !== 16'd7 || odd !== 16'd1) begin
            $display("FAIL: Test case 2 failed (15 / 2)");
            $finish;
        end

        // Test case 3: 100 / 3 = 33, remainder 1
        A = 16'd100; B = 8'd3;
        #10;
        if (result !== 16'd33 || odd !== 16'd1) begin
            $display("FAIL: Test case 3 failed (100 / 3)");
            $finish;
        end

        // Test case 4: 0 / 5 = 0, remainder 0
        A = 16'd0; B = 8'd5;
        #10;
        if (result !== 16'd0 || odd !== 16'd0) begin
            $display("FAIL: Test case 4 failed (0 / 5)");
            $finish;
        end

        // Test case 5: 50 / 0 = undefined, expect result and odd to be 0
        A = 16'd50; B = 8'd0;
        #10;
        if (result !== 16'd0 || odd !== 16'd0) begin
            $display("FAIL: Test case 5 failed (50 / 0)");
            $finish;
        end

        // Test case 6: 255 / 1 = 255, remainder 0
        A = 16'd255; B = 8'd1;
        #10;
        if (result !== 16'd255 || odd !== 16'd0) begin
            $display("FAIL: Test case 6 failed (255 / 1)");
            $finish;
        end

        // Test case 7: 1000 / 10 = 100, remainder 0
        A = 16'd1000; B = 8'd10;
        #10;
        if (result !== 16'd100 || odd !== 16'd0) begin
            $display("FAIL: Test case 7 failed (1000 / 10)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule