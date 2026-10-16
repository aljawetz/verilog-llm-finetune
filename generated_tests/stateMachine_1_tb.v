`timescale 1ns/1ps

module tb_stateMachine;

    reg [4:0] keycode;
    reg newkey;
    reg open;
    reg timeUp;
    reg clk5;
    reg reset;
    wire [2:0] whichState;
    wire [5:0] led;

    // Instantiate the stateMachine module
    stateMachine uut (
        .keycode(keycode),
        .newkey(newkey),
        .open(open),
        .timeUp(timeUp),
        .clk5(clk5),
        .reset(reset),
        .whichState(whichState),
        .led(led)
    );

    // Clock generation
    initial begin
        clk5 = 0;
        forever #5 clk5 = ~clk5; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        newkey = 0;
        open = 0;
        timeUp = 0;
        keycode = 5'b00000;

        // Release reset
        #10 reset = 0;

        // Test sequence for entering the correct code
        // Simulate pressing keys '1', '2', '3', '4'
        keycode = 5'b11100; newkey = 1; #10; newkey = 0; // Press 'C' to clear
        if (whichState !== 3'b000 || led !== 6'b000000) $display("FAIL: State not IDLE after clear");

        keycode = 5'b00001; newkey = 1; #10; newkey = 0; // Press '1'
        if (whichState !== 3'b001 || led !== 6'b000001) $display("FAIL: State not FIRST_KEY or LED not correct");

        keycode = 5'b00010; newkey = 1; #10; newkey = 0; // Press '2'
        if (whichState !== 3'b010 || led !== 6'b000011) $display("FAIL: State not SECOND_KEY or LED not correct");

        keycode = 5'b00011; newkey = 1; #10; newkey = 0; // Press '3'
        if (whichState !== 3'b011 || led !== 6'b000111) $display("FAIL: State not THIRD_KEY or LED not correct");

        keycode = 5'b00100; newkey = 1; #10; newkey = 0; // Press '4'
        if (whichState !== 3'b100 || led !== 6'b001111) $display("FAIL: State not FOURTH_KEY or LED not correct");

        // Simulate waiting for open signal
        #10 open = 1; // Assume correct code
        #10; // Wait for next clock cycle
        if (whichState !== 3'b101 || led !== 6'b010000) $display("FAIL: State not CORRECT_CODE or LED not correct");

        // Simulate time up
        timeUp = 1; #10; timeUp = 0; // Time up
        if (whichState !== 3'b000 || led !== 6'b000000) $display("FAIL: State not IDLE after CORRECT_CODE timeout");

        // Test sequence for entering the wrong code
        keycode = 5'b11100; newkey = 1; #10; newkey = 0; // Press 'C' to clear
        keycode = 5'b00001; newkey = 1; #10; newkey = 0; // Press '1'
        keycode = 5'b00010; newkey = 1; #10; newkey = 0; // Press '2'
        keycode = 5'b00011; newkey = 1; #10; newkey = 0; // Press '3'
        keycode = 5'b00100; newkey = 1; #10; newkey = 0; // Press '4'
        #10 open = 0; // Assume wrong code
        #10; // Wait for next clock cycle
        if (whichState !== 3'b110 || led !== 6'b100000) $display("FAIL: State not WRONG_CODE or LED not correct");

        // Simulate time up
        timeUp = 1; #10; timeUp = 0; // Time up
        if (whichState !== 3'b000 || led !== 6'b000000) $display("FAIL: State not IDLE after WRONG_CODE timeout");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule