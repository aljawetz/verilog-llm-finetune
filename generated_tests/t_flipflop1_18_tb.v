`timescale 1ns/1ps

module tb_t_flipflop1;

    reg t;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the module under test (uut)
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
        rst = 1; t = 0;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test case 1: Toggle when t=1
        t = 1; 
        #10; // Wait for clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 1 failed, expected q=1, qbar=0 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 2: Toggle again
        #10; // Wait for clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 2 failed, expected q=0, qbar=1 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 3: No toggle when t=0
        t = 0; 
        #10; // Wait for clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 3 failed, expected q=0, qbar=1 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 4: Reset functionality
        rst = 1; 
        #10; // Wait for reset
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 4 failed, expected q=0, qbar=1 after reset but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 5: Toggle after reset
        rst = 0; t = 1; 
        #10; // Wait for clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 5 failed, expected q=1, qbar=0 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule