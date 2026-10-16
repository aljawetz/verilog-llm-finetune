`timescale 1ns/1ps

module tb_comparator;

    reg [3:0] count;
    wire cnt_10s;
    wire cnt_15s;

    // Instantiate the module under test
    comparator uut (
        .count(count),
        .cnt_10s(cnt_10s),
        .cnt_15s(cnt_15s)
    );

    initial begin
        // Test sequence
        // Test case for count = 9
        count = 4'd9;
        #10;
        if (cnt_10s !== 1'b1) begin
            $display("FAIL: Expected cnt_10s to be high when count is 9");
            $finish;
        end
        if (cnt_15s !== 1'b0) begin
            $display("FAIL: Expected cnt_15s to be low when count is 9");
            $finish;
        end

        // Test case for count = 14
        count = 4'd14;
        #10;
        if (cnt_10s !== 1'b0) begin
            $display("FAIL: Expected cnt_10s to be low when count is 14");
            $finish;
        end
        if (cnt_15s !== 1'b1) begin
            $display("FAIL: Expected cnt_15s to be high when count is 14");
            $finish;
        end

        // Test case for count = 0
        count = 4'd0;
        #10;
        if (cnt_10s !== 1'b0) begin
            $display("FAIL: Expected cnt_10s to be low when count is 0");
            $finish;
        end
        if (cnt_15s !== 1'b0) begin
            $display("FAIL: Expected cnt_15s to be low when count is 0");
            $finish;
        end

        // Test case for count = 8
        count = 4'd8;
        #10;
        if (cnt_10s !== 1'b0) begin
            $display("FAIL: Expected cnt_10s to be low when count is 8");
            $finish;
        end
        if (cnt_15s !== 1'b0) begin
            $display("FAIL: Expected cnt_15s to be low when count is 8");
            $finish;
        end

        // Test case for count = 15
        count = 4'd15;
        #10;
        if (cnt_10s !== 1'b0) begin
            $display("FAIL: Expected cnt_10s to be low when count is 15");
            $finish;
        end
        if (cnt_15s !== 1'b0) begin
            $display("FAIL: Expected cnt_15s to be low when count is 15");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule