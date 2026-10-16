`timescale 1ns/1ps

module tb_mux_cont;

    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg [3:0] c;
    reg [3:0] d;
    reg s1;
    reg s2;

    // Outputs
    wire [3:0] y;

    // Instantiate the Unit Under Test (UUT)
    mux_cont uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .s1(s1),
        .s2(s2),
        .y(y)
    );

    initial begin
        // Test case 1: Select input a
        a = 4'b0001; b = 4'b0010; c = 4'b0011; d = 4'b0100; s1 = 0; s2 = 0;
        #10;
        if (y !== a) begin
            $display("FAIL: Test case 1 failed, expected %b, got %b", a, y);
            $finish;
        end

        // Test case 2: Select input b
        a = 4'b0001; b = 4'b0010; c = 4'b0011; d = 4'b0100; s1 = 1; s2 = 0;
        #10;
        if (y !== b) begin
            $display("FAIL: Test case 2 failed, expected %b, got %b", b, y);
            $finish;
        end

        // Test case 3: Select input c
        a = 4'b0001; b = 4'b0010; c = 4'b0011; d = 4'b0100; s1 = 0; s2 = 1;
        #10;
        if (y !== c) begin
            $display("FAIL: Test case 3 failed, expected %b, got %b", c, y);
            $finish;
        end

        // Test case 4: Select input d
        a = 4'b0001; b = 4'b0010; c = 4'b0011; d = 4'b0100; s1 = 1; s2 = 1;
        #10;
        if (y !== d) begin
            $display("FAIL: Test case 4 failed, expected %b, got %b", d, y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule