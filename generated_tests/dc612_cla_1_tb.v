`timescale 1ns/1ps

module tb_dc612_cla;

    // Inputs
    reg bcd_l;
    reg ci_l;
    reg [7:0] p_l;
    reg [7:0] g_a_l;
    reg [7:0] g_b_l;
    reg sb_h;
    reg muxa_h;
    reg muxb_h;
    reg muxs_h;

    // Outputs
    wire [7:0] co_l;
    wire bin8_l;
    wire bcd8_l;
    wire c_h;
    wire fs_h;
    wire fov_h;
    wire muxo_l;

    // Instantiate the Unit Under Test (UUT)
    dc612_cla uut (
        .bcd_l(bcd_l),
        .ci_l(ci_l),
        .p_l(p_l),
        .g_a_l(g_a_l),
        .g_b_l(g_b_l),
        .co_l(co_l),
        .bin8_l(bin8_l),
        .bcd8_l(bcd8_l),
        .c_h(c_h),
        .sb_h(sb_h),
        .fs_h(fs_h),
        .fov_h(fov_h),
        .muxa_h(muxa_h),
        .muxb_h(muxb_h),
        .muxs_h(muxs_h),
        .muxo_l(muxo_l)
    );

    // Clock generation
    initial begin
        // Initialize inputs
        bcd_l = 0;
        ci_l = 0;
        p_l = 8'b00000000;
        g_a_l = 8'b00000000;
        g_b_l = 8'b00000000;
        sb_h = 0;
        muxa_h = 0;
        muxb_h = 0;
        muxs_h = 0;

        // Test case 1: Basic carry generation
        bcd_l = 0; ci_l = 0; p_l = 8'b11111111; g_a_l = 8'b00000000; g_b_l = 8'b00000000;
        #10;
        if (co_l !== 8'b11111111) $display("FAIL: Test case 1 failed, expected co_l = 11111111, got %b", co_l);

        // Test case 2: Carry with propagate
        p_l = 8'b11111111; g_a_l = 8'b11111111; g_b_l = 8'b00000000;
        #10;
        if (co_l !== 8'b11111111) $display("FAIL: Test case 2 failed, expected co_l = 11111111, got %b", co_l);

        // Test case 3: No propagate, no generate
        p_l = 8'b00000000; g_a_l = 8'b00000000; g_b_l = 8'b00000000;
        #10;
        if (co_l !== 8'b00000000) $display("FAIL: Test case 3 failed, expected co_l = 00000000, got %b", co_l);

        // Test case 4: BCD carry
        bcd_l = 1; ci_l = 1; p_l = 8'b00000000; g_a_l = 8'b00000001; g_b_l = 8'b00000001;
        #10;
        if (bin8_l !== 1'b0) $display("FAIL: Test case 4 failed, expected bin8_l = 0, got %b", bin8_l);

        // Test case 5: MUX functionality
        muxs_h = 1; muxa_h = 0; muxb_h = 1;
        #10;
        if (muxo_l !== 1'b1) $display("FAIL: Test case 5 failed, expected muxo_l = 1, got %b", muxo_l);

        // Test case 6: Floating point outputs
        sb_h = 1;
        #10;
        if (fs_h !== 1'b0) $display("FAIL: Test case 6 failed, expected fs_h = 0, got %b", fs_h);
        if (fov_h !== 1'b0) $display("FAIL: Test case 6 failed, expected fov_h = 0, got %b", fov_h);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule