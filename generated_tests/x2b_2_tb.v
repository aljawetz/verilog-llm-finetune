`timescale 1ns/1ps

module tb_x2b;

    reg [3:0] inp;
    wire invalid;
    wire [3:0] op;

    // Instantiate the module under test (uut)
    x2b uut (
        .inp(inp),
        .invalid(invalid),
        .op(op)
    );

    initial begin
        // Test case 1: Valid input 0011
        inp = 4'b0011; #10;
        if (invalid !== 0 || op !== 4'b0000) begin
            $display("FAIL: Test case 1 failed for input 0011");
            $finish;
        end

        // Test case 2: Valid input 0100
        inp = 4'b0100; #10;
        if (invalid !== 0 || op !== 4'b0001) begin
            $display("FAIL: Test case 2 failed for input 0100");
            $finish;
        end

        // Test case 3: Valid input 1100
        inp = 4'b1100; #10;
        if (invalid !== 0 || op !== 4'b1001) begin
            $display("FAIL: Test case 3 failed for input 1100");
            $finish;
        end

        // Test case 4: Valid input 1010
        inp = 4'b1010; #10;
        if (invalid !== 0 || op !== 4'b0111) begin
            $display("FAIL: Test case 4 failed for input 1010");
            $finish;
        end

        // Test case 5: Invalid input 0000
        inp = 4'b0000; #10;
        if (invalid !== 1 || op !== 4'bxxxx) begin
            $display("FAIL: Test case 5 failed for input 0000");
            $finish;
        end

        // Test case 6: Invalid input 1111
        inp = 4'b1111; #10;
        if (invalid !== 1 || op !== 4'bxxxx) begin
            $display("FAIL: Test case 6 failed for input 1111");
            $finish;
        end

        // Test case 7: Invalid input 0101
        inp = 4'b0111; #10;
        if (invalid !== 0 || op !== 4'b0100) begin
            $display("FAIL: Test case 7 failed for input 0111");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule