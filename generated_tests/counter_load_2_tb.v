`timescale 1ns/1ps

module tb_counter_load;

    reg clk;
    reg u_d;
    reg load;
    reg rst;
    reg [7:0] data;
    wire [7:0] count;

    // Instantiate the module under test (uut)
    counter_load uut (
        .count(count),
        .clk(clk),
        .u_d(u_d),
        .load(load),
        .rst(rst),
        .data(data)
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
        u_d = 0;
        load = 0;
        data = 8'b0;

        // Reset the counter
        #10;
        rst = 0; // Release reset

        // Test loading data
        data = 8'hAA; // Load value 0xAA
        load = 1; 
        #10; // Wait for one clock cycle
        load = 0; // Stop loading

        // Check if count is loaded correctly
        if (count !== 8'hAA) begin
            $display("FAIL: Count not loaded correctly. Expected 0xAA, got %h", count);
            $finish;
        end

        // Test counting up
        u_d = 1; // Enable counting up
        #50; // Count for 5 clock cycles
        if (count !== 8'hAF) begin
            $display("FAIL: Count not incremented correctly. Expected 0xAF, got %h", count);
            $finish;
        end

        // Test counting down
        u_d = 0; // Disable counting up
        #50; // Count down for 5 clock cycles
        if (count !== 8'hAA) begin
            $display("FAIL: Count not decremented correctly. Expected 0xAA, got %h", count);
            $finish;
        end

        // Test reset functionality
        rst = 1; // Assert reset
        #10;
        rst = 0; // Release reset
        if (count !== 8'b0) begin
            $display("FAIL: Count not reset correctly. Expected 0x00, got %h", count);
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule