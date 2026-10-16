`timescale 1ns/1ps

module tb_p_shfrot;

    reg [31:0] crs1;
    reg [4:0] shamt;
    reg [4:0] pw;
    reg shift;
    reg rotate;
    reg left;
    reg right;
    wire [31:0] result;

    // Instantiate the module under test
    p_shfrot uut (
        .crs1(crs1),
        .shamt(shamt),
        .pw(pw),
        .shift(shift),
        .rotate(rotate),
        .left(left),
        .right(right),
        .result(result)
    );

    initial begin
        // Test case 1: Simple left shift
        crs1 = 32'h00000001; // 0000...0001
        shamt = 5'b00001;    // Shift by 1
        pw = 5'b00001;       // Pack width 1
        shift = 1;           // Shift operation
        rotate = 0;          // No rotate
        left = 1;            // Shift left
        right = 0;           // Not shifting right
        #10;
        if (result !== 32'h00000002) begin
            $display("FAIL: Expected 0x00000002, got 0x%08h", result);
            $finish;
        end

        // Test case 2: Simple right shift
        crs1 = 32'h00000002; // 0000...0010
        shamt = 5'b00001;    // Shift by 1
        pw = 5'b00001;       // Pack width 1
        shift = 1;           // Shift operation
        rotate = 0;          // No rotate
        left = 0;            // Not shifting left
        right = 1;           // Shift right
        #10;
        if (result !== 32'h00000001) begin
            $display("FAIL: Expected 0x00000001, got 0x%08h", result);
            $finish;
        end

        // Test case 3: Rotate left
        crs1 = 32'h80000000; // 1000...0000
        shamt = 5'b00001;    // Rotate by 1
        pw = 5'b00001;       // Pack width 1
        shift = 0;           // Not a shift operation
        rotate = 1;          // Rotate operation
        left = 1;            // Rotate left
        right = 0;           // Not rotating right
        #10;
        if (result !== 32'h00000001) begin
            $display("FAIL: Expected 0x00000001, got 0x%08h", result);
            $finish;
        end

        // Test case 4: Rotate right
        crs1 = 32'h00000001; // 0000...0001
        shamt = 5'b00001;    // Rotate by 1
        pw = 5'b00001;       // Pack width 1
        shift = 0;           // Not a shift operation
        rotate = 1;          // Rotate operation
        left = 0;            // Not rotating left
        right = 1;           // Rotate right
        #10;
        if (result !== 32'h80000000) begin
            $display("FAIL: Expected 0x80000000, got 0x%08h", result);
            $finish;
        end

        // Test case 5: Multiple shifts
        crs1 = 32'hFFFFFFFF; // All bits set
        shamt = 5'b00010;    // Shift by 2
        pw = 5'b00001;       // Pack width 1
        shift = 1;           // Shift operation
        rotate = 0;          // No rotate
        left = 1;            // Shift left
        right = 0;           // Not shifting right
        #10;
        if (result !== 32'hFFFFFFFC) begin
            $display("FAIL: Expected 0xFFFFFFFC, got 0x%08h", result);
            $finish;
        end

        // Test case 6: No operation
        crs1 = 32'h12345678; // Arbitrary value
        shamt = 5'b00000;    // No shift
        pw = 5'b00001;       // Pack width 1
        shift = 0;           // Not a shift operation
        rotate = 0;          // No rotate
        left = 0;            // Not shifting left
        right = 0;           // Not shifting right
        #10;
        if (result !== 32'h12345678) begin
            $display("FAIL: Expected 0x12345678, got 0x%08h", result);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule