`timescale 1ns/1ps

module tb_mux_cont;

    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg [3:0] c;
    reg [3:0] d;
    reg s1;
    reg s2;

    // Output
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
        // Initialize inputs
        a = 4'b0000; b = 4'b0001; c = 4'b0010; d = 4'b0011;
        s1 = 0; s2 = 0;

        // Test case 1: s2 = 0, s1 = 0 -> y should be a
        #10;
        if (y !== a) begin
            $display("FAIL: Test case 1 failed, expected %b, got %b", a, y);
            $finish;
        end

        // Test case 2: s2 = 0, s1 = 1 -> y should be b
        s1 = 1;
        #10;
        if (y !== b) begin
            $display("FAIL: Test case 2 failed, expected %b, got %b", b, y);
            $finish;
        end

        // Test case 3: s2 = 1, s1 = 0 -> y should be c
        s2 = 1; s1 = 0;
        #10;
        if (y !== c) begin
            $display("FAIL: Test case 3 failed, expected %b, got %b", c, y);
            $finish;
        end

        // Test case 4: s2 = 1, s1 = 1 -> y should be d
        s1 = 1;
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