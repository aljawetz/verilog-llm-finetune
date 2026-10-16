`timescale 1ns/1ps

module tb_alu;
    reg [3:0] a;
    reg [3:0] b;
    reg [3:0] sel;
    wire [7:0] y;

    // Instantiate the ALU module
    alu uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test case 1: Addition
        a = 4'd5; b = 4'd3; sel = 4'h0; #10;
        if (y !== 8'd8) $display("FAIL: Addition failed");

        // Test case 2: Subtraction
        a = 4'd5; b = 4'd3; sel = 4'h1; #10;
        if (y !== 8'd2) $display("FAIL: Subtraction failed");

        // Test case 3: Multiplication
        a = 4'd3; b = 4'd2; sel = 4'h2; #10;
        if (y !== 8'd6) $display("FAIL: Multiplication failed");

        // Test case 4: Division
        a = 4'd6; b = 4'd2; sel = 4'h3; #10;
        if (y !== 8'd3) $display("FAIL: Division failed");

        // Test case 5: Bitwise AND
        a = 4'b1100; b = 4'b1010; sel = 4'h4; #10;
        if (y !== 8'b1000_0000) $display("FAIL: Bitwise AND failed");

        // Test case 6: Bitwise NAND
        a = 4'b1100; b = 4'b1010; sel = 4'h5; #10;
        if (y !== 8'b0111_1111) $display("FAIL: Bitwise NAND failed");

        // Test case 7: Bitwise OR
        a = 4'b1100; b = 4'b1010; sel = 4'h6; #10;
        if (y !== 8'b1110_0000) $display("FAIL: Bitwise OR failed");

        // Test case 8: Bitwise NOR
        a = 4'b1100; b = 4'b1010; sel = 4'h7; #10;
        if (y !== 8'b0001_1111) $display("FAIL: Bitwise NOR failed");

        // Test case 9: Bitwise XOR
        a = 4'b1100; b = 4'b1010; sel = 4'h8; #10;
        if (y !== 8'b0110_0000) $display("FAIL: Bitwise XOR failed");

        // Test case 10: Bitwise XNOR
        a = 4'b1100; b = 4'b1010; sel = 4'h9; #10;
        if (y !== 8'b1001_1111) $display("FAIL: Bitwise XNOR failed");

        // Test case 11: Bitwise NOT a
        a = 4'b1100; sel = 4'hA; #10;
        if (y !== 8'b0011_1111) $display("FAIL: Bitwise NOT a failed");

        // Test case 12: Bitwise NOT b
        b = 4'b1010; sel = 4'hB; #10;
        if (y !== 8'b0101_1111) $display("FAIL: Bitwise NOT b failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule