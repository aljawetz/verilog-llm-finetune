`timescale 1ns/1ps

module tb_x2b;

    reg [3:0] inp;
    wire invalid;
    wire [3:0] op;

    // Instantiate the module under test
    x2b uut (
        .inp(inp),
        .invalid(invalid),
        .op(op)
    );

    initial begin
        // Test cases
        // Valid inputs
        inp = 4'b0011; #10; // Expected op = 4'b0000, invalid = 0
        if (op !== 4'b0000 || invalid !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        inp = 4'b0100; #10; // Expected op = 4'b0001, invalid = 0
        if (op !== 4'b0001 || invalid !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        inp = 4'b0101; #10; // Expected op = 4'b0010, invalid = 0
        if (op !== 4'b0010 || invalid !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        inp = 4'b0110; #10; // Expected op = 4'b0011, invalid = 0
        if (op !== 4'b0011 || invalid !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        inp = 4'b0111; #10; // Expected op = 4'b0100, invalid = 0
        if (op !== 4'b0100 || invalid !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        inp = 4'b1000; #10; // Expected op = 4'b0101, invalid = 0
        if (op !== 4'b0101 || invalid !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        inp = 4'b1001; #10; // Expected op = 4'b0110, invalid = 0
        if (op !== 4'b0110 || invalid !== 0) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        inp = 4'b1010; #10; // Expected op = 4'b0111, invalid = 0
        if (op !== 4'b0111 || invalid !== 0) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        inp = 4'b1011; #10; // Expected op = 4'b1000, invalid = 0
        if (op !== 4'b1000 || invalid !== 0) begin
            $display("FAIL: Test case 9 failed");
            $finish;
        end

        inp = 4'b1100; #10; // Expected op = 4'b1001, invalid = 0
        if (op !== 4'b1001 || invalid !== 0) begin
            $display("FAIL: Test case 10 failed");
            $finish;
        end

        // Invalid inputs
        inp = 4'b0000; #10; // Expected invalid = 1
        if (invalid !== 1) begin
            $display("FAIL: Test case 11 failed");
            $finish;
        end

        inp = 4'b0001; #10; // Expected invalid = 1
        if (invalid !== 1) begin
            $display("FAIL: Test case 12 failed");
            $finish;
        end

        inp = 4'b0010; #10; // Expected invalid = 1
        if (invalid !== 1) begin
            $display("FAIL: Test case 13 failed");
            $finish;
        end

        inp = 4'b1111; #10; // Expected invalid = 1
        if (invalid !== 1) begin
            $display("FAIL: Test case 14 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule