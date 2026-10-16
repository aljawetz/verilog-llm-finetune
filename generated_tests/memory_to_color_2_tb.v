`timescale 1ns/1ps

module tb_memory_to_color;

    reg [1:0] color_depth_i;
    reg [31:0] mem_i;
    reg [1:0] mem_lsb_i;
    wire [31:0] color_o;
    wire [3:0] sel_o;

    // Instantiate the module under test
    memory_to_color uut (
        .color_depth_i(color_depth_i),
        .mem_i(mem_i),
        .mem_lsb_i(mem_lsb_i),
        .color_o(color_o),
        .sel_o(sel_o)
    );

    initial begin
        // Test case 1: 8-bit color depth, first byte
        color_depth_i = 2'b00; mem_i = 32'hAABBCCDD; mem_lsb_i = 2'b00; #10;
        if (color_o !== 32'h00AABB) $display("FAIL: Test case 1 failed, expected 0x00AABB, got 0x%h", color_o);

        // Test case 2: 8-bit color depth, second byte
        mem_lsb_i = 2'b01; #10;
        if (color_o !== 32'h00BBCC) $display("FAIL: Test case 2 failed, expected 0x00BBCC, got 0x%h", color_o);

        // Test case 3: 8-bit color depth, third byte
        mem_lsb_i = 2'b10; #10;
        if (color_o !== 32'h00CCDD) $display("FAIL: Test case 3 failed, expected 0x00CCDD, got 0x%h", color_o);

        // Test case 4: 8-bit color depth, fourth byte
        mem_lsb_i = 2'b11; #10;
        if (color_o !== 32'h00DD00) $display("FAIL: Test case 4 failed, expected 0x00DD00, got 0x%h", color_o);

        // Test case 5: 16-bit color depth, high word
        color_depth_i = 2'b01; mem_lsb_i = 2'b00; #10;
        if (color_o !== 32'hAABB0000) $display("FAIL: Test case 5 failed, expected 0xAABB0000, got 0x%h", color_o);

        // Test case 6: 16-bit color depth, low word
        mem_lsb_i = 2'b01; #10;
        if (color_o !== 32'h0000CCDD) $display("FAIL: Test case 6 failed, expected 0x0000CCDD, got 0x%h", color_o);

        // Test case 7: 32-bit color depth
        color_depth_i = 2'b10; mem_lsb_i = 2'b00; #10;
        if (color_o !== 32'hAABBCCDD) $display("FAIL: Test case 7 failed, expected 0xAABBCCDD, got 0x%h", color_o);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule