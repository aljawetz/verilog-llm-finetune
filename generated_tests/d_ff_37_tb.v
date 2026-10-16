`timescale 1ns/1ps

module tb_d_ff;

    reg d;
    reg clk;
    wire q;
    wire qbar;

    // Instantiate the D flip-flop
    d_ff uut (
        .d(d),
        .clk(clk),
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
        // Initialize
        d = 0;
        #10; // Wait for a clock edge

        // Test case 1: d = 0
        d = 0;
        #10; // Wait for a clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 1 failed. Expected q=0, qbar=1 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 2: d = 1
        d = 1;
        #10; // Wait for a clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 2 failed. Expected q=1, qbar=0 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 3: d = 0 again
        d = 0;
        #10; // Wait for a clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 3 failed. Expected q=0, qbar=1 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 4: d = 1 again
        d = 1;
        #10; // Wait for a clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 4 failed. Expected q=1, qbar=0 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule