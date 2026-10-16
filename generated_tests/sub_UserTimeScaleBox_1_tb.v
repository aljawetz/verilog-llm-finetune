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
        XCOORD = 10'h0;
        YCOORD = 10'h0;
        
        // Release reset
        #10 MASTER_RST = 0;

        // Test case 1: BUTTON_RISE in range UP
        XCOORD = 10'h9A; // In range UP
        YCOORD = 10'h1E9; // In range UP
        BUTTON_RISE = 1; #10 BUTTON_RISE = 0; // Trigger BUTTON_RISE
        if (VALUE_OUT !== 4'b0001) begin
            $display("FAIL: Expected VALUE_OUT = 1, got %b", VALUE_OUT);
            $finish;
        end

        // Test case 2: BUTTON_RISE in range DOWN
        XCOORD = 10'hA0; // In range DOWN
        YCOORD = 10'h1E9; // In range DOWN
        BUTTON_RISE = 1; #10 BUTTON_RISE = 0; // Trigger BUTTON_RISE
        if (VALUE_OUT !== 4'b0000) begin
            $display("FAIL: Expected VALUE_OUT = 0, got %b", VALUE_OUT);
            $finish;
        end

        // Test case 3: BUTTON_RISE out of range
        XCOORD = 10'h00; // Out of range
        YCOORD = 10'h00; // Out of range
        BUTTON_RISE = 1; #10 BUTTON_RISE = 0; // Trigger BUTTON_RISE
        if (VALUE_OUT !== 4'b0000) begin
            $display("FAIL: Expected VALUE_OUT = 0, got %b", VALUE_OUT);
            $finish;
        end

        // Test case 4: BUTTON_RISE in range UP again
        XCOORD = 10'h9A; // In range UP
        YCOORD = 10'h1E9; // In range UP
        BUTTON_RISE = 1; #10 BUTTON_RISE = 0; // Trigger BUTTON_RISE
        if (VALUE_OUT !== 4'b0001) begin
            $display("FAIL: Expected VALUE_OUT = 1, got %b", VALUE_OUT);
            $finish;
        end

        // Test case 5: Reset functionality
        MASTER_RST = 1; #10 MASTER_RST = 0; // Reset the module
        if (VALUE_OUT !== 4'b0000) begin
            $display("FAIL: Expected VALUE_OUT = 0 after reset, got %b", VALUE_OUT);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule