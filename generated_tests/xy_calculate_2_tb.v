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

    // Instantiate the module under test
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

        // Test moving east
        #10 east = 1; // Move east
        #10 east = 0; // Stop moving
        #10 if (X !== 3'b111) $display("FAIL: Expected X=7 after moving east, got X=%b", X);

        // Test moving west
        #10 west = 1; // Move west
        #10 west = 0; // Stop moving
        #10 if (X !== 3'b000) $display("FAIL: Expected X=0 after moving west, got X=%b", X);

        // Test moving north
        #10 north = 1; // Move north
        #10 north = 0; // Stop moving
        #10 if (Y !== 3'b001) $display("FAIL: Expected Y=1 after moving north, got Y=%b", Y);

        // Test moving south
        #10 south = 1; // Move south
        #10 south = 0; // Stop moving
        #10 if (Y !== 3'b000) $display("FAIL: Expected Y=0 after moving south, got Y=%b", Y);

        // Test knob press
        #10 knob = 1; // Press knob
        #10 if (enter !== 1) $display("FAIL: Expected enter=1 after knob press, got enter=%b", enter);
        #10 knob = 0; // Release knob
        #10 if (enter !== 0) $display("FAIL: Expected enter=0 after releasing knob, got enter=%b", enter);

        // Final check
        #10 if (X !== 3'b000 || Y !== 3'b000) $display("FAIL: Expected X=0, Y=0 at end, got X=%b, Y=%b", X, Y);
        
        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule