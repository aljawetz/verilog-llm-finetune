`timescale 1ns/1ps

module tb_alu;

    reg [7:0] A;
    reg [7:0] B;
    reg Cin;
    reg [3:0] Mode;
    wire [7:0] result;
    wire overflow_flag;
    wire zero_flag;
    wire negative_flag;
    wire carry_flag;

    alu uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Mode(Mode),
        .result(result),
        .overflow_flag(overflow_flag),
        .zero_flag(zero_flag),
        .negative_flag(negative_flag),
        .carry_flag(carry_flag)
    );

    initial begin
        // Test addition
        A = 8'd100; B = 8'd28; Cin = 1'b0; Mode = 4'b0000; // 100 + 28
        #10;
        if (result !== 8'd128 || carry_flag !== 1'b0 || overflow_flag !== 1'b0) 
            $display("FAIL: Addition test failed");

        // Test subtraction
        A = 8'd100; B = 8'd28; Cin = 1'b0; Mode = 4'b0001; // 100 - 28
        #10;
        if (result !== 8'd72 || carry_flag !== 1'b0 || overflow_flag !== 1'b0) 
            $display("FAIL: Subtraction test failed");

        // Test AND
        A = 8'b11001100; B = 8'b10101010; Cin = 1'b0; Mode = 4'b0010; // 11001100 & 10101010
        #10;
        if (result !== 8'b10001000) 
            $display("FAIL: AND test failed");

        // Test OR
        A = 8'b11001100; B = 8'b10101010; Cin = 1'b0; Mode = 4'b0011; // 11001100 | 10101010
        #10;
        if (result !== 8'b11101110) 
            $display("FAIL: OR test failed");

        // Test XOR
        A = 8'b11001100; B = 8'b10101010; Cin = 1'b0; Mode = 4'b0110; // 11001100 ^ 10101010
        #10;
        if (result !== 8'b01100110) 
            $display("FAIL: XOR test failed");

        // Test NOT
        A = 8'b11001100; Cin = 1'b0; Mode = 4'b0111; // ~11001100
        #10;
        if (result !== 8'b00110011) 
            $display("FAIL: NOT test failed");

        // Test left shift
        A = 8'b00001111; Cin = 1'b0; Mode = 4'b1000; // 00001111 << 1
        #10;
        if (result !== 8'b00011110) 
            $display("FAIL: Left shift test failed");

        // Test right shift
        A = 8'b00001111; Cin = 1'b0; Mode = 4'b1001; // 00001111 >> 1
        #10;
        if (result !== 8'b00000111) 
            $display("FAIL: Right shift test failed");

        // Test overflow
        A = 8'd127; B = 8'd1; Cin = 1'b0; Mode = 4'b0000; // 127 + 1
        #10;
        if (result !== 8'd128 || carry_flag !== 1'b0 || overflow_flag !== 1'b1) 
            $display("FAIL: Overflow test failed");

        // Test zero flag
        A = 8'd0; B = 8'd0; Cin = 1'b0; Mode = 4'b0000; // 0 + 0
        #10;
        if (result !== 8'd0 || zero_flag !== 1'b1) 
            $display("FAIL: Zero flag test failed");

        // Test negative flag
        A = 8'd128; B = 8'd1; Cin = 1'b0; Mode = 4'b0001; // 128 - 1
        #10;
        if (result !== 8'd127 || negative_flag !== 1'b0) 
            $display("FAIL: Negative flag test failed");

        $display("PASS");
        $finish;
    end

endmodule