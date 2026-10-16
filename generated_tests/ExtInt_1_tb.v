`timescale 1ns/1ps

module tb_ExtInt;

    reg [7:0] IRQ;
    wire [2:0] INTNUM;
    wire INT;

    // Instantiate the module under test (uut)
    ExtInt uut (
        .IRQ(IRQ),
        .INTNUM(INTNUM),
        .INT(INT)
    );

    initial begin
        // Initialize IRQ
        IRQ = 8'b00000000;

        // Test case 1: IRQ[0] = 1
        IRQ = 8'b00000001; #10;
        if (INT !== 1 || INTNUM !== 3'd0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: IRQ[1] = 1
        IRQ = 8'b00000010; #10;
        if (INT !== 1 || INTNUM !== 3'd1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: IRQ[2] = 1
        IRQ = 8'b00000100; #10;
        if (INT !== 1 || INTNUM !== 3'd2) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: IRQ[3] = 1
        IRQ = 8'b00001000; #10;
        if (INT !== 1 || INTNUM !== 3'd3) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: IRQ[4] = 1
        IRQ = 8'b00010000; #10;
        if (INT !== 1 || INTNUM !== 3'd4) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: IRQ[5] = 1
        IRQ = 8'b00100000; #10;
        if (INT !== 1 || INTNUM !== 3'd5) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: IRQ[6] = 1
        IRQ = 8'b01000000; #10;
        if (INT !== 1 || INTNUM !== 3'd6) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: IRQ[7] = 1
        IRQ = 8'b10000000; #10;
        if (INT !== 1 || INTNUM !== 3'd7) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // Test case 9: No IRQs
        IRQ = 8'b00000000; #10;
        if (INT !== 0 || INTNUM !== 3'd0) begin
            $display("FAIL: Test case 9 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule