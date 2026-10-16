`timescale 1ns/1ps

module tb_Shift;

    reg [31:0] a;
    reg [4:0] amount;
    reg right;
    reg arth;
    wire [31:0] result;

    // Instantiate the Shift module
    Shift uut (
        .a(a),
        .amount(amount),
        .right(right),
        .arth(arth),
        .result(result)
    );

    initial begin
        // Test case 1: Left shift
        a = 32'h00000001; // 1
        amount = 5'd1;    // Shift left by 1
        right = 1'b0;     // Not a right shift
        arth = 1'b0;      // Not arithmetic
        #10;
        if (result !== 32'h00000002) $display("FAIL: Test case 1 failed, expected 0x00000002, got 0x%h", result);

        // Test case 2: Logical right shift
        a = 32'h00000004; // 4
        amount = 5'd1;    // Shift right by 1
        right = 1'b1;     // Right shift
        arth = 1'b0;      // Not arithmetic
        #10;
        if (result !== 32'h00000002) $display("FAIL: Test case 2 failed, expected 0x00000002, got 0x%h", result);

        // Test case 3: Arithmetic right shift
        a = 32'hFFFFFFFC; // -4 in signed
        amount = 5'd1;    // Shift right by 1
        right = 1'b1;     // Right shift
        arth = 1'b1;      // Arithmetic shift
        #10;
        if (result !== 32'hFFFFFFFF) $display("FAIL: Test case 3 failed, expected 0xFFFFFFFF, got 0x%h", result);

        // Test case 4: Left shift with zero
        a = 32'h00000000; // 0
        amount = 5'd5;    // Shift left by 5
        right = 1'b0;     // Not a right shift
        arth = 1'b0;      // Not arithmetic
        #10;
        if (result !== 32'h00000000) $display("FAIL: Test case 4 failed, expected 0x00000000, got 0x%h", result);

        // Test case 5: Logical right shift with zero
        a = 32'h00000000; // 0
        amount = 5'd5;    // Shift right by 5
        right = 1'b1;     // Right shift
        arth = 1'b0;      // Not arithmetic
        #10;
        if (result !== 32'h00000000) $display("FAIL: Test case 5 failed, expected 0x00000000, got 0x%h", result);

        // Test case 6: Arithmetic right shift with positive number
        a = 32'h00000004; // 4
        amount = 5'd1;    // Shift right by 1
        right = 1'b1;     // Right shift
        arth = 1'b1;      // Arithmetic shift
        #10;
        if (result !== 32'h00000002) $display("FAIL: Test case 6 failed, expected 0x00000002, got 0x%h", result);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule