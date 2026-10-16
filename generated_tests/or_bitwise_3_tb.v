`timescale 1ns/1ps

module tb_or_bitwise;

    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] or_result;

    // Instantiate the module under test (uut)
    or_bitwise uut (
        .a(a),
        .b(b),
        .or_result(or_result)
    );

    initial begin
        // Test case 1: Basic OR operation
        a = 8'b10101010; 
        b = 8'b01010101; 
        #10;
        if (or_result !== 8'b11111111) begin
            $display("FAIL: Test case 1 failed, expected 11111111, got %b", or_result);
            $finish;
        end

        // Test case 2: OR with zero
        a = 8'b11110000; 
        b = 8'b00000000; 
        #10;
        if (or_result !== 8'b11110000) begin
            $display("FAIL: Test case 2 failed, expected 11110000, got %b", or_result);
            $finish;
        end

        // Test case 3: OR with all bits set
        a = 8'b11111111; 
        b = 8'b11111111; 
        #10;
        if (or_result !== 8'b11111111) begin
            $display("FAIL: Test case 3 failed, expected 11111111, got %b", or_result);
            $finish;
        end

        // Test case 4: OR with all bits clear
        a = 8'b00000000; 
        b = 8'b00000000; 
        #10;
        if (or_result !== 8'b00000000) begin
            $display("FAIL: Test case 4 failed, expected 00000000, got %b", or_result);
            $finish;
        end

        // Test case 5: Mixed bits
        a = 8'b11001100; 
        b = 8'b00110011; 
        #10;
        if (or_result !== 8'b11111111) begin
            $display("FAIL: Test case 5 failed, expected 11111111, got %b", or_result);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule