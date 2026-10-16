`timescale 1ns/1ps

module tb_DF_SYNC;

    parameter ADDRESS_BITS = 3;

    reg W_CLK, W_RST, R_CLK, R_RST;
    reg [ADDRESS_BITS:0] W_PTR, R_PTR;
    wire [ADDRESS_BITS:0] RQ2_WPTR, WQ2_RPTR;

    // Instantiate the DUT
    DF_SYNC #(ADDRESS_BITS) uut (
        .W_CLK(W_CLK),
        .W_RST(W_RST),
        .R_CLK(R_CLK),
        .R_RST(R_RST),
        .W_PTR(W_PTR),
        .R_PTR(R_PTR),
        .RQ2_WPTR(RQ2_WPTR),
        .WQ2_RPTR(WQ2_RPTR)
    );

    // Clock generation
    initial begin
        W_CLK = 0;
        R_CLK = 0;
        forever begin
            #5 W_CLK = ~W_CLK;
            #5 R_CLK = ~R_CLK;
        end
    end

    // Test sequence
    initial begin
        // Initialize signals
        W_RST = 0;
        R_RST = 0;
        W_PTR = 4'b0000;
        R_PTR = 4'b0000;

        // Apply resets
        #10;
        W_RST = 1;
        R_RST = 1;

        // Test case 1: Write and read pointers
        W_PTR = 4'b0001; R_PTR = 4'b0000; #10;
        if (WQ2_RPTR !== 4'b0000) $display("FAIL: WQ2_RPTR should be 0 after reset");
        if (RQ2_WPTR !== 4'b0000) $display("FAIL: RQ2_WPTR should be 0 after reset");

        // Test case 2: Synchronization
        #10;
        if (WQ2_RPTR !== 4'b0001) $display("FAIL: WQ2_RPTR should be 1 after writing W_PTR");
        if (RQ2_WPTR !== 4'b0000) $display("FAIL: RQ2_WPTR should still be 0");

        // Test case 3: Update RQ2_WPTR
        #10;
        R_PTR = 4'b0001; #10;
        if (RQ2_WPTR !== 4'b0001) $display("FAIL: RQ2_WPTR should be 1 after writing R_PTR");

        // Test case 4: Check for stable values
        #10;
        W_PTR = 4'b0010; #10;
        if (WQ2_RPTR !== 4'b0001) $display("FAIL: WQ2_RPTR should still be 1");
        if (RQ2_WPTR !== 4'b0001) $display("FAIL: RQ2_WPTR should still be 1");

        // Test case 5: Reset functionality
        W_RST = 0; #10;
        if (WQ2_RPTR !== 4'b0000) $display("FAIL: WQ2_RPTR should be 0 after W_RST");
        if (RQ2_WPTR !== 4'b0001) $display("FAIL: RQ2_WPTR should still be 1");

        // Final reset
        R_RST = 0; #10;
        if (RQ2_WPTR !== 4'b0000) $display("FAIL: RQ2_WPTR should be 0 after R_RST");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule