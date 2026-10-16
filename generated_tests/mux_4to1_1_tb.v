`timescale 1ns/1ps

module tb_mux_4to1;

    // Inputs
    reg i0;
    reg i1;
    reg i2;
    reg i3;
    reg s0;
    reg s1;

    // Output
    wire y;

    // Instantiate the Unit Under Test (UUT)
    mux_4to1 uut (
        .y(y),
        .s0(s0),
        .s1(s1),
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3)
    );

    initial begin
        // Initialize inputs
        i0 = 0; i1 = 0; i2 = 0; i3 = 0;
        s0 = 0; s1 = 0;

        // Test case 1: Select i0
        i0 = 1; i1 = 0; i2 = 0; i3 = 0; s0 = 0; s1 = 0;
        #10;
        if (y !== 1) $display("FAIL: Test case 1 failed, expected y=1, got y=%b", y);

        // Test case 2: Select i1
        i0 = 0; i1 = 1; i2 = 0; i3 = 0; s0 = 1; s1 = 0;
        #10;
        if (y !== 1) $display("FAIL: Test case 2 failed, expected y=1, got y=%b", y);

        // Test case 3: Select i2
        i0 = 0; i1 = 0; i2 = 1; i3 = 0; s0 = 0; s1 = 1;
        #10;
        if (y !== 1) $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);

        // Test case 4: Select i3
        i0 = 0; i1 = 0; i2 = 0; i3 = 1; s0 = 1; s1 = 1;
        #10;
        if (y !== 1) $display("FAIL: Test case 4 failed, expected y=1, got y=%b", y);

        // Test case 5: All inputs low
        i0 = 0; i1 = 0; i2 = 0; i3 = 0; s0 = 0; s1 = 0;
        #10;
        if (y !== 0) $display("FAIL: Test case 5 failed, expected y=0, got y=%b", y);

        // Test case 6: Random inputs
        i0 = 1; i1 = 1; i2 = 0; i3 = 0; s0 = 0; s1 = 1; // should select i2
        #10;
        if (y !== 0) $display("FAIL: Test case 6 failed, expected y=0, got y=%b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule