`timescale 1ns/1ps

module tb_example;
    reg clk;
    reg in_a, in_b, in_c, in_d, in_e, in_f, in_g, in_h, in_i;
    wire sum;

    // Instantiate the module under test (uut)
    example uut (
        .clk(clk),
        .in_a(in_a),
        .in_b(in_b),
        .in_c(in_c),
        .in_d(in_d),
        .in_e(in_e),
        .in_f(in_f),
        .in_g(in_g),
        .in_h(in_h),
        .in_i(in_i),
        .sum(sum)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        in_a = 0; in_b = 0; in_c = 0; in_d = 0;
        in_e = 0; in_f = 0; in_g = 0; in_h = 0; in_i = 0;

        // Wait for a clock edge
        @(posedge clk);
        
        // Test case 1: All inputs are 0
        #1;
        if (sum !== 0) $display("FAIL: Test case 1 failed, expected sum=0, got sum=%b", sum);

        // Test case 2: All inputs are 1
        in_a = 1; in_b = 1; in_c = 1; in_d = 1;
        in_e = 1; in_f = 1; in_g = 1; in_h = 1; in_i = 1;
        @(posedge clk);
        #1;
        if (sum !== 9) $display("FAIL: Test case 2 failed, expected sum=9, got sum=%b", sum);

        // Test case 3: Mixed inputs
        in_a = 1; in_b = 0; in_c = 1; in_d = 0;
        in_e = 1; in_f = 0; in_g = 1; in_h = 0; in_i = 1;
        @(posedge clk);
        #1;
        if (sum !== 5) $display("FAIL: Test case 3 failed, expected sum=5, got sum=%b", sum);

        // Test case 4: All inputs are 0 except in_i
        in_a = 0; in_b = 0; in_c = 0; in_d = 0;
        in_e = 0; in_f = 0; in_g = 0; in_h = 0; in_i = 5;
        @(posedge clk);
        #1;
        if (sum !== 5) $display("FAIL: Test case 4 failed, expected sum=5, got sum=%b", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule