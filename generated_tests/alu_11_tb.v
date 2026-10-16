`timescale 1ns/1ps

module tb_alu;

    reg [7:0] a;
    reg [7:0] b;
    reg [3:0] command_in;
    reg oe;
    wire [15:0] d_out;

    // Instantiate the ALU module
    alu uut (
        .a(a),
        .b(b),
        .command_in(command_in),
        .oe(oe),
        .d_out(d_out)
    );

    initial begin
        // Test case 1: Addition
        a = 8'd15; b = 8'd10; command_in = 4'b0000; oe = 1;
        #10;
        if (d_out !== 16'd25) $display("FAIL: Addition failed");

        // Test case 2: Increment
        a = 8'd15; command_in = 4'b0001; oe = 1;
        #10;
        if (d_out !== 16'd16) $display("FAIL: Increment failed");

        // Test case 3: Subtraction
        a = 8'd20; b = 8'd5; command_in = 4'b0010; oe = 1;
        #10;
        if (d_out !== 16'd15) $display("FAIL: Subtraction failed");

        // Test case 4: Decrement
        a = 8'd10; command_in = 4'b0011; oe = 1;
        #10;
        if (d_out !== 16'd9) $display("FAIL: Decrement failed");

        // Test case 5: Multiplication
        a = 8'd4; b = 8'd5; command_in = 4'b0100; oe = 1;
        #10;
        if (d_out !== 16'd20) $display("FAIL: Multiplication failed");

        // Test case 6: Division
        a = 8'd20; b = 8'd4; command_in = 4'b0101; oe = 1;
        #10;
        if (d_out !== 16'd5) $display("FAIL: Division failed");

        // Test case 7: Shift Left
        a = 8'd2; b = 8'd1; command_in = 4'b0110; oe = 1;
        #10;
        if (d_out !== 16'd4) $display("FAIL: Shift Left failed");

        // Test case 8: Shift Right
        a = 8'd4; b = 8'd1; command_in = 4'b0111; oe = 1;
        #10;
        if (d_out !== 16'd2) $display("FAIL: Shift Right failed");

        // Test case 9: AND
        a = 8'd12; b = 8'd5; command_in = 4'b1000; oe = 1;
        #10;
        if (d_out !== 16'd4) $display("FAIL: AND failed");

        // Test case 10: OR
        a = 8'd12; b = 8'd5; command_in = 4'b1001; oe = 1;
        #10;
        if (d_out !== 16'd13) $display("FAIL: OR failed");

        // Test case 11: NOT (Inverse)
        a = 8'd15; command_in = 4'b1010; oe = 1;
        #10;
        if (d_out !== 16'd240) $display("FAIL: NOT failed");

        // Test case 12: NAND
        a = 8'd12; b = 8'd5; command_in = 4'b1011; oe = 1;
        #10;
        if (d_out !== 16'd251) $display("FAIL: NAND failed");

        // Test case 13: NOR
        a = 8'd12; b = 8'd5; command_in = 4'b1100; oe = 1;
        #10;
        if (d_out !== 16'd240) $display("FAIL: NOR failed");

        // Test case 14: XOR
        a = 8'd12; b = 8'd5; command_in = 4'b1101; oe = 1;
        #10;
        if (d_out !== 16'd9) $display("FAIL: XOR failed");

        // Test case 15: XNOR
        a = 8'd12; b = 8'd5; command_in = 4'b1110; oe = 1;
        #10;
        if (d_out !== 16'd6) $display("FAIL: XNOR failed");

        // Test case 16: BUF
        a = 8'd100; command_in = 4'b1111; oe = 1;
        #10;
        if (d_out !== 16'd100) $display("FAIL: BUF failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule