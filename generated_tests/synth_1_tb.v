`timescale 1ns/1ps

module tb_synth;

    reg a_in;
    reg b_in;
    reg c_in;
    reg d_in;
    wire y_out;

    // Instantiate the module under test (uut)
    synth uut (
        .a_in(a_in),
        .b_in(b_in),
        .c_in(c_in),
        .d_in(d_in),
        .y_out(y_out)
    );

    initial begin
        // Test Case 1: All inputs are 0
        a_in = 0; b_in = 0; c_in = 0; d_in = 0;
        #10;
        if (y_out !== 0) $display("FAIL: Test Case 1 failed, expected 0, got %b", y_out);

        // Test Case 2: One input is 1
        a_in = 1; b_in = 0; c_in = 0; d_in = 0;
        #10;
        if (y_out !== 0) $display("FAIL: Test Case 2 failed, expected 0, got %b", y_out);

        // Test Case 3: Two inputs are 1
        a_in = 1; b_in = 1; c_in = 0; d_in = 0;
        #10;
        if (y_out !== 0) $display("FAIL: Test Case 3 failed, expected 0, got %b", y_out);

        // Test Case 4: Three inputs are 1
        a_in = 1; b_in = 1; c_in = 1; d_in = 0;
        #10;
        if (y_out !== 0) $display("FAIL: Test Case 4 failed, expected 0, got %b", y_out);

        // Test Case 5: All inputs are 1
        a_in = 1; b_in = 1; c_in = 1; d_in = 1;
        #10;
        if (y_out !== 1) $display("FAIL: Test Case 5 failed, expected 1, got %b", y_out);

        // Test Case 6: Mixed inputs
        a_in = 1; b_in = 1; c_in = 0; d_in = 1;
        #10;
        if (y_out !== 0) $display("FAIL: Test Case 6 failed, expected 0, got %b", y_out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule