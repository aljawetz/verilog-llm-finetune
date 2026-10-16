`timescale 1ns/1ps

module tb_counter_12;

    reg rst_n;
    reg clk;
    reg valid_count;
    wire [3:0] out;

    // Instantiate the module under test (uut)
    counter_12 uut (
        .rst_n(rst_n),
        .clk(clk),
        .valid_count(valid_count),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0;
        valid_count = 0;
        
        // Apply reset
        #10;
        rst_n = 1; // Release reset
        
        // Test counting
        valid_count = 1; // Enable counting
        #10; // Wait for 1 clock cycle
        if (out !== 4'b0001) $display("FAIL: Expected out = 1, got out = %b", out);
        
        #10; // Wait for 1 clock cycle
        if (out !== 4'b0010) $display("FAIL: Expected out = 2, got out = %b", out);
        
        #10; // Wait for 1 clock cycle
        if (out !== 4'b0011) $display("FAIL: Expected out = 3, got out = %b", out);
        
        #10; // Wait for 1 clock cycle
        if (out !== 4'b0100) $display("FAIL: Expected out = 4, got out = %b", out);
        
        #10; // Wait for 1 clock cycle
        if (out !== 4'b0101) $display("FAIL: Expected out = 5, got out = %b", out);
        
        #10; // Wait for 1 clock cycle
        if (out !== 4'b0110) $display("FAIL: Expected out = 6, got out = %b", out);
        
        #10; // Wait for 1 clock cycle
        if (out !== 4'b0111) $display("FAIL: Expected out = 7, got out = %b", out);
        
        #10; // Wait for 1 clock cycle
        if (out !== 4'b1000) $display("FAIL: Expected out = 8, got out = %b", out);
        
        #10; // Wait for 1 clock cycle
        if (out !== 4'b1001) $display("FAIL: Expected out = 9, got out = %b", out);
        
        #10; // Wait for 1 clock cycle
        if (out !== 4'b1010) $display("FAIL: Expected out = 10, got out = %b", out);
        
        #10; // Wait for 1 clock cycle
        if (out !== 4'b1011) $display("FAIL: Expected out = 11, got out = %b", out);
        
        #10; // Wait for 1 clock cycle
        if (out !== 4'b0000) $display("FAIL: Expected out = 0, got out = %b", out);
        
        // Test reset functionality
        rst_n = 0; // Assert reset
        #10;
        if (out !== 4'b0000) $display("FAIL: Expected out = 0 after reset, got out = %b", out);
        
        rst_n = 1; // Release reset
        #10;
        valid_count = 1; // Enable counting again
        #10; // Wait for 1 clock cycle
        if (out !== 4'b0001) $display("FAIL: Expected out = 1 after reset, got out = %b", out);
        
        // Finish simulation
        $display("PASS");
        $finish;
    end

endmodule