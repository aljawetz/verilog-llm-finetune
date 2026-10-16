`timescale 1ns/1ps

module tb_dff;

    reg clk;
    reg rst_n;
    reg d;
    wire q;

    // Instantiate the D flip-flop
    dff uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        rst_n = 0; // Assert reset
        d = 0;
        #10; // Wait for 10ns
        
        // Check reset behavior
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end
        
        // Release reset
        rst_n = 1;
        #10; // Wait for 10ns
        
        // Test setting d to 1
        d = 1;
        #10; // Wait for 10ns
        if (q !== 1) begin
            $display("FAIL: q did not follow d after clock edge");
            $finish;
        end
        
        // Test setting d to 0
        d = 0;
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: q did not follow d after clock edge");
            $finish;
        end
        
        // Test reset again
        rst_n = 0; // Assert reset
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end
        
        // Release reset and test again
        rst_n = 1;
        #10; // Wait for 10ns
        d = 1;
        #10; // Wait for 10ns
        if (q !== 1) begin
            $display("FAIL: q did not follow d after clock edge");
            $finish;
        end
        
        // Final check
        $display("PASS");
        $finish;
    end

endmodule