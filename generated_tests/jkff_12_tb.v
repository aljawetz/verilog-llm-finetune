`timescale 1ns/1ps

module tb_jkff;

    reg j, k, clk, rst;
    wire q, qbar;

    // Instantiate the module under test (uut)
    jkff uut (
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
        j = 0; k = 0; rst = 1; // Reset state
        #10; // Wait for reset to take effect
        rst = 0; // Release reset

        // Test 1: Hold state
        j = 0; k = 0; #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Hold state failed");
            $finish;
        end

        // Test 2: Set state
        j = 1; k = 0; #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Set state failed");
            $finish;
        end

        // Test 3: Reset state
        j = 0; k = 1; #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset state failed");
            $finish;
        end

        // Test 4: Toggle state
        j = 1; k = 1; #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Toggle state failed (1)");
            $finish;
        end
        #10; // Wait for next clock
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Toggle state failed (2)");
            $finish;
        end

        // Test 5: Back to Set state
        j = 1; k = 0; #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Set state failed (after toggle)");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule