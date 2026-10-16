`timescale 1ns/1ps

module tb_comparator4;

    reg [3:0] a;
    reg [3:0] b;
    wire alb;
    wire aeb;
    wire agb;

    // Instantiate the module under test (uut)
    comparator4 uut (
        .a(a),
        .b(b),
        .alb(alb),
        .aeb(aeb),
        .agb(agb)
    );

    initial begin
        // Test case 1: a < b
        a = 4'b0010; // 2
        b = 4'b0100; // 4
        #10;
        if (alb !== 1 || aeb !== 0 || agb !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: a > b
        a = 4'b0110; // 6
        b = 4'b0011; // 3
        #10;
        if (alb !== 0 || aeb !== 0 || agb !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: a == b
        a = 4'b0101; // 5
        b = 4'b0101; // 5
        #10;
        if (alb !== 0 || aeb !== 1 || agb !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: a < b (edge case)
        a = 4'b0000; // 0
        b = 4'b0001; // 1
        #10;
        if (alb !== 1 || aeb !== 0 || agb !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: a > b (edge case)
        a = 4'b1111; // 15
        b = 4'b0000; // 0
        #10;
        if (alb !== 0 || aeb !== 0 || agb !== 1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: a == b (edge case)
        a = 4'b0000; // 0
        b = 4'b0000; // 0
        #10;
        if (alb !== 0 || aeb !== 1 || agb !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule