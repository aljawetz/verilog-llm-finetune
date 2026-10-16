`timescale 1ns/1ps

module tb_coin_vending;

    reg [1:0] coin;
    reg rst;
    reg clk;
    wire out;
    wire change;

    // Instantiate the coin_vending module
    coin_vending uut (
        .coin(coin),
        .rst(rst),
        .clk(clk),
        .out(out),
        .change(change)
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
        coin = 2'b00;
        #10; // Wait for a clock cycle
        rst = 0;

        // Test case 1: Insert coin 1 (transition to state s1)
        coin = 2'b01; 
        #10; // Wait for a clock cycle
        if (uut.pre !== 2'b01) $display("FAIL: Expected state s1 after inserting coin 1");

        // Test case 2: Insert coin 2 (transition to state s2 and activate out)
        coin = 2'b10; 
        #10; // Wait for a clock cycle
        if (uut.pre !== 2'b10) $display("FAIL: Expected state s2 after inserting coin 2");
        if (uut.out !== 1) $display("FAIL: Expected out to be 1 after inserting coin 2 in state s1");

        // Test case 3: Insert coin 1 (activate out and change)
        coin = 2'b01; 
        #10; // Wait for a clock cycle
        if (uut.out !== 1) $display("FAIL: Expected out to be 1 after inserting coin 1 in state s2");
        if (uut.change !== 0) $display("FAIL: Expected change to be 0 after inserting coin 1 in state s2");

        // Test case 4: Insert coin 2 (activate out and change)
        coin = 2'b10; 
        #10; // Wait for a clock cycle
        if (uut.out !== 1) $display("FAIL: Expected out to be 1 after inserting coin 2 in state s2");
        if (uut.change !== 1) $display("FAIL: Expected change to be 1 after inserting coin 2 in state s2");

        // Test case 5: Reset the system
        rst = 1;
        #10; // Wait for a clock cycle
        rst = 0;
        if (uut.pre !== 2'b00) $display("FAIL: Expected state s0 after reset");

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule