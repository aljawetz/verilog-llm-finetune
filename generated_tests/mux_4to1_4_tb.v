`timescale 1ns/1ps

module tb_mux_4to1;

    reg [3:0] a, b, c, d;
    reg [1:0] sel;
    wire [3:0] y;

    // Instantiate the module under test (uut)
    mux_4to1 uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test case 1: Select input a
        a = 4'b0001; b = 4'b0010; c = 4'b0011; d = 4'b0100; sel = 2'b00;
        #10;
        if (y !== a) $display("FAIL: Test case 1 failed, expected %b, got %b", a, y);

        // Test case 2: Select input b
        sel = 2'b01;
        #10;
        if (y !== b) $display("FAIL: Test case 2 failed, expected %b, got %b", b, y);

        // Test case 3: Select input c
        sel = 2'b10;
        #10;
        if (y !== c) $display("FAIL: Test case 3 failed, expected %b, got %b", c, y);

        // Test case 4: Select input d
        sel = 2'b11;
        #10;
        if (y !== d) $display("FAIL: Test case 4 failed, expected %b, got %b", d, y);

        // Test case 5: Default case (not used in this design, but good to check)
        sel = 2'bxx; // Invalid selection
        #10;
        if (y !== 4'b0000) $display("FAIL: Test case 5 failed, expected 0000, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule