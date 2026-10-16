`timescale 1ns/1ps

module tb_jkff;

    reg j;
    reg k;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

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
        // Initialize signals
        rst = 1; j = 0; k = 0;
        #10; // Wait for 10ns
        
        // Release reset
        rst = 0;
        #10;

        // Test case 1: Hold state (j=0, k=0)
        j = 0; k = 0;
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 1 failed (Hold state)");
            $finish;
        end

        // Test case 2: Reset state (j=0, k=1)
        j = 0; k = 1;
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 2 failed (Reset state)");
            $finish;
        end

        // Test case 3: Set state (j=1, k=0)
        j = 1; k = 0;
        #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 3 failed (Set state)");
            $finish;
        end

        // Test case 4: Toggle state (j=1, k=1)
        j = 1; k = 1;
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 4 failed (Toggle state first)");
            $finish;
        end
        
        #10; // Wait for another clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 4 failed (Toggle state second)");
            $finish;
        end

        // Test case 5: Asynchronous reset
        rst = 1;
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 5 failed (Asynchronous reset)");
            $finish;
        end
        
        // End of tests
        $display("PASS");
        $finish;
    end

endmodule