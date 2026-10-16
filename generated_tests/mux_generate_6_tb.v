`timescale 1ns/1ps

module tb_mux_generate;

    // Inputs
    reg i0;
    reg i1;
    reg i2;
    reg i3;
    reg [1:0] sel;

    // Output
    wire y;

    // Instantiate the Unit Under Test (UUT)
    mux_generate uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test case 1: Select i0
        i0 = 1; i1 = 0; i2 = 0; i3 = 0; sel = 2'b00;
        #10;
        if (y !== 1) $display("FAIL: Test case 1 failed, expected y=1, got y=%b", y);

        // Test case 2: Select i1
        i0 = 0; i1 = 1; i2 = 0; i3 = 0; sel = 2'b01;
        #10;
        if (y !== 1) $display("FAIL: Test case 2 failed, expected y=1, got y=%b", y);

        // Test case 3: Select i2
        i0 = 0; i1 = 0; i2 = 1; i3 = 0; sel = 2'b10;
        #10;
        if (y !== 1) $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);

        // Test case 4: Select i3
        i0 = 0; i1 = 0; i2 = 0; i3 = 1; sel = 2'b11;
        #10;
        if (y !== 1) $display("FAIL: Test case 4 failed, expected y=1, got y=%b", y);

        // Test case 5: All inputs low, select i0
        i0 = 0; i1 = 0; i2 = 0; i3 = 0; sel = 2'b00;
        #10;
        if (y !== 0) $display("FAIL: Test case 5 failed, expected y=0, got y=%b", y);

        // Test case 6: All inputs low, select i1
        i0 = 0; i1 = 0; i2 = 0; i3 = 0; sel = 2'b01;
        #10;
        if (y !== 0) $display("FAIL: Test case 6 failed, expected y=0, got y=%b", y);

        // Test case 7: All inputs low, select i2
        i0 = 0; i1 = 0; i2 = 0; i3 = 0; sel = 2'b10;
        #10;
        if (y !== 0) $display("FAIL: Test case 7 failed, expected y=0, got y=%b", y);

        // Test case 8: All inputs low, select i3
        i0 = 0; i1 = 0; i2 = 0; i3 = 0; sel = 2'b11;
        #10;
        if (y !== 0) $display("FAIL: Test case 8 failed, expected y=0, got y=%b", y);

        $display("PASS");
        $finish;
    end

endmodule