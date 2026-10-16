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
        // Test Case 1: s_in = 0, a_in = 1, b_in = 0
        a_in = 1; b_in = 0; s_in = 0;
        #10;
        if (y_out !== 1) begin
            $display("FAIL: Test Case 1 failed, expected y_out = 1, got y_out = %b", y_out);
            $finish;
        end

        // Test Case 2: s_in = 0, a_in = 0, b_in = 1
        a_in = 0; b_in = 1; s_in = 0;
        #10;
        if (y_out !== 0) begin
            $display("FAIL: Test Case 2 failed, expected y_out = 0, got y_out = %b", y_out);
            $finish;
        end

        // Test Case 3: s_in = 1, a_in = 1, b_in = 0
        a_in = 1; b_in = 0; s_in = 1;
        #10;
        if (y_out !== 0) begin
            $display("FAIL: Test Case 3 failed, expected y_out = 0, got y_out = %b", y_out);
            $finish;
        end

        // Test Case 4: s_in = 1, a_in = 0, b_in = 1
        a_in = 0; b_in = 1; s_in = 1;
        #10;
        if (y_out !== 1) begin
            $display("FAIL: Test Case 4 failed, expected y_out = 1, got y_out = %b", y_out);
            $finish;
        end

        // Test Case 5: s_in = 0, a_in = 1, b_in = 1
        a_in = 1; b_in = 1; s_in = 0;
        #10;
        if (y_out !== 1) begin
            $display("FAIL: Test Case 5 failed, expected y_out = 1, got y_out = %b", y_out);
            $finish;
        end

        // Test Case 6: s_in = 1, a_in = 1, b_in = 1
        a_in = 1; b_in = 1; s_in = 1;
        #10;
        if (y_out !== 1) begin
            $display("FAIL: Test Case 6 failed, expected y_out = 1, got y_out = %b", y_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule