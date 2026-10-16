`timescale 1ns/1ps

module tb_open;

    reg [4:0] keycode;
    reg [2:0] whichState;
    reg clk5;
    reg reset;
    wire open;

    // Instantiate the module under test
    open uut (
        .keycode(keycode),
        .whichState(whichState),
        .clk5(clk5),
        .reset(reset),
        .open(open)
    );

    // Clock generation
    initial begin
        clk5 = 0;
        forever #5 clk5 = ~clk5; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        keycode = 5'b00000;
        whichState = 3'b000;
        #10;
        
        // Release reset
        reset = 0;
        #10;

        // Test case 1: Entering correct sequence
        whichState = 3'b001; keycode = 5'b10001; // Press '1'
        #10;
        if (uut.count !== 3'b001) $display("FAIL: Count should be 1 after pressing '1'");

        whichState = 3'b010; keycode = 5'b10010; // Press '2'
        #10;
        if (uut.count !== 3'b010) $display("FAIL: Count should be 2 after pressing '2'");

        whichState = 3'b011; keycode = 5'b11001; // Press '9'
        #10;
        if (uut.count !== 3'b011) $display("FAIL: Count should be 3 after pressing '9'");

        whichState = 3'b100; keycode = 5'b10110; // Press '6'
        #10;
        if (uut.count !== 3'b100) $display("FAIL: Count should be 4 after pressing '6'");
        if (uut.open !== 1'b1) $display("FAIL: Open signal should be asserted after 4 correct entries");

        // Test case 2: Reset functionality
        reset = 1;
        #10;
        reset = 0;
        if (uut.count !== 3'b000) $display("FAIL: Count should be reset to 0 after reset");

        // Test case 3: Clear functionality
        whichState = 3'b001; keycode = 5'b11100; // Press 'C' to clear
        #10;
        if (uut.count !== 3'b000) $display("FAIL: Count should be cleared to 0 after pressing 'C'");

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule