`timescale 1ns/1ps

module tb_mux_if;

    reg [1:0] sel;
    reg a, b, c, d;
    wire y;

    // Instantiate the module under test (uut)
    mux_if uut (
        .sel(sel),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .y(y)
    );

    initial begin
        // Test case 1: sel = 00, expect y = a
        a = 1; b = 0; c = 0; d = 0; sel = 2'b00;
        #10;
        if (y !== a) $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", a, y);

        // Test case 2: sel = 01, expect y = b
        a = 0; b = 1; c = 0; d = 0; sel = 2'b01;
        #10;
        if (y !== b) $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", b, y);

        // Test case 3: sel = 10, expect y = c
        a = 0; b = 0; c = 1; d = 0; sel = 2'b10;
        #10;
        if (y !== c) $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", c, y);

        // Test case 4: sel = 11, expect y = d
        a = 0; b = 0; c = 0; d = 1; sel = 2'b11;
        #10;
        if (y !== d) $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", d, y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule