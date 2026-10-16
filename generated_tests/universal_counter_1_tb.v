`timescale 1ns/1ps

module tb_universal_counter;

    reg clk;
    reg rst;
    reg en;
    reg up_down_count;
    reg load;
    reg [3:0] load_value;
    wire [3:0] count_out;

    // Instantiate the module under test (uut)
    universal_counter uut (
        .count_out(count_out),
        .clk(clk),
        .rst(rst),
        .en(en),
        .up_down_count(up_down_count),
        .load(load),
        .load_value(load_value)
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
        en = 0;
        load = 0;
        load_value = 4'b0000;
        up_down_count = 0;

        // Release reset
        #10;
        rst = 0;

        // Test loading a value
        load_value = 4'b1010; // Load value 10
        load = 1;
        en = 1;
        #10;
        load = 0; // Stop loading
        if (count_out !== 4'b1010) begin
            $display("FAIL: Expected count_out to be 1010 after loading, got %b", count_out);
            $finish;
        end

        // Test incrementing
        up_down_count = 1; // Set to increment
        #10;
        if (count_out !== 4'b1011) begin
            $display("FAIL: Expected count_out to be 1011 after increment, got %b", count_out);
            $finish;
        end

        // Increment again
        #10;
        if (count_out !== 4'b1100) begin
            $display("FAIL: Expected count_out to be 1100 after increment, got %b", count_out);
            $finish;
        end

        // Test decrementing
        up_down_count = 0; // Set to decrement
        #10;
        if (count_out !== 4'b1011) begin
            $display("FAIL: Expected count_out to be 1011 after decrement, got %b", count_out);
            $finish;
        end

        // Decrement again
        #10;
        if (count_out !== 4'b1010) begin
            $display("FAIL: Expected count_out to be 1010 after decrement, got %b", count_out);
            $finish;
        end

        // Test reset functionality
        rst = 1; // Assert reset
        #10;
        if (count_out !== 4'b0000) begin
            $display("FAIL: Expected count_out to be 0000 after reset, got %b", count_out);
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule