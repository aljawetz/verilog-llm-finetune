`timescale 1ns/1ps

module tb_t_flipflop1;

    reg t;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the module under test (uut)
    t_flipflop1 uut (
        .t(t),
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        rst = 0; t = 0;
        #10; // Wait for a clock cycle
        rst = 1; // Release reset

        // Test case 1: Check reset functionality
        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 2: Check state retention when t = 0
        #10; // Wait for a clock cycle
        t = 0; // Set t to 0
        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: q did not retain state when t = 0");
            $finish;
        end

        // Test case 3: Check toggling when t = 1
        t = 1; // Set t to 1
        #10; // Wait for a clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not toggle to 1 when t = 1");
            $finish;
        end

        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: q did not toggle back to 0 on next clock with t = 1");
            $finish;
        end

        // Test case 4: Check state retention again when t = 0
        t = 0; // Set t to 0
        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: q did not retain state when t = 0 again");
            $finish;
        end

        // Test case 5: Check toggling again when t = 1
        t = 1; // Set t to 1
        #10; // Wait for a clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not toggle to 1 again when t = 1");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule