`timescale 1ns/1ps

module tb_mux_2_1;

    // Inputs
    reg a;
    reg b;
    reg sel;

    // Output
    wire y;

    // Instantiate the module under test (uut)
    mux_2_1 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test case 1: sel = 0, expect y = a
        a = 1'b0; b = 1'b1; sel = 1'b0; #10;
        if (y !== a) $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", a, y);

        // Test case 2: sel = 1, expect y = b
        a = 1'b0; b = 1'b1; sel = 1'b1; #10;
        if (y !== b) $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", b, y);

        // Test case 3: sel = 0, a = 1, expect y = a
        a = 1'b1; b = 1'b0; sel = 1'b0; #10;
        if (y !== a) $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", a, y);

        // Test case 4: sel = 1, b = 0, expect y = b
        a = 1'b1; b = 1'b0; sel = 1'b1; #10;
        if (y !== b) $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", b, y);

        // Test case 5: sel = 0, a = 0, b = 1, expect y = a
        a = 1'b0; b = 1'b1; sel = 1'b0; #10;
        if (y !== a) $display("FAIL: Test case 5 failed, expected y = %b, got y = %b", a, y);

        // Test case 6: sel = 1, a = 0, b = 1, expect y = b
        a = 1'b0; b = 1'b1; sel = 1'b1; #10;
        if (y !== b) $display("FAIL: Test case 6 failed, expected y = %b, got y = %b", b, y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule