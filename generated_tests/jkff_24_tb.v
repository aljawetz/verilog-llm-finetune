`timescale 1ns/1ps

module tb_jkff;

    reg j, k, clk, rst;
    wire q, qbar;

    // Instantiate the module under test
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

        // Test HOLD condition
        j = 0; k = 0; 
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: HOLD condition failed");
            $finish;
        end

        // Test SET condition
        j = 1; k = 0; 
        #10; // Wait for 10ns
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: SET condition failed");
            $finish;
        end

        // Test RESET condition
        j = 0; k = 1; 
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: RESET condition failed");
            $finish;
        end

        // Test TOGGLE condition
        j = 1; k = 1; 
        #10; // Wait for 10ns
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: TOGGLE condition failed on first toggle");
            $finish;
        end
        
        // Toggle again
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: TOGGLE condition failed on second toggle");
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule