`timescale 1ns/1ps

module tb_wb_dma_ch_arb;

    reg clk;
    reg rst;
    reg [30:0] req;
    reg advance;
    wire [4:0] gnt;

    // Instantiate the unit under test (UUT)
    wb_dma_ch_arb uut (
        .clk(clk),
        .rst(rst),
        .req(req),
        .gnt(gnt),
        .advance(advance)
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
        req = 31'b0;
        advance = 0;

        // Apply reset
        #10;
        rst = 0; // Release reset
        #10;
        rst = 1; // Assert reset again

        // Test case 1: Grant first request
        req = 31'b00000000000000000000000000000001; // Only req[0] is active
        #10;
        if (gnt !== 5'b00000) $display("FAIL: Expected gnt = 00000, got %b", gnt);

        // Test case 2: Grant second request
        req = 31'b00000000000000000000000000000010; // Only req[1] is active
        #10;
        if (gnt !== 5'b00001) $display("FAIL: Expected gnt = 00001, got %b", gnt);

        // Test case 3: Grant third request
        req = 31'b00000000000000000000000000000100; // Only req[2] is active
        #10;
        if (gnt !== 5'b00010) $display("FAIL: Expected gnt = 00010, got %b", gnt);

        // Test case 4: Multiple requests
        req = 31'b00000000000000000000000000001100; // req[2] and req[1] are active
        #10;
        if (gnt !== 5'b00010) $display("FAIL: Expected gnt = 00010, got %b", gnt); // Should still grant req[2]

        // Test case 5: Advance signal
        advance = 1; // Assert advance
        #10;
        if (gnt !== 5'b00011) $display("FAIL: Expected gnt = 00011, got %b", gnt); // Should grant req[3]

        // Test case 6: Drop request and check round robin
        req = 31'b00000000000000000000000000001100; // req[2] and req[1] are active
        advance = 0; // Deassert advance
        #10;
        if (gnt !== 5'b00010) $display("FAIL: Expected gnt = 00010, got %b", gnt); // Should still grant req[2]

        // Test case 7: Drop req[2] and check next
        req = 31'b00000000000000000000000000000100; // Only req[2] is active
        #10;
        if (gnt !== 5'b00010) $display("FAIL: Expected gnt = 00010, got %b", gnt); // Should still grant req[2]

        // Test case 8: Drop req[2] and check next
        req = 31'b00000000000000000000000000000000; // No requests
        #10;
        if (gnt !== 5'b00000) $display("FAIL: Expected gnt = 00000, got %b", gnt); // Should grant nothing

        // Test case 9: Assert multiple requests
        req = 31'b00000000000000000000000000001111; // req[0] to req[3] are active
        #10;
        if (gnt !== 5'b00000) $display("FAIL: Expected gnt = 00000, got %b", gnt); // Should grant req[0]

        // Test case 10: Assert advance and check round robin
        advance = 1; // Assert advance
        #10;
        if (gnt !== 5'b00001) $display("FAIL: Expected gnt = 00001, got %b", gnt); // Should grant req[1]

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule