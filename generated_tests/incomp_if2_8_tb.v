`timescale 1ns/1ps

module tb_incomp_if2;

    reg i0;
    reg i1;
    reg i2;
    reg i3;
    wire y;

    // Instantiate the module under test
    incomp_if2 uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .y(y)
    );

    initial begin
        // Test case 1: i0 is true, expect y to be i1
        i0 = 1; i1 = 8'b10101010; i2 = 0; i3 = 8'b11110000;
        #10;
        if (y !== i1) begin
            $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", i1, y);
            $finish;
        end

        // Test case 2: i0 is false, i2 is true, expect y to be i3
        i0 = 0; i1 = 8'b10101010; i2 = 1; i3 = 8'b11110000;
        #10;
        if (y !== i3) begin
            $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", i3, y);
            $finish;
        end

        // Test case 3: both i0 and i2 are false, expect y to remain unchanged
        i0 = 0; i1 = 8'b10101010; i2 = 0; i3 = 8'b11110000;
        #10;
        if (y !== i3) begin
            $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", i3, y);
            $finish;
        end

        // Test case 4: i0 is false, i2 is false, expect y to remain unchanged from previous
        i0 = 0; i1 = 8'b10101010; i2 = 0; i3 = 8'b11110000;
        #10;
        if (y !== i3) begin
            $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", i3, y);
            $finish;
        end

        // Test case 5: i0 is false, i2 is true, expect y to be i3
        i0 = 0; i1 = 8'b10101010; i2 = 1; i3 = 8'b11110000;
        #10;
        if (y !== i3) begin
            $display("FAIL: Test case 5 failed, expected y = %b, got y = %b", i3, y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule