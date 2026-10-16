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
        A = 8'd100; B = 8'd28; Cin = 1'b0; Mode = 4'b0000; // A + B
        #10;
        if (result !== 8'd128 || carry_flag !== 1'b0 || overflow_flag !== 1'b0) 
            $display("FAIL: Addition test failed");

        // Test subtraction
        A = 8'd100; B = 8'd28; Cin = 1'b0; Mode = 4'b0001; // A - B
        #10;
        if (result !== 8'd72 || carry_flag !== 1'b0 || overflow_flag !== 1'b0) 
            $display("FAIL: Subtraction test failed");

        // Test AND
        A = 8'd170; B = 8'd75; Mode = 4'b0010; // A & B
        #10;
        if (result !== 8'd64) 
            $display("FAIL: AND test failed");

        // Test OR
        A = 8'd170; B = 8'd75; Mode = 4'b0011; // A | B
        #10;
        if (result !== 8'd181) 
            $display("FAIL: OR test failed");

        // Test XOR
        A = 8'd170; B = 8'd75; Mode = 4'b0110; // A ^ B
        #10;
        if (result !== 8'd117) 
            $display("FAIL: XOR test failed");

        // Test NOT
        A = 8'd170; Mode = 4'b0111; // ~A
        #10;
        if (result !== 8'd85) 
            $display("FAIL: NOT test failed");

        // Test left shift
        A = 8'd1; Mode = 4'b1000; // A << 1
        #10;
        if (result !== 8'd2) 
            $display("FAIL: Left shift test failed");

        // Test right shift
        A = 8'd4; Mode = 4'b1001; // A >> 1
        #10;
        if (result !== 8'd2) 
            $display("FAIL: Right shift test failed");

        // Test left shift by B
        A = 8'd1; B = 8'd3; Mode = 4'b1010; // A << B
        #10;
        if (result !== 8'd8) 
            $display("FAIL: Left shift by B test failed");

        // Test right shift by B
        A = 8'd16; B = 8'd2; Mode = 4'b1011; // A >> B
        #10;
        if (result !== 8'd4) 
            $display("FAIL: Right shift by B test failed");

        // Test NOR
        A = 8'd170; B = 8'd75; Mode = 4'b1100; // ~(A & B)
        #10;
        if (result !== 8'd191) 
            $display("FAIL: NOR test failed");

        // Test NAND
        A = 8'd170; B = 8'd75; Mode = 4'b1101; // ~(A | B)
        #10;
        if (result !== 8'd74) 
            $display("FAIL: NAND test failed");

        // Test XNOR
        A = 8'd170; B = 8'd75; Mode = 4'b1110; // ~(A ^ B)
        #10;
        if (result !== 8'd138) 
            $display("FAIL: XNOR test failed");

        // Test XNOR reduction
        A = 8'd170; B = 8'd75; Mode = 4'b1111; // A ~^ B
        #10;
        if (result !== 8'd138) 
            $display("FAIL: XNOR reduction test failed");

        $display("PASS");
        $finish;
    end

endmodule