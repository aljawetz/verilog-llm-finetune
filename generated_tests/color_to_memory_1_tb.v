`timescale 1ns/1ps

module tb_color_to_memory;

    reg [1:0] color_depth_i;
    reg [31:0] color_i;
    reg [1:0] x_lsb_i;
    wire [31:0] mem_o;
    wire [3:0] sel_o;

    // Instantiate the Unit Under Test (UUT)
    color_to_memory uut (
        .color_depth_i(color_depth_i),
        .color_i(color_i),
        .x_lsb_i(x_lsb_i),
        .mem_o(mem_o),
        .sel_o(sel_o)
    );

    initial begin
        // Test case 1: 8-bit color depth, x_lsb_i = 00
        color_depth_i = 2'b00; color_i = 32'hFF0000; x_lsb_i = 2'b00; #10;
        if (mem_o !== 32'hFF0000) $display("FAIL: Test case 1 failed, expected mem_o = 32'hFF0000, got mem_o = %h", mem_o);
        if (sel_o !== 4'b1000) $display("FAIL: Test case 1 failed, expected sel_o = 4'b1000, got sel_o = %b", sel_o);

        // Test case 2: 8-bit color depth, x_lsb_i = 01
        color_depth_i = 2'b00; color_i = 32'h00FF00; x_lsb_i = 2'b01; #10;
        if (mem_o !== 32'h00FF0000) $display("FAIL: Test case 2 failed, expected mem_o = 32'h00FF0000, got mem_o = %h", mem_o);
        if (sel_o !== 4'b0100) $display("FAIL: Test case 2 failed, expected sel_o = 4'b0100, got sel_o = %b", sel_o);

        // Test case 3: 8-bit color depth, x_lsb_i = 10
        color_depth_i = 2'b00; color_i = 32'h0000FF; x_lsb_i = 2'b10; #10;
        if (mem_o !== 32'h0000FF00) $display("FAIL: Test case 3 failed, expected mem_o = 32'h0000FF00, got mem_o = %h", mem_o);
        if (sel_o !== 4'b0010) $display("FAIL: Test case 3 failed, expected sel_o = 4'b0010, got sel_o = %b", sel_o);

        // Test case 4: 8-bit color depth, x_lsb_i = 11
        color_depth_i = 2'b00; color_i = 32'hFFFFFF; x_lsb_i = 2'b11; #10;
        if (mem_o !== 32'hFFFFFF) $display("FAIL: Test case 4 failed, expected mem_o = 32'hFFFFFF, got mem_o = %h", mem_o);
        if (sel_o !== 4'b0001) $display("FAIL: Test case 4 failed, expected sel_o = 4'b0001, got sel_o = %b", sel_o);

        // Test case 5: 16-bit color depth, high word
        color_depth_i = 2'b01; color_i = 32'h12345678; x_lsb_i = 2'b00; #10;
        if (mem_o !== 32'h12340000) $display("FAIL: Test case 5 failed, expected mem_o = 32'h12340000, got mem_o = %h", mem_o);
        if (sel_o !== 4'b1100) $display("FAIL: Test case 5 failed, expected sel_o = 4'b1100, got sel_o = %b", sel_o);

        // Test case 6: 16-bit color depth, low word
        color_depth_i = 2'b01; color_i = 32'h87654321; x_lsb_i = 2'b01; #10;
        if (mem_o !== 32'h87654321) $display("FAIL: Test case 6 failed, expected mem_o = 32'h87654321, got mem_o = %h", mem_o);
        if (sel_o !== 4'b0011) $display("FAIL: Test case 6 failed, expected sel_o = 4'b0011, got sel_o = %b", sel_o);

        // Test case 7: 32-bit color depth
        color_depth_i = 2'b10; color_i = 32'hDEADBEEF; x_lsb_i = 2'b00; #10;
        if (mem_o !== 32'hDEADBEEF) $display("FAIL: Test case 7 failed, expected mem_o = 32'hDEADBEEF, got mem_o = %h", mem_o);
        if (sel_o !== 4'b1111) $display("FAIL: Test case 7 failed, expected sel_o = 4'b1111, got sel_o = %b", sel_o);

        $display("PASS");
        $finish;
    end

endmodule