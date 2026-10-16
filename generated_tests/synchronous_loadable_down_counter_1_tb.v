`timescale 1ns/1ps

module tb_synchronous_loadable_down_counter;

    reg clk;
    reg rst;
    reg load;
    reg [3:0] data;
    wire [3:0] count;

    // Instantiate the module under test (uut)
    synchronous_loadable_down_counter uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .data(data),
        .count(count)
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
        load = 0;
        data = 4'b0000;

        // Wait for a clock cycle
        #10;
        
        // Release reset
        rst = 0;
        #10;

        // Test loading a value
        data = 4'b1010; // Load 10
        load = 1;
        #10;
        load = 0; // Stop loading

        // Check if count is loaded correctly
        if (count !== 4'b1010) begin
            $display("FAIL: Count did not load correctly");
            $finish;
        end

        // Test decrementing
        #10; // Wait for a clock cycle
        if (count !== 4'b1001) begin
            $display("FAIL: Count did not decrement correctly");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (count !== 4'b1000) begin
            $display("FAIL: Count did not decrement correctly");
            $finish;
        end

        // Test reset functionality
        rst = 1; // Assert reset
        #10;
        rst = 0; // Release reset

        // Check if count is reset to 0
        if (count !== 4'b0000) begin
            $display("FAIL: Count did not reset to zero");
            $finish;
        end

        // Test loading another value
        data = 4'b0011; // Load 3
        load = 1;
        #10;
        load = 0; // Stop loading

        // Check if count is loaded correctly
        if (count !== 4'b0011) begin
            $display("FAIL: Count did not load correctly");
            $finish;
        end

        // Decrement to zero
        #10; // 2
        #10; // 1
        #10; // 0
        if (count !== 4'b0000) begin
            $display("FAIL: Count did not decrement to zero correctly");
            $finish;
        end

        // Final check after reset
        rst = 1; // Assert reset
        #10;
        rst = 0; // Release reset

        // Check if count is reset to 0
        if (count !== 4'b0000) begin
            $display("FAIL: Count did not reset to zero");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule