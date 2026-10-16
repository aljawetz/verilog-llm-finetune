`timescale 1ns/1ps

module tb_top_module;

    reg clk;
    reg a;
    reg b;
    wire out_assign;
    wire out_always_comb;
    wire out_always_ff;

    // Instantiate the module under test (uut)
    top_module uut (
        .clk(clk),
        .a(a),
        .b(b),
        .out_assign(out_assign),
        .out_always_comb(out_always_comb),
        .out_always_ff(out_always_ff)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        a = 0;
        b = 0;
        #10;

        // Test case 1: a = 0, b = 0
        if (out_assign !== 0 || out_always_comb !== 0 || out_always_ff !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: a = 0, b = 1
        b = 1;
        #10;
        if (out_assign !== 1 || out_always_comb !== 1 || out_always_ff !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: a = 1, b = 0
        a = 1;
        b = 0;
        #10;
        if (out_assign !== 1 || out_always_comb !== 1 || out_always_ff !== 1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: a = 1, b = 1
        b = 1;
        #10;
        if (out_assign !== 0 || out_always_comb !== 0 || out_always_ff !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Check registered output after clock edge
        a = 0; b = 1; #10; // Change inputs
        if (out_always_ff !== 1) begin
            $display("FAIL: Registered output did not update correctly");
            $finish;
        end

        // Test case 6: Check registered output after another clock edge
        #10; // Wait for next clock edge
        if (out_always_ff !== 1) begin
            $display("FAIL: Registered output did not hold value correctly");
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule