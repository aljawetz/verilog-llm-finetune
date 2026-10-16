`timescale 1ns/1ps

module tb_subtractor;

    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] difference;

    // Instantiate the module under test (uut)
    subtractor uut (
        .a(a),
        .b(b),
        .difference(difference)
    );

    initial begin
        // Test case 1: Simple subtraction
        a = 8'd10; 
        b = 8'd5; 
        #10;
        if (difference !== 8'd5) begin
            $display("FAIL: Test case 1 failed, expected 5 but got %d", difference);
            $finish;
        end

        // Test case 2: Subtraction resulting in zero
        a = 8'd7; 
        b = 8'd7; 
        #10;
        if (difference !== 8'd0) begin
            $display("FAIL: Test case 2 failed, expected 0 but got %d", difference);
            $finish;
        end

        // Test case 3: Subtraction with larger second operand
        a = 8'd5; 
        b = 8'd10; 
        #10;
        if (difference !== 8'd251) begin // 5 - 10 = -5, which is 251 in 8-bit two's complement
            $display("FAIL: Test case 3 failed, expected 251 but got %d", difference);
            $finish;
        end

        // Test case 4: Subtraction resulting in maximum negative value
        a = 8'd0; 
        b = 8'd1; 
        #10;
        if (difference !== 8'd255) begin // 0 - 1 = -1, which is 255 in 8-bit two's complement
            $display("FAIL: Test case 4 failed, expected 255 but got %d", difference);
            $finish;
        end

        // Test case 5: Subtraction with both operands equal
        a = 8'd100; 
        b = 8'd100; 
        #10;
        if (difference !== 8'd0) begin
            $display("FAIL: Test case 5 failed, expected 0 but got %d", difference);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule