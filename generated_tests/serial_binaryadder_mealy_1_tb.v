`timescale 1ns/1ps

module tb_serial_binaryadder_mealy;
    parameter width = 8;
    reg [width-1:0] a_in;
    reg [width-1:0] b_in;
    reg clk;
    reg reset_n;
    wire d_out;

    // Instantiate the module under test (uut)
    serial_binaryadder_mealy uut (
        .a_in(a_in),
        .b_in(b_in),
        .clk(clk),
        .reset_n(reset_n),
        .d_out(d_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        a_in = 8'b00000000;
        b_in = 8'b00000000;
        reset_n = 0; // Assert reset
        #10;
        
        reset_n = 1; // Deassert reset
        #10;

        // Test case 1: Add 1 + 1
        a_in = 8'b00000001;
        b_in = 8'b00000001;
        #10;
        if (d_out !== 0) $display("FAIL: Expected d_out=0 for 1+1 at time %0t", $time);

        // Test case 2: Add 1 + 0
        a_in = 8'b00000001;
        b_in = 8'b00000000;
        #10;
        if (d_out !== 1) $display("FAIL: Expected d_out=1 for 1+0 at time %0t", $time);

        // Test case 3: Add 0 + 1
        a_in = 8'b00000000;
        b_in = 8'b00000001;
        #10;
        if (d_out !== 1) $display("FAIL: Expected d_out=1 for 0+1 at time %0t", $time);

        // Test case 4: Add 1 + 2
        a_in = 8'b00000001;
        b_in = 8'b00000010;
        #10;
        if (d_out !== 0) $display("FAIL: Expected d_out=0 for 1+2 at time %0t", $time);

        // Test case 5: Add 2 + 2
        a_in = 8'b00000010;
        b_in = 8'b00000010;
        #10;
        if (d_out !== 1) $display("FAIL: Expected d_out=1 for 2+2 at time %0t", $time);

        // Test case 6: Add 3 + 3
        a_in = 8'b00000011;
        b_in = 8'b00000011;
        #10;
        if (d_out !== 1) $display("FAIL: Expected d_out=1 for 3+3 at time %0t", $time);

        // Test case 7: Add 0 + 0
        a_in = 8'b00000000;
        b_in = 8'b00000000;
        #10;
        if (d_out !== 0) $display("FAIL: Expected d_out=0 for 0+0 at time %0t", $time);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule