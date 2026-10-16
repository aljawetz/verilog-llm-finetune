`timescale 1ns/1ps

module tb_counter_4bit;

    reg clk;
    reg load;
    reg up;
    reg down;
    reg [3:0] data;
    wire [3:0] count;

    // Instantiate the counter_4bit module
    counter_4bit uut (
        .clk(clk),
        .load(load),
        .up(up),
        .down(down),
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
        load = 0;
        up = 0;
        down = 0;
        data = 4'b0000;

        // Test loading a value
        load = 1; data = 4'b0101; #10; // Load 5
        load = 0; #10;
        if (count !== 4'b0101) $display("FAIL: Expected count to be 5 after load, got %b", count);

        // Test incrementing
        up = 1; #10; // Increment
        if (count !== 4'b0110) $display("FAIL: Expected count to be 6 after increment, got %b", count);
        up = 0; #10;

        // Test incrementing again
        up = 1; #10; // Increment
        if (count !== 4'b0111) $display("FAIL: Expected count to be 7 after increment, got %b", count);
        up = 0; #10;

        // Test decrementing
        down = 1; #10; // Decrement
        if (count !== 4'b0110) $display("FAIL: Expected count to be 6 after decrement, got %b", count);
        down = 0; #10;

        // Test decrementing again
        down = 1; #10; // Decrement
        if (count !== 4'b0101) $display("FAIL: Expected count to be 5 after decrement, got %b", count);
        down = 0; #10;

        // Test loading a new value
        load = 1; data = 4'b1111; #10; // Load 15
        load = 0; #10;
        if (count !== 4'b1111) $display("FAIL: Expected count to be 15 after load, got %b", count);

        // Test incrementing to wrap around
        up = 1; #10; // Increment
        if (count !== 4'b0000) $display("FAIL: Expected count to wrap around to 0 after increment, got %b", count);
        
        // End simulation
        $display("PASS");
        $finish;
    end

endmodule