`timescale 1ns/1ps

module tb_ExtInt;

    reg [7:0] IRQ;
    wire [2:0] INTNUM;
    wire INT;

    // Instantiate the module under test
    ExtInt uut (
        .IRQ(IRQ),
        .INTNUM(INTNUM),
        .INT(INT)
    );

    initial begin
        // Test case 1: Single interrupt on IRQ[0]
        IRQ = 8'b00000001; // Expect INT = 1, INTNUM = 3'd0
        #10;
        if (INT !== 1 || INTNUM !== 3'd0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Single interrupt on IRQ[1]
        IRQ = 8'b00000010; // Expect INT = 1, INTNUM = 3'd1
        #10;
        if (INT !== 1 || INTNUM !== 3'd1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Single interrupt on IRQ[2]
        IRQ = 8'b00000100; // Expect INT = 1, INTNUM = 3'd2
        #10;
        if (INT !== 1 || INTNUM !== 3'd2) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Single interrupt on IRQ[3]
        IRQ = 8'b00001000; // Expect INT = 1, INTNUM = 3'd3
        #10;
        if (INT !== 1 || INTNUM !== 3'd3) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Single interrupt on IRQ[4]
        IRQ = 8'b00010000; // Expect INT = 1, INTNUM = 3'd4
        #10;
        if (INT !== 1 || INTNUM !== 3'd4) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Single interrupt on IRQ[5]
        IRQ = 8'b00100000; // Expect INT = 1, INTNUM = 3'd5
        #10;
        if (INT !== 1 || INTNUM !== 3'd5) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: Single interrupt on IRQ[6]
        IRQ = 8'b01000000; // Expect INT = 1, INTNUM = 3'd6
        #10;
        if (INT !== 1 || INTNUM !== 3'd6) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: Single interrupt on IRQ[7]
        IRQ = 8'b10000000; // Expect INT = 1, INTNUM = 3'd7
        #10;
        if (INT !== 1 || INTNUM !== 3'd7) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // Test case 9: Multiple interrupts
        IRQ = 8'b00000011; // Expect INT = 0, INTNUM = 3'd0
        #10;
        if (INT !== 0 || INTNUM !== 3'd0) begin
            $display("FAIL: Test case 9 failed");
            $finish;
        end

        // Test case 10: No interrupts
        IRQ = 8'b00000000; // Expect INT = 0, INTNUM = 3'd0
        #10;
        if (INT !== 0 || INTNUM !== 3'd0) begin
            $display("FAIL: Test case 10 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule