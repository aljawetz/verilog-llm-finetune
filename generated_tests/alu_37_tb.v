`timescale 1ns/1ps

module tb_alu;

    reg [7:0] a_in;
    reg [7:0] b_in;
    reg [3:0] command_in;
    reg oe;
    wire [15:0] d_out;

    // Instantiate the ALU module
    alu uut (
        .a_in(a_in),
        .b_in(b_in),
        .command_in(command_in),
        .oe(oe),
        .d_out(d_out)
    );

    initial begin
        // Test case 1: Addition
        a_in = 8'd10; b_in = 8'd5; command_in = 4'b0000; oe = 1;
        #10;
        if (d_out !== 16'd15) $display("FAIL: Addition failed");
        
        // Test case 2: Subtraction
        a_in = 8'd10; b_in = 8'd5; command_in = 4'b0001; oe = 1;
        #10;
        if (d_out !== 16'd5) $display("FAIL: Subtraction failed");
        
        // Test case 3: Multiplication
        a_in = 8'd3; b_in = 8'd4; command_in = 4'b0010; oe = 1;
        #10;
        if (d_out !== 16'd12) $display("FAIL: Multiplication failed");
        
        // Test case 4: Division
        a_in = 8'd10; b_in = 8'd2; command_in = 4'b0011; oe = 1;
        #10;
        if (d_out !== 16'd5) $display("FAIL: Division failed");
        
        // Test case 5: Shift Left
        a_in = 8'd2; command_in = 4'b0100; oe = 1;
        #10;
        if (d_out !== 16'd4) $display("FAIL: Shift Left failed");
        
        // Test case 6: Shift Right
        a_in = 8'd4; command_in = 4'b0101; oe = 1;
        #10;
        if (d_out !== 16'd2) $display("FAIL: Shift Right failed");
        
        // Test case 7: Rotate Left
        a_in = 8'b00000001; command_in = 4'b0110; oe = 1;
        #10;
        if (d_out !== 16'b00000010) $display("FAIL: Rotate Left failed");
        
        // Test case 8: Rotate Right
        a_in = 8'b00000010; command_in = 4'b0111; oe = 1;
        #10;
        if (d_out !== 16'b00000001) $display("FAIL: Rotate Right failed");
        
        // Test case 9: AND
        a_in = 8'b11001100; b_in = 8'b10101010; command_in = 4'b1000; oe = 1;
        #10;
        if (d_out !== 16'b10001000) $display("FAIL: AND failed");
        
        // Test case 10: OR
        a_in = 8'b11001100; b_in = 8'b10101010; command_in = 4'b1001; oe = 1;
        #10;
        if (d_out !== 16'b11101110) $display("FAIL: OR failed");
        
        // Test case 11: XOR
        a_in = 8'b11001100; b_in = 8'b10101010; command_in = 4'b1010; oe = 1;
        #10;
        if (d_out !== 16'b01100110) $display("FAIL: XOR failed");
        
        // Test case 12: NOR
        a_in = 8'b11001100; b_in = 8'b10101010; command_in = 4'b1011; oe = 1;
        #10;
        if (d_out !== 16'b00000000) $display("FAIL: NOR failed");
        
        // Test case 13: NAND
        a_in = 8'b11001100; b_in = 8'b10101010; command_in = 4'b1100; oe = 1;
        #10;
        if (d_out !== 16'b00000000) $display("FAIL: NAND failed");
        
        // Test case 14: XNOR
        a_in = 8'b11001100; b_in = 8'b10101010; command_in = 4'b1101; oe = 1;
        #10;
        if (d_out !== 16'b10011110) $display("FAIL: XNOR failed");
        
        // Test case 15: Equality Check
        a_in = 8'd10; b_in = 8'd10; command_in = 4'b1110; oe = 1;
        #10;
        if (d_out !== 16'd1) $display("FAIL: Equality Check failed");
        
        // Test case 16: Inequality Check
        a_in = 8'd10; b_in = 8'd5; command_in = 4'b1111; oe = 1;
        #10;
        if (d_out !== 16'd1) $display("FAIL: Inequality Check failed");
        
        // Test case 17: High Impedance
        oe = 0; 
        #10;
        if (d_out !== 16'bz) $display("FAIL: High Impedance failed");

        $display("PASS");
        $finish;
    end

endmodule