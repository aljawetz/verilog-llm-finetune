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

    // Instantiate the module under test (uut)
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
        // Initialize signals
        MASTER_RST = 1;
        BUTTON_RISE = 0;
        BUTTON_FALL = 0;
        XCOORD = 10'h0;
        YCOORD = 10'h0;

        // Release reset
        #10 MASTER_RST = 0;

        // Test case 1: Increment VALUE_OUT
        XCOORD = 10'h9A; // Within UP region
        YCOORD = 10'h1E9; // Within UP region
        BUTTON_RISE = 1; // Simulate button rise
        #10 BUTTON_RISE = 0; // Release button
        if (VALUE_OUT !== 4'b0001) $display("FAIL: Expected VALUE_OUT = 1, got %b", VALUE_OUT);

        // Test case 2: Increment VALUE_OUT again
        BUTTON_RISE = 1; // Simulate button rise
        #10 BUTTON_RISE = 0; // Release button
        if (VALUE_OUT !== 4'b0010) $display("FAIL: Expected VALUE_OUT = 2, got %b", VALUE_OUT);

        // Test case 3: Decrement VALUE_OUT
        XCOORD = 10'hA0; // Within DOWN region
        YCOORD = 10'h1E9; // Within DOWN region
        BUTTON_RISE = 1; // Simulate button rise
        #10 BUTTON_RISE = 0; // Release button
        if (VALUE_OUT !== 4'b0001) $display("FAIL: Expected VALUE_OUT = 1, got %b", VALUE_OUT);

        // Test case 4: Reset VALUE_OUT
        MASTER_RST = 1; // Assert reset
        #10 MASTER_RST = 0; // Release reset
        if (VALUE_OUT !== 4'b0000) $display("FAIL: Expected VALUE_OUT = 0, got %b", VALUE_OUT);

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule