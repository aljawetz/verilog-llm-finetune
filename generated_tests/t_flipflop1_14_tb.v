`timescale 1ns/1ps

module tb_t_flipflop1;

    // Inputs
    reg t;
    reg clk;
    reg rst;

    // Outputs
    wire q;
    wire qbar;

    // Instantiate the Unit Under Test (UUT)
    t_flipflop1 uut (
        .t(t),
        .clk(clk),
        .rst(rst),
        .q(q),
        .qbar(qbar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        t = 0;

        // Apply reset
        #10;
        rst = 0;

        // Test case 1: T = 0, expect Q to remain 0
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 1 failed, expected q=0, qbar=1 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 2: T = 1, expect Q to toggle
        t = 1;
        #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 2 failed, expected q=1, qbar=0 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 3: T = 0, expect Q to remain 1
        t = 0;
        #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 3 failed, expected q=1, qbar=0 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 4: T = 1, expect Q to toggle back to 0
        t = 1;
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 4 failed, expected q=0, qbar=1 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 5: Assert reset functionality
        rst = 1;
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 5 failed after reset, expected q=0, qbar=1 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule