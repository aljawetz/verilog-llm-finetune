`timescale 1ns/1ps

module tb_cabac_urange4_full;

    // Parameters
    reg [7:0] in_range;
    reg lpsmps;
    reg [31:0] four_lps;
    reg [43:0] four_lps_shift;
    wire [7:0] out_range;
    wire [7:0] out_rlps;
    wire [2:0] out_shift;

    // Instantiate the Unit Under Test (UUT)
    cabac_urange4_full uut (
        .in_range(in_range),
        .lpsmps(lpsmps),
        .four_lps(four_lps),
        .four_lps_shift(four_lps_shift),
        .out_range(out_range),
        .out_rlps(out_rlps),
        .out_shift(out_shift)
    );

    initial begin
        // Test Case 1
        in_range = 8'b00000000; // in_range[7:6] = 00
        lpsmps = 1'b0;
        four_lps = 32'hFF00FF00; // four_lps = {0xFF, 0x00, 0xFF, 0x00}
        four_lps_shift = 44'h3F3F3F3F3F3F; // four_lps_shift = {0x3F, 0x3F, 0x3F, 0x3F}
        #10;
        if (out_range !== 8'hFF) $display("FAIL: Test Case 1 - Expected out_range = 0xFF, got %h", out_range);
        if (out_rlps !== 8'hFF) $display("FAIL: Test Case 1 - Expected out_rlps = 0xFF, got %h", out_rlps);
        if (out_shift !== 3'b111) $display("FAIL: Test Case 1 - Expected out_shift = 3'b111, got %b", out_shift);

        // Test Case 2
        in_range = 8'b01000000; // in_range[7:6] = 01
        lpsmps = 1'b1;
        four_lps = 32'hFF00FF00; // four_lps = {0xFF, 0x00, 0xFF, 0x00}
        four_lps_shift = 44'h3F3F3F3F3F3F; // four_lps_shift = {0x3F, 0x3F, 0x3F, 0x3F}
        #10;
        if (out_range !== 8'h3F) $display("FAIL: Test Case 2 - Expected out_range = 0x3F, got %h", out_range);
        if (out_rlps !== 8'h00) $display("FAIL: Test Case 2 - Expected out_rlps = 0x00, got %h", out_rlps);
        if (out_shift !== 3'b011) $display("FAIL: Test Case 2 - Expected out_shift = 3'b011, got %b", out_shift);

        // Test Case 3
        in_range = 8'b10000000; // in_range[7:6] = 10
        lpsmps = 1'b0;
        four_lps = 32'hFF00FF00; // four_lps = {0xFF, 0x00, 0xFF, 0x00}
        four_lps_shift = 44'h3F3F3F3F3F3F; // four_lps_shift = {0x3F, 0x3F, 0x3F, 0x3F}
        #10;
        if (out_range !== 8'hFF) $display("FAIL: Test Case 3 - Expected out_range = 0xFF, got %h", out_range);
        if (out_rlps !== 8'hFF) $display("FAIL: Test Case 3 - Expected out_rlps = 0xFF, got %h", out_rlps);
        if (out_shift !== 3'b111) $display("FAIL: Test Case 3 - Expected out_shift = 3'b111, got %b", out_shift);

        // Test Case 4
        in_range = 8'b11000000; // in_range[7:6] = 11
        lpsmps = 1'b1;
        four_lps = 32'hFF00FF00; // four_lps = {0xFF, 0x00, 0xFF, 0x00}
        four_lps_shift = 44'h3F3F3F3F3F3F; // four_lps_shift = {0x3F, 0x3F, 0x3F, 0x3F}
        #10;
        if (out_range !== 8'h3F) $display("FAIL: Test Case 4 - Expected out_range = 0x3F, got %h", out_range);
        if (out_rlps !== 8'h00) $display("FAIL: Test Case 4 - Expected out_rlps = 0x00, got %h", out_rlps);
        if (out_shift !== 3'b011) $display("FAIL: Test Case 4 - Expected out_shift = 3'b011, got %b", out_shift);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule