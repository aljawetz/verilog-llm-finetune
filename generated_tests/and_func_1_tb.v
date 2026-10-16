`timescale 1ns/1ps

module tb_and_func;

    reg [7:0] A;
    reg [7:0] B;
    wire [7:0] Y;

    // Instantiate the module under test (uut)
    and_func uut (
        .A(A),
        .B(B),
        .Y(Y)
    );

    initial begin
        // Test case 1: A = 8'b00001111, B = 8'b11110000
        A = 8'b00001111; 
        B = 8'b11110000; 
        #10;
        if (Y !== 8'b00000000) begin
            $display("FAIL: Test case 1 failed, expected 00000000, got %b", Y);
            $finish;
        end

        // Test case 2: A = 8'b10101010, B = 8'b01010101
        A = 8'b10101010; 
        B = 8'b01010101; 
        #10;
        if (Y !== 8'b00000000) begin
            $display("FAIL: Test case 2 failed, expected 00000000, got %b", Y);
            $finish;
        end

        // Test case 3: A = 8'b11111111, B = 8'b11111111
        A = 8'b11111111; 
        B = 8'b11111111; 
        #10;
        if (Y !== 8'b11111111) begin
            $display("FAIL: Test case 3 failed, expected 11111111, got %b", Y);
            $finish;
        end

        // Test case 4: A = 8'b00000000, B = 8'b11111111
        A = 8'b00000000; 
        B = 8'b11111111; 
        #10;
        if (Y !== 8'b00000000) begin
            $display("FAIL: Test case 4 failed, expected 00000000, got %b", Y);
            $finish;
        end

        // Test case 5: A = 8'b11001100, B = 8'b10101010
        A = 8'b11001100; 
        B = 8'b10101010; 
        #10;
        if (Y !== 8'b10001000) begin
            $display("FAIL: Test case 5 failed, expected 10001000, got %b", Y);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule