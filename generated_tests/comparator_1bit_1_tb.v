`timescale 1ns/1ps

module tb_comparator_1bit;

    reg a_in;
    reg b_in;
    wire g_out;
    wire e_out;
    wire l_out;

    // Instantiate the module under test (uut)
    comparator_1bit uut (
        .a_in(a_in),
        .b_in(b_in),
        .g_out(g_out),
        .e_out(e_out),
        .l_out(l_out)
    );

    initial begin
        // Test case 1: a_in = 0, b_in = 0
        a_in = 0; b_in = 0;
        #10;
        if (g_out !== 0 || e_out !== 1 || l_out !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: a_in = 0, b_in = 1
        a_in = 0; b_in = 1;
        #10;
        if (g_out !== 0 || e_out !== 0 || l_out !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: a_in = 1, b_in = 0
        a_in = 1; b_in = 0;
        #10;
        if (g_out !== 1 || e_out !== 0 || l_out !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: a_in = 1, b_in = 1
        a_in = 1; b_in = 1;
        #10;
        if (g_out !== 0 || e_out !== 1 || l_out !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule