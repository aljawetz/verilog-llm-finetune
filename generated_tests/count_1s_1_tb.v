`timescale 1ns/1ps

module tb_count_1s;

    reg [7:0] d_in;
    wire [3:0] count;

    // Instantiate the module under test
    count_1s uut (
        .d_in(d_in),
        .count(count)
    );

    initial begin
        // Test case 1: All zeros
        d_in = 8'b00000000;
        #10;
        if (count !== 4'b0000) begin
            $display("FAIL: Test case 1 failed, expected count 0, got %b", count);
            $finish;
        end

        // Test case 2: One '1'
        d_in = 8'b00000001;
        #10;
        if (count !== 4'b0001) begin
            $display("FAIL: Test case 2 failed, expected count 1, got %b", count);
            $finish;
        end

        // Test case 3: Three '1's
        d_in = 8'b00000111;
        #10;
        if (count !== 4'b0011) begin
            $display("FAIL: Test case 3 failed, expected count 3, got %b", count);
            $finish;
        end

        // Test case 4: Four '1's
        d_in = 8'b11110000;
        #10;
        if (count !== 4'b0100) begin
            $display("FAIL: Test case 4 failed, expected count 4, got %b", count);
            $finish;
        end

        // Test case 5: All ones
        d_in = 8'b11111111;
        #10;
        if (count !== 4'b1000) begin
            $display("FAIL: Test case 5 failed, expected count 8, got %b", count);
            $finish;
        end

        // Test case 6: Alternating bits
        d_in = 8'b10101010;
        #10;
        if (count !== 4'b0100) begin
            $display("FAIL: Test case 6 failed, expected count 4, got %b", count);
            $finish;
        end

        // Test case 7: Random pattern
        d_in = 8'b11011001;
        #10;
        if (count !== 4'b0101) begin
            $display("FAIL: Test case 7 failed, expected count 5, got %b", count);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule