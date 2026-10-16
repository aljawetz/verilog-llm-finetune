`timescale 1ns/1ps

module tb_mux4x1;

    // Inputs
    reg i0;
    reg i1;
    reg i2;
    reg i3;
    reg [1:0] sel;

    // Output
    wire out;

    // Instantiate the Unit Under Test (UUT)
    mux4x1 uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Initialize inputs
        i0 = 0; i1 = 0; i2 = 0; i3 = 0; sel = 2'b00;

        // Test case 1: Select i0
        i0 = 1; i1 = 0; i2 = 0; i3 = 0; sel = 2'b00;
        #10;
        if (out !== 1) $display("FAIL: Test case 1 failed, expected out = 1, got out = %b", out);

        // Test case 2: Select i1
        i0 = 0; i1 = 1; i2 = 0; i3 = 0; sel = 2'b01;
        #10;
        if (out !== 1) $display("FAIL: Test case 2 failed, expected out = 1, got out = %b", out);

        // Test case 3: Select i2
        i0 = 0; i1 = 0; i2 = 1; i3 = 0; sel = 2'b10;
        #10;
        if (out !== 1) $display("FAIL: Test case 3 failed, expected out = 1, got out = %b", out);

        // Test case 4: Select i3
        i0 = 0; i1 = 0; i2 = 0; i3 = 1; sel = 2'b11;
        #10;
        if (out !== 1) $display("FAIL: Test case 4 failed, expected out = 1, got out = %b", out);

        // Test case 5: Default case (invalid sel)
        i0 = 0; i1 = 0; i2 = 0; i3 = 0; sel = 2'bxx; // Invalid selector
        #10;
        if (out !== 0) $display("FAIL: Test case 5 failed, expected out = 0, got out = %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule