`timescale 1ns/1ps

module tb_add3;
    reg clk;
    reg in_a;
    reg in_b;
    reg in_c;
    wire sum;

    // Instantiate the module under test
    add3 uut (
        .clk(clk),
        .in_a(in_a),
        .in_b(in_b),
        .in_c(in_c),
        .sum(sum)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        in_a = 0;
        in_b = 0;
        in_c = 0;

        // Wait for a clock edge
        #10;

        // Test case 1: 0 + 0 + 0 = 0
        in_a = 0; in_b = 0; in_c = 0;
        #10;
        if (sum !== 0) $display("FAIL: Expected sum = 0, got %b", sum);

        // Test case 2: 1 + 1 + 0 = 2
        in_a = 1; in_b = 1; in_c = 0;
        #10;
        if (sum !== 2) $display("FAIL: Expected sum = 2, got %b", sum);

        // Test case 3: 1 + 0 + 1 = 2
        in_a = 1; in_b = 0; in_c = 1;
        #10;
        if (sum !== 2) $display("FAIL: Expected sum = 2, got %b", sum);

        // Test case 4: 1 + 1 + 1 = 3
        in_a = 1; in_b = 1; in_c = 1;
        #10;
        if (sum !== 3) $display("FAIL: Expected sum = 3, got %b", sum);

        // Test case 5: 0 + 1 + 1 = 2
        in_a = 0; in_b = 1; in_c = 1;
        #10;
        if (sum !== 2) $display("FAIL: Expected sum = 2, got %b", sum);

        // Test case 6: 1 + 0 + 0 = 1
        in_a = 1; in_b = 0; in_c = 0;
        #10;
        if (sum !== 1) $display("FAIL: Expected sum = 1, got %b", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule