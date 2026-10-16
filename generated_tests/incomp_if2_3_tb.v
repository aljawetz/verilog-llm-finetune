`timescale 1ns/1ps

module tb_incomp_if2;

    // Inputs
    reg i0;
    reg i1;
    reg i2;
    reg i3;

    // Outputs
    wire y;

    // Instantiate the Unit Under Test (UUT)
    incomp_if2 uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .y(y)
    );

    initial begin
        // Test case 1: i0 = 1, expect y = i1
        i0 = 1; i1 = 1; i2 = 0; i3 = 0;
        #10;
        if (y !== i1) begin
            $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", i1, y);
            $finish;
        end

        // Test case 2: i0 = 0, i2 = 1, expect y = i3
        i0 = 0; i1 = 0; i2 = 1; i3 = 1;
        #10;
        if (y !== i3) begin
            $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", i3, y);
            $finish;
        end

        // Test case 3: i0 = 0, i2 = 0, expect y unchanged (should remain as previous y)
        i0 = 0; i1 = 0; i2 = 0; i3 = 0;
        #10;
        if (y !== 1) begin // y should still be 1 from test case 1
            $display("FAIL: Test case 3 failed, expected y = 1, got y = %b", y);
            $finish;
        end

        // Test case 4: i0 = 0, i2 = 1, expect y = i3
        i0 = 0; i1 = 0; i2 = 1; i3 = 0;
        #10;
        if (y !== i3) begin
            $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", i3, y);
            $finish;
        end

        // Test case 5: i0 = 1, expect y = i1
        i0 = 1; i1 = 0; i2 = 0; i3 = 1;
        #10;
        if (y !== i1) begin
            $display("FAIL: Test case 5 failed, expected y = %b, got y = %b", i1, y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule