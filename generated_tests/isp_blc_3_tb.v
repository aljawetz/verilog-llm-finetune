`timescale 1ns/1ps

module tb_isp_blc;

    // Parameters
    parameter BITS = 8;
    parameter WIDTH = 1280;
    parameter HEIGHT = 960;

    // Inputs
    reg pclk;
    reg rst_n;
    reg [BITS-1:0] black_r;
    reg [BITS-1:0] black_gr;
    reg [BITS-1:0] black_gb;
    reg [BITS-1:0] black_b;
    reg in_href;
    reg in_vsync;
    reg [BITS-1:0] in_raw;

    // Outputs
    wire out_href;
    wire out_vsync;
    wire [BITS-1:0] out_raw;

    // Instantiate the Unit Under Test (UUT)
    isp_blc uut (
        .pclk(pclk),
        .rst_n(rst_n),
        .black_r(black_r),
        .black_gr(black_gr),
        .black_gb(black_gb),
        .black_b(black_b),
        .in_href(in_href),
        .in_vsync(in_vsync),
        .in_raw(in_raw),
        .out_href(out_href),
        .out_vsync(out_vsync),
        .out_raw(out_raw)
    );

    // Clock generation
    initial begin
        pclk = 0;
        forever #5 pclk = ~pclk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst_n = 0;
        black_r = 8'd10;
        black_gr = 8'd20;
        black_gb = 8'd30;
        black_b = 8'd40;
        in_href = 0;
        in_vsync = 0;
        in_raw = 8'd0;

        // Release reset
        #10;
        rst_n = 1;

        // Test case 1: Normal operation with RGGB pattern
        in_vsync = 1; #10; // Start of frame
        in_vsync = 0; #10;

        // Send pixel data
        in_href = 1;
        in_raw = 8'd50; // R
        #10;
        if (out_raw !== 8'd40) $display("FAIL: Expected out_raw = 40, got %d", out_raw);

        in_raw = 8'd25; // Gr
        #10;
        if (out_raw !== 8'd5) $display("FAIL: Expected out_raw = 5, got %d", out_raw);

        in_raw = 8'd35; // Gb
        #10;
        if (out_raw !== 8'd5) $display("FAIL: Expected out_raw = 5, got %d", out_raw);

        in_raw = 8'd45; // B
        #10;
        if (out_raw !== 8'd5) $display("FAIL: Expected out_raw = 5, got %d", out_raw);

        in_href = 0; #10;

        // Test case 2: Edge case with black levels
        in_vsync = 1; #10; // Start of new frame
        in_vsync = 0; #10;

        in_href = 1;
        in_raw = 8'd10; // R
        #10;
        if (out_raw !== 8'd0) $display("FAIL: Expected out_raw = 0, got %d", out_raw);

        in_raw = 8'd20; // Gr
        #10;
        if (out_raw !== 8'd0) $display("FAIL: Expected out_raw = 0, got %d", out_raw);

        in_raw = 8'd30; // Gb
        #10;
        if (out_raw !== 8'd0) $display("FAIL: Expected out_raw = 0, got %d", out_raw);

        in_raw = 8'd40; // B
        #10;
        if (out_raw !== 8'd0) $display("FAIL: Expected out_raw = 0, got %d", out_raw);

        in_href = 0; #10;

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule