`timescale 1ns/1ps

module tb_full_adder;
    reg a;
    reg b;
    reg cin;
    wire sum;
    wire cout;

    // Instantiate the full adder module
    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Test case 1: 0 + 0 + 0
        a = 0; b = 0; cin = 0;
        #10;
        if (sum !== 0 || cout !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 0 + 0 + 1
        a = 0; b = 0; cin = 1;
        #10;
        if (sum !== 1 || cout !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 0 + 1 + 0
        a = 0; b = 1; cin = 0;
        #10;
        if (sum !== 1 || cout !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: 0 + 1 + 1
        a = 0; b = 1; cin = 1;
        #10;
        if (sum !== 0 || cout !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: 1 + 0 + 0
        a = 1; b = 0; cin = 0;
        #10;
        if (sum !== 1 || cout !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: 1 + 0 + 1
        a = 1; b = 0; cin = 1;
        #10;
        if (sum !== 0 || cout !== 1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: 1 + 1 + 0
        a = 1; b = 1; cin = 0;
        #10;
        if (sum !== 0 || cout !== 1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: 1 + 1 + 1
        a = 1; b = 1; cin = 1;
        #10;
        if (sum !== 1 || cout !== 1) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule