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
        // Initialize Inputs
        i0 = 0;
        i1 = 0;
        i2 = 0;
        i3 = 0;

        // Test case 1: i0 is high, y should be i1
        i0 = 1; i1 = 1; i2 = 0; i3 = 0;
        #10;
        if (y !== 1) $display("FAIL: Test case 1 failed, expected y=1, got y=%b", y);

        // Test case 2: i0 is low, i2 is high, y should be i3
        i0 = 0; i1 = 0; i2 = 1; i3 = 1;
        #10;
        if (y !== 1) $display("FAIL: Test case 2 failed, expected y=1, got y=%b", y);

        // Test case 3: Both i0 and i2 are low, y should remain unchanged
        i0 = 0; i1 = 0; i2 = 0; i3 = 1;
        #10;
        if (y !== 1) $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);

        // Test case 4: i0 is low, i2 is low, y should remain unchanged
        i0 = 0; i1 = 0; i2 = 0; i3 = 0;
        #10;
        if (y !== 1) $display("FAIL: Test case 4 failed, expected y=1, got y=%b", y);

        // Test case 5: i0 is high, y should be i1
        i0 = 1; i1 = 0; i2 = 0; i3 = 0;
        #10;
        if (y !== 0) $display("FAIL: Test case 5 failed, expected y=0, got y=%b", y);

        // Test case 6: i0 is low, i2 is high, y should be i3
        i0 = 0; i1 = 0; i2 = 1; i3 = 0;
        #10;
        if (y !== 0) $display("FAIL: Test case 6 failed, expected y=0, got y=%b", y);

        // Test case 7: i0 is high, y should be i1
        i0 = 1; i1 = 1; i2 = 1; i3 = 0;
        #10;
        if (y !== 1) $display("FAIL: Test case 7 failed, expected y=1, got y=%b", y);

        // Test case 8: i0 is low, i2 is high, y should be i3
        i0 = 0; i1 = 0; i2 = 1; i3 = 1;
        #10;
        if (y !== 1) $display("FAIL: Test case 8 failed, expected y=1, got y=%b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule