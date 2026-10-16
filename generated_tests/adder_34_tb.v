`timescale 1ns/1ps

module tb_adder;

    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] sum;

    // Instantiate the adder module
    adder uut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        // Test case 1: 0 + 0 = 0
        a = 8'b00000000; 
        b = 8'b00000000; 
        #10;
        if (sum !== 8'b00000000) begin
            $display("FAIL: Test case 1 failed, expected 0, got %d", sum);
            $finish;
        end

        // Test case 2: 1 + 1 = 2
        a = 8'b00000001; 
        b = 8'b00000001; 
        #10;
        if (sum !== 8'b00000010) begin
            $display("FAIL: Test case 2 failed, expected 2, got %d", sum);
            $finish;
        end

        // Test case 3: 255 + 1 = 0 (overflow)
        a = 8'b11111111; 
        b = 8'b00000001; 
        #10;
        if (sum !== 8'b00000000) begin
            $display("FAIL: Test case 3 failed, expected 0, got %d", sum);
            $finish;
        end

        // Test case 4: 100 + 50 = 150
        a = 8'b01100100; 
        b = 8'b00110010; 
        #10;
        if (sum !== 8'b10010110) begin
            $display("FAIL: Test case 4 failed, expected 150, got %d", sum);
            $finish;
        end

        // Test case 5: 200 + 55 = 255
        a = 8'b11001000; 
        b = 8'b00110111; 
        #10;
        if (sum !== 8'b11111111) begin
            $display("FAIL: Test case 5 failed, expected 255, got %d", sum);
            $finish;
        end

        // Test case 6: 10 + 15 = 25
        a = 8'b00001010; 
        b = 8'b00001111; 
        #10;
        if (sum !== 8'b00011001) begin
            $display("FAIL: Test case 6 failed, expected 25, got %d", sum);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule