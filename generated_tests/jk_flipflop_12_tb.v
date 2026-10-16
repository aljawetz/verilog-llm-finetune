`timescale 1ns/1ps

module tb_jk_flipflop;

    reg j, k, clk, rst;
    wire q, qbar;

    // Instantiate the module under test (uut)
    jk_flipflop uut (
        .j(j),
        .k(k),
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
        j = 0; k = 0; rst = 1; #10; // Apply reset
        rst = 0; #10; // Release reset

        // Test case 1: J=0, K=0 (No change)
        j = 0; k = 0; #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: J=1, K=0 (Set)
        j = 1; k = 0; #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: J=0, K=1 (Reset)
        j = 0; k = 1; #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: J=1, K=1 (Toggle)
        j = 1; k = 1; #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end
        #10; // Wait for toggle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 4 failed on toggle");
            $finish;
        end

        // Test case 5: Check reset functionality
        rst = 1; #10; // Apply reset
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset functionality failed");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule