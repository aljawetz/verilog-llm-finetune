`timescale 1ns/1ps

module tb_sl2;

    reg [31:0] a;
    wire [31:0] y;

    // Instantiate the module under test (uut)
    sl2 uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test case 1: Shift a value with some bits set
        a = 32'h00000001; // 0000...0001
        #10;
        if (y !== 32'h00000004) begin
            $display("FAIL: Test case 1 failed, expected 0x00000004, got 0x%h", y);
            $finish;
        end

        // Test case 2: Shift a value with more bits set
        a = 32'h00000003; // 0000...0011
        #10;
        if (y !== 32'h0000000C) begin
            $display("FAIL: Test case 2 failed, expected 0x0000000C, got 0x%h", y);
            $finish;
        end

        // Test case 3: Shift a value with bits set in higher positions
        a = 32'hF0000000; // 1111...0000
        #10;
        if (y !== 32'hC0000000) begin
            $display("FAIL: Test case 3 failed, expected 0xC0000000, got 0x%h", y);
            $finish;
        end

        // Test case 4: Shift a value with all bits set
        a = 32'hFFFFFFFF; // 1111...1111
        #10;
        if (y !== 32'hFFFFFFFC) begin
            $display("FAIL: Test case 4 failed, expected 0xFFFFFFFC, got 0x%h", y);
            $finish;
        end

        // Test case 5: Shift zero
        a = 32'h00000000; // 0000...0000
        #10;
        if (y !== 32'h00000000) begin
            $display("FAIL: Test case 5 failed, expected 0x00000000, got 0x%h", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule