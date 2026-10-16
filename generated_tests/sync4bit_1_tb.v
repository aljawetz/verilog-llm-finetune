`timescale 1ns/1ps

module tb_sync4bit;

    reg clk;
    reg rst;
    reg load;
    reg up_down;
    reg [3:0] data;
    wire [3:0] count;

    // Instantiate the module under test (uut)
    sync4bit uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .up_down(up_down),
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
        up_down = 0;
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
        load = 0;
        if (count !== 4'b1010) begin
            $display("FAIL: Load value failed");
            $finish;
        end

        // Test incrementing
        up_down = 1; // Set to increment
        #10;
        if (count !== 4'b1011) begin
            $display("FAIL: Increment failed");
            $finish;
        end
        
        #10;
        if (count !== 4'b1100) begin
            $display("FAIL: Increment failed");
            $finish;
        end
        
        // Test decrementing
        up_down = 0; // Set to decrement
        #10;
        if (count !== 4'b1011) begin
            $display("FAIL: Decrement failed");
            $finish;
        end
        
        #10;
        if (count !== 4'b1010) begin
            $display("FAIL: Decrement failed");
            $finish;
        end
        
        // Test reset functionality
        rst = 1; // Assert reset
        #10;
        if (count !== 4'b0000) begin
            $display("FAIL: Reset failed");
            $finish;
        end
        
        // End of tests
        $display("PASS");
        $finish;
    end

endmodule