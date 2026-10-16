`timescale 1ns/1ps

module tb_counter_load;

    reg clk;
    reg u_d;
    reg load;
    reg rst;
    reg [7:0] data;
    wire [7:0] count;

    // Instantiate the counter_load module
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
        // Initialize inputs
        rst = 1;
        u_d = 0;
        load = 0;
        data = 8'b0;

        // Wait for a clock cycle
        #10;

        // Release reset
        rst = 0;
        #10;

        // Test loading data
        data = 8'b10101010; // Load data
        load = 1; // Assert load
        #10;
        load = 0; // Deassert load

        if (count !== 8'b10101010) begin
            $display("FAIL: Count should be 10101010 after loading data");
            $finish;
        end

        // Test incrementing
        u_d = 1; // Set to increment
        #10; // Wait for clock
        if (count !== 8'b10101011) begin
            $display("FAIL: Count should be 10101011 after incrementing");
            $finish;
        end

        // Increment a few more times
        #10; // Wait for clock
        if (count !== 8'b10101100) begin
            $display("FAIL: Count should be 10101100 after incrementing again");
            $finish;
        end

        #10; // Wait for clock
        if (count !== 8'b10101101) begin
            $display("FAIL: Count should be 10101101 after incrementing again");
            $finish;
        end

        // Test decrementing
        u_d = 0; // Set to decrement
        #10; // Wait for clock
        if (count !== 8'b10101100) begin
            $display("FAIL: Count should be 10101100 after decrementing");
            $finish;
        end

        #10; // Wait for clock
        if (count !== 8'b10101011) begin
            $display("FAIL: Count should be 10101011 after decrementing again");
            $finish;
        end

        // Test reset
        rst = 1; // Assert reset
        #10;
        if (count !== 8'b0) begin
            $display("FAIL: Count should be 0 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule