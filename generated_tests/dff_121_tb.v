`timescale 1ns/1ps

module tb_dff;

    reg d, set, reset, clk;
    wire q, qbar;

    // Instantiate the D flip-flop
    dff uut (
        .q(q),
        .qbar(qbar),
        .d(d),
        .set(set),
        .reset(reset),
        .clk(clk)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        d = 0; set = 1; reset = 1;

        // Test 1: Normal operation
        #10; // Wait for clock edge
        d = 1; // Set D to 1
        #10; // Wait for clock edge
        if (q !== 1) begin
            $display("FAIL: Test 1 failed, expected q=1, got q=%b", q);
            $finish;
        end

        // Test 2: Reset functionality
        reset = 0; // Assert reset
        #10; // Wait for clock edge
        if (q !== 0) begin
            $display("FAIL: Test 2 failed, expected q=0, got q=%b", q);
            $finish;
        end
        reset = 1; // Deassert reset

        // Test 3: Set functionality
        set = 0; // Assert set
        #10; // Wait for clock edge
        if (q !== 1) begin
            $display("FAIL: Test 3 failed, expected q=1, got q=%b", q);
            $finish;
        end
        set = 1; // Deassert set

        // Test 4: Check D input propagation
        d = 0; // Set D to 0
        #10; // Wait for clock edge
        if (q !== 0) begin
            $display("FAIL: Test 4 failed, expected q=0, got q=%b", q);
            $finish;
        end

        // Test 5: Check D input propagation again
        d = 1; // Set D to 1
        #10; // Wait for clock edge
        if (q !== 1) begin
            $display("FAIL: Test 5 failed, expected q=1, got q=%b", q);
            $finish;
        end

        // Test 6: Check qbar output
        if (qbar !== ~q) begin
            $display("FAIL: Test 6 failed, expected qbar=%b, got qbar=%b", ~q, qbar);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule