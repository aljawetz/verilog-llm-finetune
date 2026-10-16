`timescale 1ns/1ps

module tb_Interpolate2;

    // Parameters
    reg [4:0] o_index;
    reg [3:0] i_index;
    reg [3:0] size;
    reg [7:0] A;
    reg [7:0] B;
    wire [7:0] out;

    // Instantiate the Unit Under Test (UUT)
    Interpolate2 uut (
        .o_index(o_index),
        .i_index(i_index),
        .size(size),
        .A(A),
        .B(B),
        .out(out)
    );

    initial begin
        // Test case 1
        o_index = 5'd0; i_index = 4'd0; size = 4'd1; A = 8'd10; B = 8'd20;
        #10;
        if (out !== 8'd10) $display("FAIL: Test case 1 failed, expected 10, got %d", out);

        // Test case 2
        o_index = 5'd0; i_index = 4'd1; size = 4'd2; A = 8'd10; B = 8'd20;
        #10;
        if (out !== 8'd15) $display("FAIL: Test case 2 failed, expected 15, got %d", out);

        // Test case 3
        o_index = 5'd1; i_index = 4'd1; size = 4'd2; A = 8'd10; B = 8'd20;
        #10;
        if (out !== 8'd17) $display("FAIL: Test case 3 failed, expected 17, got %d", out);

        // Test case 4
        o_index = 5'd2; i_index = 4'd2; size = 4'd4; A = 8'd0; B = 8'd16;
        #10;
        if (out !== 8'd8) $display("FAIL: Test case 4 failed, expected 8, got %d", out);

        // Test case 5
        o_index = 5'd4; i_index = 4'd3; size = 4'd4; A = 8'd100; B = 8'd200;
        #10;
        if (out !== 8'd150) $display("FAIL: Test case 5 failed, expected 150, got %d", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule