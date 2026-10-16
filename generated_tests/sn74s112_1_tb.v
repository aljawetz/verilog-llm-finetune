`timescale 1ns/1ps

module tb_sn74s112;

    reg j_h;
    reg k_h;
    reg clk_l;
    wire q_h;
    wire q_l;

    // Instantiate the module under test (uut)
    sn74s112 uut (
        .j_h(j_h),
        .k_h(k_h),
        .clk_l(clk_l),
        .q_h(q_h),
        .q_l(q_l)
    );

    // Clock generation
    initial begin
        clk_l = 1;
        forever #5 clk_l = ~clk_l; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        j_h = 0;
        k_h = 0;
        
        // Wait for the clock to stabilize
        #10;

        // Test case 1: Hold state (00)
        @(negedge clk_l);
        j_h = 0; k_h = 0;
        #1;
        if (q_h !== 0) $display("FAIL: Expected q_h = 0 after hold state, got %b", q_h);

        // Test case 2: Reset state (01)
        @(negedge clk_l);
        j_h = 0; k_h = 1;
        #1;
        if (q_h !== 0) $display("FAIL: Expected q_h = 0 after reset, got %b", q_h);

        // Test case 3: Set state (10)
        @(negedge clk_l);
        j_h = 1; k_h = 0;
        #1;
        if (q_h !== 1) $display("FAIL: Expected q_h = 1 after set, got %b", q_h);

        // Test case 4: Toggle state (11)
        @(negedge clk_l);
        j_h = 1; k_h = 1;
        #1;
        if (q_h !== 0) $display("FAIL: Expected q_h = 0 after toggle, got %b", q_h);

        // Toggle again
        @(negedge clk_l);
        j_h = 1; k_h = 1;
        #1;
        if (q_h !== 1) $display("FAIL: Expected q_h = 1 after toggle, got %b", q_h);

        // Final check for hold state
        @(negedge clk_l);
        j_h = 0; k_h = 0;
        #1;
        if (q_h !== 1) $display("FAIL: Expected q_h = 1 after hold state, got %b", q_h);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule