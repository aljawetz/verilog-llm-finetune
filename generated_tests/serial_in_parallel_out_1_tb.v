`timescale 1ns/1ps

module tb_serial_in_parallel_out;

    reg clk;
    reg rst_n;
    reg in;
    wire [3:0] out;

    // Instantiate the module under test (uut)
    serial_in_parallel_out uut (
        .clk(clk),
        .rst_n(rst_n),
        .in(in),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst_n = 0;
        in = 0;

        // Apply reset
        #10;
        rst_n = 1; // Release reset

        // Test case 1: Shift in 4 bits (1011)
        in = 1; #10; // out should be 0001
        if (out !== 4'b0001) $display("FAIL: Expected out = 0001, got out = %b", out);
        
        in = 0; #10; // out should be 0010
        if (out !== 4'b0010) $display("FAIL: Expected out = 0010, got out = %b", out);
        
        in = 1; #10; // out should be 0101
        if (out !== 4'b0101) $display("FAIL: Expected out = 0101, got out = %b", out);
        
        in = 1; #10; // out should be 1011
        if (out !== 4'b1011) $display("FAIL: Expected out = 1011, got out = %b", out);
        
        // Test case 2: Reset the module
        rst_n = 0; #10; // out should be 0000
        if (out !== 4'b0000) $display("FAIL: Expected out = 0000 after reset, got out = %b", out);
        
        rst_n = 1; // Release reset
        in = 0; #10; // out should be 0000
        if (out !== 4'b0000) $display("FAIL: Expected out = 0000, got out = %b", out);
        
        // Test case 3: Shift in 4 bits (1100)
        in = 1; #10; // out should be 0001
        if (out !== 4'b0001) $display("FAIL: Expected out = 0001, got out = %b", out);
        
        in = 1; #10; // out should be 0011
        if (out !== 4'b0011) $display("FAIL: Expected out = 0011, got out = %b", out);
        
        in = 0; #10; // out should be 0110
        if (out !== 4'b0110) $display("FAIL: Expected out = 0110, got out = %b", out);
        
        in = 0; #10; // out should be 1100
        if (out !== 4'b1100) $display("FAIL: Expected out = 1100, got out = %b", out);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule