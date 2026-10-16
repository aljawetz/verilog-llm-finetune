`timescale 1ns/1ps

module tb_xy_calculate;

    reg clk;
    reg RST;
    reg east;
    reg west;
    reg north;
    reg south;
    reg knob;
    wire [2:0] X;
    wire [2:0] Y;
    wire enter;

    // Instantiate the module under test (uut)
    xy_calculate uut (
        .clk(clk),
        .RST(RST),
        .east(east),
        .west(west),
        .north(north),
        .south(south),
        .knob(knob),
        .X(X),
        .Y(Y),
        .enter(enter)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        RST = 1;
        east = 0;
        west = 0;
        north = 0;
        south = 0;
        knob = 0;

        // Release reset
        #10 RST = 0;

        // Test 1: Moving East
        #10 east = 1; // Press east
        #10 east = 0; // Release east
        #10; // Wait for button pulse
        if (X !== 3'b111) $display("FAIL: X should be 7 after moving east");
        
        // Test 2: Moving West
        #10 west = 1; // Press west
        #10 west = 0; // Release west
        #10; // Wait for button pulse
        if (X !== 3'b000) $display("FAIL: X should be 0 after moving west");

        // Test 3: Moving North
        #10 north = 1; // Press north
        #10 north = 0; // Release north
        #10; // Wait for button pulse
        if (Y !== 3'b001) $display("FAIL: Y should be 1 after moving north");

        // Test 4: Moving South
        #10 south = 1; // Press south
        #10 south = 0; // Release south
        #10; // Wait for button pulse
        if (Y !== 3'b000) $display("FAIL: Y should be 0 after moving south");

        // Test 5: Knob Press
        #10 knob = 1; // Press knob
        #10 knob = 0; // Release knob
        #10; // Wait for button pulse
        if (enter !== 1) $display("FAIL: enter should be 1 after pressing knob");

        // Final check
        #10;
        if (X !== 3'b000 || Y !== 3'b000 || enter !== 0) $display("FAIL: Final state is incorrect");

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule