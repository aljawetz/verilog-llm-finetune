`timescale 1ns/1ps

module tb_bit_8shift;

    reg [15:0] in;
    reg [1:0] oper;
    wire [15:0] out;

    // Instantiate the module under test (uut)
    bit_8shift uut (
        .in(in),
        .oper(oper),
        .out(out)
    );

    initial begin
        // Test case 1: 8-bit left rotation
        in = 16'hA5A5; // 1010010110100101
        oper = 2'b00;  // Rotate left
        #10;
        if (out !== 16'h5A5A) $display("FAIL: Test case 1 failed, expected 5A5A, got %h", out);

        // Test case 2: 8-bit left shift
        in = 16'hA5A5; // 1010010110100101
        oper = 2'b01;  // Shift left
        #10;
        if (out !== 16'hA5A0) $display("FAIL: Test case 2 failed, expected A5A0, got %h", out);

        // Test case 3: 8-bit right rotation
        in = 16'hA5A5; // 1010010110100101
        oper = 2'b10;  // Rotate right
        #10;
        if (out !== 16'h5A5A) $display("FAIL: Test case 3 failed, expected 5A5A, got %h", out);

        // Test case 4: 8-bit logical right shift
        in = 16'hA5A5; // 1010010110100101
        oper = 2'b11;  // Logical shift right
        #10;
        if (out !== 16'h00A5) $display("FAIL: Test case 4 failed, expected 00A5, got %h", out);

        // Test case 5: Edge case with zero input
        in = 16'h0000; // 0000000000000000
        oper = 2'b00;  // Rotate left
        #10;
        if (out !== 16'h0000) $display("FAIL: Test case 5 failed, expected 0000, got %h", out);

        // Test case 6: Edge case with maximum input
        in = 16'hFFFF; // 1111111111111111
        oper = 2'b01;  // Shift left
        #10;
        if (out !== 16'hFFFE) $display("FAIL: Test case 6 failed, expected FFFE, got %h", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule