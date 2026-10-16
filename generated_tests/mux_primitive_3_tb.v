`timescale 1ns/1ps

module tb_mux_primitive;

    // Inputs
    reg a_in;
    reg b_in;
    reg s_in;

    // Output
    wire y_out;

    // Instantiate the Unit Under Test (UUT)
    mux_primitive uut (
        .y_out(y_out),
        .a_in(a_in),
        .b_in(b_in),
        .s_in(s_in)
    );

    initial begin
        // Test case 1: s_in = 0, expect y_out = a_in
        a_in = 1; b_in = 0; s_in = 0; #10;
        if (y_out !== a_in) begin
            $display("FAIL: Test case 1 failed, expected y_out = %b, got y_out = %b", a_in, y_out);
            $finish;
        end

        // Test case 2: s_in = 1, expect y_out = b_in
        a_in = 0; b_in = 1; s_in = 1; #10;
        if (y_out !== b_in) begin
            $display("FAIL: Test case 2 failed, expected y_out = %b, got y_out = %b", b_in, y_out);
            $finish;
        end

        // Test case 3: s_in = 0, expect y_out = a_in
        a_in = 1; b_in = 1; s_in = 0; #10;
        if (y_out !== a_in) begin
            $display("FAIL: Test case 3 failed, expected y_out = %b, got y_out = %b", a_in, y_out);
            $finish;
        end

        // Test case 4: s_in = 1, expect y_out = b_in
        a_in = 0; b_in = 0; s_in = 1; #10;
        if (y_out !== b_in) begin
            $display("FAIL: Test case 4 failed, expected y_out = %b, got y_out = %b", b_in, y_out);
            $finish;
        end

        // Test case 5: s_in = 0, expect y_out = a_in
        a_in = 1; b_in = 0; s_in = 0; #10;
        if (y_out !== a_in) begin
            $display("FAIL: Test case 5 failed, expected y_out = %b, got y_out = %b", a_in, y_out);
            $finish;
        end

        // Test case 6: s_in = 1, expect y_out = b_in
        a_in = 0; b_in = 1; s_in = 1; #10;
        if (y_out !== b_in) begin
            $display("FAIL: Test case 6 failed, expected y_out = %b, got y_out = %b", b_in, y_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule