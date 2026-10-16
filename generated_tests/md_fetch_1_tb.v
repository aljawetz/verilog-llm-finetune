`timescale 1ns/1ps

module tb_md_fetch;

    reg clk;
    reg rstn;
    reg enable;
    reg [5:0] cnt;
    reg [511:0] rf_512bit;
    wire [23:0] x1;
    wire [23:0] x2;
    wire [23:0] x3;

    // Instantiate the module under test
    md_fetch uut (
        .clk(clk),
        .rstn(rstn),
        .enable(enable),
        .cnt(cnt),
        .rf_512bit(rf_512bit),
        .x1(x1),
        .x2(x2),
        .x3(x3)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize signals
        rstn = 0;
        enable = 1;
        cnt = 0;
        rf_512bit = 512'h0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef;

        // Reset the module
        #10;
        rstn = 1;

        // Test cases
        #10; cnt = 6'd5; 
        #10; if (x1 !== 24'habcdef || x2 !== 24'h012345 || x3 !== 24'h6789) $display("FAIL: Test case 1 failed");
        
        #10; cnt = 6'd6; 
        #10; if (x1 !== 24'h9abcdef || x2 !== 24'h012345 || x3 !== 24'h6789) $display("FAIL: Test case 2 failed");

        #10; cnt = 6'd7; 
        #10; if (x1 !== 24'h89abcdef || x2 !== 24'h012345 || x3 !== 24'h6789) $display("FAIL: Test case 3 failed");

        #10; cnt = 6'd8; 
        #10; if (x1 !== 24'h6789abcdef || x2 !== 24'h012345 || x3 !== 24'h6789) $display("FAIL: Test case 4 failed");

        #10; cnt = 6'd9; 
        #10; if (x1 !== 24'h456789abcdef || x2 !== 24'h012345 || x3 !== 24'h6789) $display("FAIL: Test case 5 failed");

        // Add more test cases as needed...

        // Final check
        #10; cnt = 6'd40; 
        #10; if (x1 !== 24'h23 || x2 !== 24'h012345 || x3 !== 24'h6789) $display("FAIL: Test case 6 failed");

        // If all assertions pass
        $display("PASS");
        $finish;
    end

endmodule