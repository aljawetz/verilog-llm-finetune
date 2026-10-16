`timescale 1ns/1ps

module tb_sub_UserTimeScaleBox;

    // Parameters
    reg MASTER_CLK;
    reg MASTER_RST;
    reg BUTTON_RISE;
    reg BUTTON_FALL;
    reg [9:0] XCOORD;
    reg [9:0] YCOORD;
    wire [3:0] VALUE_OUT;

    // Instantiate the Unit Under Test (UUT)
    sub_UserTimeScaleBox uut (
        .MASTER_CLK(MASTER_CLK),
        .MASTER_RST(MASTER_RST),
        .BUTTON_RISE(BUTTON_RISE),
        .BUTTON_FALL(BUTTON_FALL),
        .XCOORD(XCOORD),
        .YCOORD(YCOORD),
        .VALUE_OUT(VALUE_OUT)
    );

    // Clock generation
    initial begin
        MASTER_CLK = 0;
        forever #5 MASTER_CLK = ~MASTER_CLK; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
        MASTER_RST = 1;
        BUTTON_RISE = 0;
        BUTTON_FALL = 0;
        XCOORD = 10'h00;
        YCOORD = 10'h00;

        // Release reset
        #10 MASTER_RST = 0;

        // Test case 1: Increment VALUE_OUT
        XCOORD = 10'h9A; // within upward region
        YCOORD = 10'h1E9; // within upward region
        BUTTON_RISE = 1; // simulate button rise
        #10 BUTTON_RISE = 0; // release button
        if (VALUE_OUT !== 4'b0001) begin
            $display("FAIL: Expected VALUE_OUT = 1, got %b", VALUE_OUT);
            $finish;
        end

        // Test case 2: Increment VALUE_OUT again
        BUTTON_RISE = 1; // simulate button rise
        #10 BUTTON_RISE = 0; // release button
        if (VALUE_OUT !== 4'b0010) begin
            $display("FAIL: Expected VALUE_OUT = 2, got %b", VALUE_OUT);
            $finish;
        end

        // Test case 3: Decrement VALUE_OUT
        XCOORD = 10'hA0; // within downward region
        YCOORD = 10'h1E9; // within downward region
        BUTTON_RISE = 1; // simulate button rise
        #10 BUTTON_RISE = 0; // release button
        if (VALUE_OUT !== 4'b0001) begin
            $display("FAIL: Expected VALUE_OUT = 1, got %b", VALUE_OUT);
            $finish;
        end

        // Test case 4: Reset VALUE_OUT
        MASTER_RST = 1;
        #10 MASTER_RST = 0;
        if (VALUE_OUT !== 4'b0000) begin
            $display("FAIL: Expected VALUE_OUT = 0 after reset, got %b", VALUE_OUT);
            $finish;
        end

        // Test case 5: No change outside regions
        XCOORD = 10'h00; // outside both regions
        YCOORD = 10'h00; // outside both regions
        BUTTON_RISE = 1; // simulate button rise
        #10 BUTTON_RISE = 0; // release button
        if (VALUE_OUT !== 4'b0000) begin
            $display("FAIL: Expected VALUE_OUT = 0, got %b", VALUE_OUT);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule