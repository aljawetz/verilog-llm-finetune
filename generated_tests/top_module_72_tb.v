`timescale 1ns/1ps

module tb_top_module;

    reg clk;
    reg reset;
    reg j;
    reg k;
    wire out;

    // Instantiate the module under test (uut)
    top_module uut (
        .clk(clk),
        .reset(reset),
        .j(j),
        .k(k),
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
        reset = 1;
        j = 0;
        k = 0;

        // Apply reset
        #10;
        reset = 0; // Release reset

        // Test case 1: Set j = 1, expect out = 1
        j = 1; k = 0; 
        #10;
        if (out !== 1) begin
            $display("FAIL: Expected out = 1, got out = %b", out);
            $finish;
        end

        // Test case 2: Set k = 1, expect out = 0
        j = 0; k = 1; 
        #10;
        if (out !== 0) begin
            $display("FAIL: Expected out = 0, got out = %b", out);
            $finish;
        end

        // Test case 3: Set j = 1 again, expect out = 1
        j = 1; k = 0; 
        #10;
        if (out !== 1) begin
            $display("FAIL: Expected out = 1, got out = %b", out);
            $finish;
        end

        // Test case 4: Set k = 1, expect out = 0
        j = 0; k = 1; 
        #10;
        if (out !== 0) begin
            $display("FAIL: Expected out = 0, got out = %b", out);
            $finish;
        end

        // Test case 5: Reset the module
        reset = 1; 
        #10;
        reset = 0; // Release reset
        j = 0; k = 0; 
        #10;
        if (out !== 0) begin
            $display("FAIL: Expected out = 0 after reset, got out = %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule