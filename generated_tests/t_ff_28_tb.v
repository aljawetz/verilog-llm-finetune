`timescale 1ns/1ps

module tb_t_ff;

    reg t;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the T flip-flop
    t_ff uut (
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
        // Initialize signals
        rst = 1; t = 0;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10; // Wait for 10ns

        // Test case 1: Toggle when t is high
        t = 1; 
        #10; // Wait for 10ns
        if (q !== 1'b1 || qbar !== 1'b0) begin
            $display("FAIL: Expected q=1, qbar=0 after first toggle");
            $finish;
        end

        // Test case 2: Hold state when t is low
        t = 0; 
        #10; // Wait for 10ns
        if (q !== 1'b1 || qbar !== 1'b0) begin
            $display("FAIL: Expected q=1, qbar=0 after holding state");
            $finish;
        end

        // Test case 3: Toggle again when t is high
        t = 1; 
        #10; // Wait for 10ns
        if (q !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: Expected q=0, qbar=1 after second toggle");
            $finish;
        end

        // Test case 4: Reset functionality
        rst = 1; 
        #10; // Wait for 10ns
        if (q !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: Expected q=0, qbar=1 after reset");
            $finish;
        end

        // Test case 5: Toggle after reset when t is high
        rst = 0; t = 1; 
        #10; // Wait for 10ns
        if (q !== 1'b1 || qbar !== 1'b0) begin
            $display("FAIL: Expected q=1, qbar=0 after toggle post-reset");
            $finish;
        end

        // Test case 6: Final toggle
        t = 1; 
        #10; // Wait for 10ns
        if (q !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: Expected q=0, qbar=1 after final toggle");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule