`timescale 1ns/1ps

module tb_dff;

    reg d;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the D flip-flop
    dff uut (
        .d(d),
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
        // Initialize
        rst = 1; d = 0;
        #10; // Wait for 10ns
        
        // Check reset behavior
        if (q !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end
        
        // Release reset
        rst = 0;
        #10; // Wait for 10ns
        
        // Test D input
        d = 1; #10; // Wait for one clock cycle
        if (q !== 1'b1 || qbar !== 1'b0) begin
            $display("FAIL: D input 1 did not set q to 1 and qbar to 0");
            $finish;
        end
        
        d = 0; #10; // Wait for one clock cycle
        if (q !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: D input 0 did not set q to 0 and qbar to 1");
            $finish;
        end
        
        // Test reset again
        rst = 1; #10; // Wait for reset
        if (q !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1 again");
            $finish;
        end
        
        // End of tests
        $display("PASS");
        $finish;
    end

endmodule