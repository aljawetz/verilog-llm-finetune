`timescale 1ns/1ps

module tb_jkff;
    reg j, k, clk, rst;
    wire q, qbar;

    // Instantiate the JK flip-flop
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
        rst = 1; j = 0; k = 0;
        #10; // Wait for 10ns
        rst = 0; // Release reset

        // Test case 1: Hold state (j=0, k=0)
        j = 0; k = 0;
        #10; // Wait for 1 clock cycle
        if (q !== 1'b0) $display("FAIL: Expected q=0 after hold state, got q=%b", q);

        // Test case 2: Reset state (j=0, k=1)
        j = 0; k = 1;
        #10; // Wait for 1 clock cycle
        if (q !== 1'b0 || qbar !== 1'b1) $display("FAIL: Expected q=0, qbar=1 after reset, got q=%b, qbar=%b", q, qbar);

        // Test case 3: Set state (j=1, k=0)
        j = 1; k = 0;
        #10; // Wait for 1 clock cycle
        if (q !== 1'b1 || qbar !== 1'b0) $display("FAIL: Expected q=1, qbar=0 after set, got q=%b, qbar=%b", q, qbar);

        // Test case 4: Toggle state (j=1, k=1)
        j = 1; k = 1;
        #10; // Wait for 1 clock cycle
        if (q !== 1'b0 || qbar !== 1'b1) $display("FAIL: Expected q=0, qbar=1 after toggle, got q=%b, qbar=%b", q, qbar);
        
        #10; // Wait for 1 clock cycle
        if (q !== 1'b1 || qbar !== 1'b0) $display("FAIL: Expected q=1, qbar=0 after toggle, got q=%b, qbar=%b", q, qbar);

        // Test case 5: Check hold state again (j=0, k=0)
        j = 0; k = 0;
        #10; // Wait for 1 clock cycle
        if (q !== 1'b1) $display("FAIL: Expected q=1 after hold state, got q=%b", q);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule