`timescale 1ns/1ps

module tb_fulladder_usingdecoder;

    reg [2:0] in;
    wire sum;
    wire carry;
    wire [7:0] m;

    // Instantiate the module under test (uut)
    fulladder_usingdecoder uut (
        .in(in),
        .sum(sum),
        .carry(carry),
        .m(m)
    );

    initial begin
        // Test cases
        // Test case 1: in = 3'd0 (0 + 0)
        in = 3'd0; #10;
        if (sum !== 1'b0 || carry !== 1'b0) begin
            $display("FAIL: Test case 1 failed for input %b", in);
            $finish;
        end

        // Test case 2: in = 3'd1 (0 + 1)
        in = 3'd1; #10;
        if (sum !== 1'b1 || carry !== 1'b0) begin
            $display("FAIL: Test case 2 failed for input %b", in);
            $finish;
        end

        // Test case 3: in = 3'd2 (1 + 0)
        in = 3'd2; #10;
        if (sum !== 1'b1 || carry !== 1'b0) begin
            $display("FAIL: Test case 3 failed for input %b", in);
            $finish;
        end

        // Test case 4: in = 3'd3 (1 + 1)
        in = 3'd3; #10;
        if (sum !== 1'b0 || carry !== 1'b1) begin
            $display("FAIL: Test case 4 failed for input %b", in);
            $finish;
        end

        // Test case 5: in = 3'd4 (0 + 0 + 1)
        in = 3'd4; #10;
        if (sum !== 1'b1 || carry !== 1'b0) begin
            $display("FAIL: Test case 5 failed for input %b", in);
            $finish;
        end

        // Test case 6: in = 3'd5 (1 + 0 + 1)
        in = 3'd5; #10;
        if (sum !== 1'b0 || carry !== 1'b1) begin
            $display("FAIL: Test case 6 failed for input %b", in);
            $finish;
        end

        // Test case 7: in = 3'd6 (1 + 1 + 0)
        in = 3'd6; #10;
        if (sum !== 1'b0 || carry !== 1'b1) begin
            $display("FAIL: Test case 7 failed for input %b", in);
            $finish;
        end

        // Test case 8: in = 3'd7 (1 + 1 + 1)
        in = 3'd7; #10;
        if (sum !== 1'b1 || carry !== 1'b1) begin
            $display("FAIL: Test case 8 failed for input %b", in);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule