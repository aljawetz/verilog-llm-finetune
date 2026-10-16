`timescale 1ns/1ps

module tb_comparator;

    // Inputs
    reg [6:0] count;

    // Outputs
    wire cnt_500;
    wire cnt_1000;

    // Instantiate the Unit Under Test (UUT)
    comparator uut (
        .count(count),
        .cnt_500(cnt_500),
        .cnt_1000(cnt_1000)
    );

    initial begin
        // Test case 1: count = 49
        count = 49;
        #10;
        if (cnt_500 !== 1'b1 || cnt_1000 !== 1'b0) begin
            $display("FAIL: Test case 1 failed for count = 49");
            $finish;
        end

        // Test case 2: count = 99
        count = 99;
        #10;
        if (cnt_500 !== 1'b0 || cnt_1000 !== 1'b1) begin
            $display("FAIL: Test case 2 failed for count = 99");
            $finish;
        end

        // Test case 3: count = 48 (should not trigger either)
        count = 48;
        #10;
        if (cnt_500 !== 1'b0 || cnt_1000 !== 1'b0) begin
            $display("FAIL: Test case 3 failed for count = 48");
            $finish;
        end

        // Test case 4: count = 100 (should not trigger either)
        count = 100;
        #10;
        if (cnt_500 !== 1'b0 || cnt_1000 !== 1'b0) begin
            $display("FAIL: Test case 4 failed for count = 100");
            $finish;
        end

        // Test case 5: count = 0 (should not trigger either)
        count = 0;
        #10;
        if (cnt_500 !== 1'b0 || cnt_1000 !== 1'b0) begin
            $display("FAIL: Test case 5 failed for count = 0");
            $finish;
        end

        // Test case 6: count = 50 (should not trigger either)
        count = 50;
        #10;
        if (cnt_500 !== 1'b0 || cnt_1000 !== 1'b0) begin
            $display("FAIL: Test case 6 failed for count = 50");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule