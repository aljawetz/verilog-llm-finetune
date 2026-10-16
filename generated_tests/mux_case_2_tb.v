`timescale 1ns/1ps

module tb_mux_case;

    // Inputs
    reg i0;
    reg i1;
    reg i2;
    reg i3;
    reg [1:0] s;

    // Output
    wire f;

    // Instantiate the Unit Under Test (UUT)
    mux_case uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .s(s),
        .f(f)
    );

    initial begin
        // Test case 1: Select i0
        i0 = 1'b0; i1 = 1'b1; i2 = 1'b0; i3 = 1'b0; s = 2'b00;
        #10;
        if (f !== i0) $display("FAIL: Test case 1 failed, expected %b, got %b", i0, f);

        // Test case 2: Select i1
        i0 = 1'b0; i1 = 1'b1; i2 = 1'b0; i3 = 1'b0; s = 2'b01;
        #10;
        if (f !== i1) $display("FAIL: Test case 2 failed, expected %b, got %b", i1, f);

        // Test case 3: Select i2
        i0 = 1'b0; i1 = 1'b1; i2 = 1'b0; i3 = 1'b0; s = 2'b10;
        #10;
        if (f !== i2) $display("FAIL: Test case 3 failed, expected %b, got %b", i2, f);

        // Test case 4: Select i3
        i0 = 1'b0; i1 = 1'b1; i2 = 1'b0; i3 = 1'b1; s = 2'b11;
        #10;
        if (f !== i3) $display("FAIL: Test case 4 failed, expected %b, got %b", i3, f);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule