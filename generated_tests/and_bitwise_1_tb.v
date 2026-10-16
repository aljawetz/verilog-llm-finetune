`timescale 1ns/1ps

module tb_and_bitwise;

    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] and_result;

    // Instantiate the module under test (uut)
    and_bitwise uut (
        .a(a),
        .b(b),
        .and_result(and_result)
    );

    initial begin
        // Test case 1: Basic AND operation
        a = 8'b10101010; 
        b = 8'b11001100; 
        #10;
        if (and_result !== 8'b10001000) begin
            $display("FAIL: Test case 1 failed. Expected 10001000, got %b", and_result);
            $finish;
        end

        // Test case 2: All bits set
        a = 8'b11111111; 
        b = 8'b11111111; 
        #10;
        if (and_result !== 8'b11111111) begin
            $display("FAIL: Test case 2 failed. Expected 11111111, got %b", and_result);
            $finish;
        end

        // Test case 3: One operand is zero
        a = 8'b00000000; 
        b = 8'b10101010; 
        #10;
        if (and_result !== 8'b00000000) begin
            $display("FAIL: Test case 3 failed. Expected 00000000, got %b", and_result);
            $finish;
        end

        // Test case 4: Both operands are zero
        a = 8'b00000000; 
        b = 8'b00000000; 
        #10;
        if (and_result !== 8'b00000000) begin
            $display("FAIL: Test case 4 failed. Expected 00000000, got %b", and_result);
            $finish;
        end

        // Test case 5: Different patterns
        a = 8'b11001100; 
        b = 8'b10101010; 
        #10;
        if (and_result !== 8'b10001000) begin
            $display("FAIL: Test case 5 failed. Expected 10001000, got %b", and_result);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule