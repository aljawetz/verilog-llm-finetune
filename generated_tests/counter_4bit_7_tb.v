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

        // Test 1: Load a value
        load = 1; data = 4'b0101; #10; // Load 5
        load = 0; #10;
        if (count !== 4'b0101) $display("FAIL: Expected count to be 0101 after load, got %b", count);

        // Test 2: Increment
        up = 1; #10; // Increment
        up = 0; #10;
        if (count !== 4'b0110) $display("FAIL: Expected count to be 0110 after increment, got %b", count);

        // Test 3: Increment again
        up = 1; #10; // Increment
        up = 0; #10;
        if (count !== 4'b0111) $display("FAIL: Expected count to be 0111 after increment, got %b", count);

        // Test 4: Decrement
        down = 1; #10; // Decrement
        down = 0; #10;
        if (count !== 4'b0110) $display("FAIL: Expected count to be 0110 after decrement, got %b", count);

        // Test 5: Load another value
        load = 1; data = 4'b0000; #10; // Load 0
        load = 0; #10;
        if (count !== 4'b0000) $display("FAIL: Expected count to be 0000 after load, got %b", count);

        // Test 6: Decrement from 0 (should wrap around)
        down = 1; #10; // Decrement
        down = 0; #10;
        if (count !== 4'b1111) $display("FAIL: Expected count to be 1111 after decrement from 0000, got %b", count);

        // Test 7: Increment from 15 (should wrap around)
        load = 1; data = 4'b1111; #10; // Load 15
        load = 0; #10;
        up = 1; #10; // Increment
        up = 0; #10;
        if (count !== 4'b0000) $display("FAIL: Expected count to be 0000 after increment from 1111, got %b", count);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule