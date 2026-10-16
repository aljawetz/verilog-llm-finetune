`timescale 1ns/1ps

module tb_top_module;

    // Inputs
    reg a;
    reg b;

    // Outputs
    wire out_assign;
    wire out_alwaysblock;

    // Instantiate the module under test (uut)
    top_module uut (
        .a(a),
        .b(b),
        .out_assign(out_assign),
        .out_alwaysblock(out_alwaysblock)
    );

    initial begin
        // Test case 1: a = 0, b = 0
        a = 0; b = 0;
        #10;
        if (out_assign !== 0 || out_alwaysblock !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: a = 0, b = 1
        a = 0; b = 1;
        #10;
        if (out_assign !== 0 || out_alwaysblock !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: a = 1, b = 0
        a = 1; b = 0;
        #10;
        if (out_assign !== 0 || out_alwaysblock !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: a = 1, b = 1
        a = 1; b = 1;
        #10;
        if (out_assign !== 1 || out_alwaysblock !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule