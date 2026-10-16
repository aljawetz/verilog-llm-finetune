`timescale 1ns/1ps

module tb_mux_primitive;

    reg a_in;
    reg b_in;
    reg s_in;
    wire y_out;

    // Instantiate the module under test (uut)
    mux_primitive uut (
        .y_out(y_out),
        .a_in(a_in),
        .b_in(b_in),
        .s_in(s_in)
    );

    initial begin
        // Test case 1: s_in = 0, a_in = 1, b_in = 0
        a_in = 1; b_in = 0; s_in = 0;
        #10;
        if (y_out !== 1) $display("FAIL: Test case 1 failed, expected y_out = 1, got %b", y_out);

        // Test case 2: s_in = 0, a_in = 0, b_in = 1
        a_in = 0; b_in = 1; s_in = 0;
        #10;
        if (y_out !== 0) $display("FAIL: Test case 2 failed, expected y_out = 0, got %b", y_out);

        // Test case 3: s_in = 1, a_in = 1, b_in = 0
        a_in = 1; b_in = 0; s_in = 1;
        #10;
        if (y_out !== 0) $display("FAIL: Test case 3 failed, expected y_out = 0, got %b", y_out);

        // Test case 4: s_in = 1, a_in = 0, b_in = 1
        a_in = 0; b_in = 1; s_in = 1;
        #10;
        if (y_out !== 1) $display("FAIL: Test case 4 failed, expected y_out = 1, got %b", y_out);

        // Test case 5: s_in = 1, a_in = 1, b_in = 1
        a_in = 1; b_in = 1; s_in = 1;
        #10;
        if (y_out !== 1) $display("FAIL: Test case 5 failed, expected y_out = 1, got %b", y_out);

        // Test case 6: s_in = 0, a_in = 0, b_in = 0
        a_in = 0; b_in = 0; s_in = 0;
        #10;
        if (y_out !== 0) $display("FAIL: Test case 6 failed, expected y_out = 0, got %b", y_out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule