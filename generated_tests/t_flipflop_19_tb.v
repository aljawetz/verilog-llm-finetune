`timescale 1ns/1ps

module tb_t_flipflop;

    reg t;
    reg clk;
    reg rst;
    wire q;
    wire qb;

    // Instantiate the module under test (uut)
    t_flipflop uut (
        .t(t),
        .clk(clk),
        .rst(rst),
        .q(q),
        .qb(qb)
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
        #10; // Wait for a clock edge
        
        // Test reset functionality
        if (q !== 1'b0 || qb !== 1'b1) begin
            $display("FAIL: Reset did not set q to 0 and qb to 1");
            $finish;
        end
        
        // Release reset
        rst = 0;
        #10; // Wait for a clock edge
        
        // Test t = 0
        t = 0;
        #10; // Wait for a clock edge
        if (q !== 1'b1 || qb !== 1'b0) begin
            $display("FAIL: Expected q=1, qb=0 when t=0");
            $finish;
        end
        
        // Test t = 1
        t = 1;
        #10; // Wait for a clock edge
        if (q !== 1'b0 || qb !== 1'b1) begin
            $display("FAIL: Expected q=0, qb=1 when t=1");
            $finish;
        end
        
        // Test reset again
        rst = 1;
        #10; // Wait for a clock edge
        if (q !== 1'b0 || qb !== 1'b1) begin
            $display("FAIL: Reset did not set q to 0 and qb to 1");
            $finish;
        end
        
        // End of tests
        $display("PASS");
        $finish;
    end

endmodule