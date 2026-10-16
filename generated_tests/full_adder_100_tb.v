`timescale 1ns/1ps

module tb_full_adder;

    reg rst;
    reg a, b, cin;
    wire sum, cout;

    // Instantiate the full adder
    full_adder uut (
        .rst(rst),
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Initialize reset
        rst = 1;
        a = 0;
        b = 0;
        cin = 0;
        #10;

        // Release reset
        rst = 0;

        // Test case 1: 0 + 0 + 0 = 0, cout = 0
        a = 0; b = 0; cin = 0;
        #10;
        if (sum !== 0 || cout !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 0 + 0 + 1 = 1, cout = 0
        a = 0; b = 0; cin = 1;
        #10;
        if (sum !== 1 || cout !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 0 + 1 + 0 = 1, cout = 0
        a = 0; b = 1; cin = 0;
        #10;
        if (sum !== 1 || cout !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: 1 + 0 + 0 = 1, cout = 0
        a = 1; b = 0; cin = 0;
        #10;
        if (sum !== 1 || cout !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: 1 + 1 + 0 = 0, cout = 1
        a = 1; b = 1; cin = 0;
        #10;
        if (sum !== 0 || cout !== 1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: 1 + 1 + 1 = 1, cout = 1
        a = 1; b = 1; cin = 1;
        #10;
        if (sum !== 1 || cout !== 1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: Reset functionality
        rst = 1;
        #10;
        if (sum !== 0 || cout !== 0) begin
            $display("FAIL: Reset functionality failed");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule