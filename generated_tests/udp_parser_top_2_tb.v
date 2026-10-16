`timescale 1ns/1ps

module tb_udp_parser_top;

    reg clock;
    reg reset;
    reg out_tready;
    wire in_tready;
    reg [255:0] in_tdata;
    reg in_tvalid;
    reg in_tlast;
    wire out_tvalid;
    wire [255:0] out_tdata;
    wire [31:0] out_debug3;

    // Instantiate the module under test (uut)
    udp_parser_top uut (
        .clock(clock),
        .reset(reset),
        .out_tready(out_tready),
        .in_tready(in_tready),
        .in_tdata(in_tdata),
        .in_tvalid(in_tvalid),
        .in_tlast(in_tlast),
        .out_tvalid(out_tvalid),
        .out_tdata(out_tdata),
        .out_debug3(out_debug3)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        out_tready = 0;
        in_tvalid = 0;
        in_tlast = 0;
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Sum operation
        in_tdata = {16'h0000, 32'd1, 32'd2, 32'd3, 32'd4}; // Opcode 0 (sum), data = {1, 2, 3, 4}
        in_tvalid = 1;
        #10;
        in_tvalid = 0;
        #10;

        in_tdata = {16'h0000, 32'd5, 32'd6, 32'd7, 32'd8}; // Opcode 0 (sum), data = {5, 6, 7, 8}
        in_tvalid = 1;
        in_tlast = 1; // Last frame
        #10;
        in_tvalid = 0;
        #10;

        // Wait for output
        out_tready = 1;
        #10;
        if (out_tvalid && out_tdata != 32'd36) begin
            $display("FAIL: Expected sum 36, got %d", out_tdata);
            $finish;
        end

        // Test case 2: Max operation
        in_tdata = {16'h0001, 32'd1, 32'd2, 32'd3, 32'd4}; // Opcode 1 (max), data = {1, 2, 3, 4}
        in_tvalid = 1;
        #10;
        in_tvalid = 0;
        #10;

        in_tdata = {16'h0001, 32'd5, 32'd6, 32'd7, 32'd8}; // Opcode 1 (max), data = {5, 6, 7, 8}
        in_tvalid = 1;
        in_tlast = 1; // Last frame
        #10;
        in_tvalid = 0;
        #10;

        // Wait for output
        out_tready = 1;
        #10;
        if (out_tvalid && out_tdata != 32'd8) begin
            $display("FAIL: Expected max 8, got %d", out_tdata);
            $finish;
        end

        // Test case 3: Min operation
        in_tdata = {16'h0002, 32'd10, 32'd20, 32'd30, 32'd40}; // Opcode 2 (min), data = {10, 20, 30, 40}
        in_tvalid = 1;
        #10;
        in_tvalid = 0;
        #10;

        in_tdata = {16'h0002, 32'd5, 32'd15, 32'd25, 32'd35}; // Opcode 2 (min), data = {5, 15, 25, 35}
        in_tvalid = 1;
        in_tlast = 1; // Last frame
        #10;
        in_tvalid = 0;
        #10;

        // Wait for output
        out_tready = 1;
        #10;
        if (out_tvalid && out_tdata != 32'd5) begin
            $display("FAIL: Expected min 5, got %d", out_tdata);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule