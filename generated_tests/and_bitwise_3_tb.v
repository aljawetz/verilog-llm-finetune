`timescale 1ns/1ps

module tb_and_bitwise;

    // Inputs
    reg [7:0] a;
    reg [7:0] b;

    // Output
    wire [7:0] and_result;

    // Instantiate the Unit Under Test (UUT)
    and_bitwise uut (
        .a(a),
        .b(b),
        .and_result(and_result)
    );

    initial begin
        // Test case 1: a = 8'b00001111, b = 8'b11110000
        a = 8'b00001111; 
        b = 8'b11110000; 
        #10;
        if (and_result !== 8'b00000000) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: a = 8'b10101010, b = 8'b01010101
        a = 8'b10101010; 
        b = 8'b01010101; 
        #10;
        if (and_result !== 8'b00000000) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: a = 8'b11111111, b = 8'b11111111
        a = 8'b11111111; 
        b = 8'b11111111; 
        #10;
        if (and_result !== 8'b11111111) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: a = 8'b10101010, b = 8'b00000000
        a = 8'b10101010; 
        b = 8'b00000000; 
        #10;
        if (and_result !== 8'b00000000) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: a = 8'b00000000, b = 8'b00000000
        a = 8'b00000000; 
        b = 8'b00000000; 
        #10;
        if (and_result !== 8'b00000000) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule