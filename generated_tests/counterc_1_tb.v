`timescale 1ns/1ps

module tb_counterc;

    reg clk;
    reg rst;
    reg enable;
    reg load;
    reg [4:0] cnt_in;
    wire [4:0] cnt_out;

    // Instantiate the counterc module
    counterc uut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .load(load),
        .cnt_in(cnt_in),
        .cnt_out(cnt_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        enable = 0;
        load = 0;
        cnt_in = 5'b00000;

        // Wait for a clock cycle
        #10;
        
        // Release reset
        rst = 0;
        #10;

        // Test incrementing
        enable = 1;
        #20;
        if (cnt_out !== 5'b00010) $display("FAIL: Expected cnt_out = 2, got %b", cnt_out);

        // Test loading a value
        load = 1;
        cnt_in = 5'b00101; // Load value 5
        #10;
        if (cnt_out !== 5'b00101) $display("FAIL: Expected cnt_out = 5, got %b", cnt_out);

        // Test clearing the count
        load = 1'b1; // Clear
        #10;
        if (cnt_out !== 5'b00000) $display("FAIL: Expected cnt_out = 0, got %b", cnt_out);

        // Test incrementing again
        load = 1'b0; // Disable load
        #10;
        if (cnt_out !== 5'b00001) $display("FAIL: Expected cnt_out = 1, got %b", cnt_out);

        // Test loading another value
        load = 1'b1;
        cnt_in = 5'b00011; // Load value 3
        #10;
        if (cnt_out !== 5'b00011) $display("FAIL: Expected cnt_out = 3, got %b", cnt_out);

        // Test reset functionality
        rst = 1;
        #10;
        if (cnt_out !== 5'b00000) $display("FAIL: Expected cnt_out = 0 after reset, got %b", cnt_out);

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule