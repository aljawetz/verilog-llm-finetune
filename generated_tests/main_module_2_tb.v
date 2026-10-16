`timescale 1ns/1ps

module tb_main_module;

    reg clk;
    reg reset;
    reg t;
    wire q;

    // Instantiate the module under test (uut)
    main_module uut (
        .clk(clk),
        .reset(reset),
        .t(t),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        t = 0;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Check reset functionality
        if (q !== 0) begin
            $display("FAIL: Reset did not clear q to 0");
            $finish;
        end

        // Test case 2: Toggle q when t is high
        t = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not toggle to 1 when t is high");
            $finish;
        end

        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: q did not toggle to 0 on next clock cycle");
            $finish;
        end

        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not toggle to 1 again on next clock cycle");
            $finish;
        end

        // Test case 3: Check that q does not change when t is low
        t = 0;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q changed when t is low");
            $finish;
        end

        // Test case 4: Check reset functionality again
        reset = 1;
        #10; // Wait for reset
        if (q !== 0) begin
            $display("FAIL: Reset did not clear q to 0 again");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule