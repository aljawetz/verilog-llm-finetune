`timescale 1ns/1ps

module tb_Shifter;

    reg [31:0] tobeshifted;
    reg [4:0] amount;
    reg [1:0] left;
    wire [31:0] aftershifting;

    // Instantiate the Shifter module
    Shifter uut (
        .tobeshifted(tobeshifted),
        .amount(amount),
        .left(left),
        .aftershifting(aftershifting)
    );

    initial begin
        // Test case 1: Left shift by 1
        tobeshifted = 32'h00000001; // 1
        amount = 5'b00001; // Shift by 1
        left = 2'b01; // Logical left
        #10;
        if (aftershifting !== 32'h00000002) begin
            $display("FAIL: Test case 1 failed, expected 0x00000002, got 0x%08h", aftershifting);
            $finish;
        end

        // Test case 2: Logical right shift by 1
        tobeshifted = 32'h00000002; // 2
        amount = 5'b00001; // Shift by 1
        left = 2'b00; // Logical right
        #10;
        if (aftershifting !== 32'h00000001) begin
            $display("FAIL: Test case 2 failed, expected 0x00000001, got 0x%08h", aftershifting);
            $finish;
        end

        // Test case 3: Arithmetic right shift by 1
        tobeshifted = 32'hFFFFFFFE; // -2 in signed
        amount = 5'b00001; // Shift by 1
        left = 2'b10; // Arithmetic right
        #10;
        if (aftershifting !== 32'hFFFFFFFF) begin
            $display("FAIL: Test case 3 failed, expected 0xFFFFFFFF, got 0x%08h", aftershifting);
            $finish;
        end

        // Test case 4: Left shift by 16
        tobeshifted = 32'h00000001; // 1
        amount = 5'b10000; // Shift by 16
        left = 2'b01; // Logical left
        #10;
        if (aftershifting !== 32'h00010000) begin
            $display("FAIL: Test case 4 failed, expected 0x00010000, got 0x%08h", aftershifting);
            $finish;
        end

        // Test case 5: Logical right shift by 16
        tobeshifted = 32'h00010000; // 65536
        amount = 5'b10000; // Shift by 16
        left = 2'b00; // Logical right
        #10;
        if (aftershifting !== 32'h00000001) begin
            $display("FAIL: Test case 5 failed, expected 0x00000001, got 0x%08h", aftershifting);
            $finish;
        end

        // Test case 6: Arithmetic right shift by 16
        tobeshifted = 32'h80000000; // -2147483648 in signed
        amount = 5'b10000; // Shift by 16
        left = 2'b10; // Arithmetic right
        #10;
        if (aftershifting !== 32'hFFFF8000) begin
            $display("FAIL: Test case 6 failed, expected 0xFFFF8000, got 0x%08h", aftershifting);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule