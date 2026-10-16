`timescale 1ns/1ps

module tb_alu;

    reg [7:0] a;
    reg [7:0] b;
    reg [3:0] command;
    reg en;
    wire [15:0] out;

    // Instantiate the ALU module
    alu uut (
        .a(a),
        .b(b),
        .command(command),
        .en(en),
        .out(out)
    );

    initial begin
        // Test case 1: Addition
        a = 8'd10; b = 8'd20; command = 4'b0000; en = 1;
        #10;
        if (out !== 16'd30) $display("FAIL: Addition failed");

        // Test case 2: Increment
        a = 8'd15; command = 4'b0001; en = 1;
        #10;
        if (out !== 16'd16) $display("FAIL: Increment failed");

        // Test case 3: Subtraction
        a = 8'd30; b = 8'd10; command = 4'b0010; en = 1;
        #10;
        if (out !== 16'd20) $display("FAIL: Subtraction failed");

        // Test case 4: Decrement
        a = 8'd25; command = 4'b0011; en = 1;
        #10;
        if (out !== 16'd24) $display("FAIL: Decrement failed");

        // Test case 5: Multiplication
        a = 8'd5; b = 8'd6; command = 4'b0100; en = 1;
        #10;
        if (out !== 16'd30) $display("FAIL: Multiplication failed");

        // Test case 6: Division
        a = 8'd40; b = 8'd8; command = 4'b0101; en = 1;
        #10;
        if (out !== 16'd5) $display("FAIL: Division failed");

        // Test case 7: Shift Left
        a = 8'd2; command = 4'b0110; en = 1;
        #10;
        if (out !== 16'd4) $display("FAIL: Shift Left failed");

        // Test case 8: Shift Right
        a = 8'd4; command = 4'b0111; en = 1;
        #10;
        if (out !== 16'd2) $display("FAIL: Shift Right failed");

        // Test case 9: AND
        a = 8'd12; b = 8'd10; command = 4'b1000; en = 1;
        #10;
        if (out !== 16'd8) $display("FAIL: AND failed");

        // Test case 10: OR
        a = 8'd12; b = 8'd10; command = 4'b1001; en = 1;
        #10;
        if (out !== 16'd14) $display("FAIL: OR failed");

        // Test case 11: Logical Negation
        a = 8'd5; b = 8'd0; command = 4'b1010; en = 1;
        #10;
        if (out !== 16'd0) $display("FAIL: Logical Negation failed");

        // Test case 12: NAND
        a = 8'd5; b = 8'd2; command = 4'b1011; en = 1;
        #10;
        if (out !== 16'd0) $display("FAIL: NAND failed");

        // Test case 13: NOR
        a = 8'd0; b = 8'd0; command = 4'b1100; en = 1;
        #10;
        if (out !== 16'd65535) $display("FAIL: NOR failed");

        // Test case 14: XOR
        a = 8'd5; b = 8'd3; command = 4'b1101; en = 1;
        #10;
        if (out !== 16'd6) $display("FAIL: XOR failed");

        // Test case 15: XNOR
        a = 8'd5; b = 8'd3; command = 4'b1110; en = 1;
        #10;
        if (out !== 16'd65529) $display("FAIL: XNOR failed");

        // Test case 16: BUF
        a = 8'd7; command = 4'b1111; en = 1;
        #10;
        if (out !== 16'd7) $display("FAIL: BUF failed");

        // Test case 17: Disabled output
        en = 0;
        #10;
        if (out !== 16'bz) $display("FAIL: Output not high impedance when disabled");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule