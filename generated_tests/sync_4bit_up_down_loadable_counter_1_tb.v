`timescale 1ns/1ps

module tb_sync_4bit_up_down_loadable_counter;

    reg [3:0] data;
    reg clk;
    reg rst;
    reg load_en;
    reg up_down;
    wire [3:0] q;

    // Instantiate the module under test (uut)
    sync_4bit_up_down_loadable_counter uut (
        .data(data),
        .clk(clk),
        .rst(rst),
        .load_en(load_en),
        .up_down(up_down),
        .q(q)
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
        load_en = 0;
        up_down = 0;
        data = 4'b0000;

        // Release reset
        #10;
        rst = 0;

        // Test loading data
        load_en = 1;
        data = 4'b1010; // Load 10
        #10;
        load_en = 0;
        if (q !== 4'b1010) begin
            $display("FAIL: Expected q = 1010 after loading, got q = %b", q);
            $finish;
        end

        // Test counting up
        up_down = 1; // Set to count up
        #10;
        if (q !== 4'b1011) begin
            $display("FAIL: Expected q = 1011 after counting up, got q = %b", q);
            $finish;
        end

        #10;
        if (q !== 4'b1100) begin
            $display("FAIL: Expected q = 1100 after counting up, got q = %b", q);
            $finish;
        end

        // Test counting down
        up_down = 0; // Set to count down
        #10;
        if (q !== 4'b1011) begin
            $display("FAIL: Expected q = 1011 after counting down, got q = %b", q);
            $finish;
        end

        #10;
        if (q !== 4'b1010) begin
            $display("FAIL: Expected q = 1010 after counting down, got q = %b", q);
            $finish;
        end

        // Test reset functionality
        rst = 1;
        #10;
        if (q !== 4'b0000) begin
            $display("FAIL: Expected q = 0000 after reset, got q = %b", q);
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule