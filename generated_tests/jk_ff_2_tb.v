`timescale 1ns/1ps

module tb_jk_ff;

    reg j, k, clk, rst;
    wire q, qbar;

    // Instantiate the jk_ff module
    jk_ff uut (
        .q(q),
        .qbar(qbar),
        .j(j),
        .k(k),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1; j = 0; k = 0;
        #10; // Wait for 10ns
        rst = 0; // Release reset

        // Test case 1: Hold state (j=0, k=0)
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Hold state failed");
            $finish;
        end

        // Test case 2: Reset state (j=0, k=1)
        j = 0; k = 1;
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset state failed");
            $finish;
        end

        // Test case 3: Set state (j=1, k=0)
        j = 1; k = 0;
        #10; // Wait for 10ns
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Set state failed");
            $finish;
        end

        // Test case 4: Toggle state (j=1, k=1)
        j = 1; k = 1;
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Toggle state failed on first toggle");
            $finish;
        end
        #10; // Wait for another clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Toggle state failed on second toggle");
            $finish;
        end

        // Test case 5: Hold state again (j=0, k=0)
        j = 0; k = 0;
        #10; // Wait for 10ns
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Hold state after toggle failed");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule