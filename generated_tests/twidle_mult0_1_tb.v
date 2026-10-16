`timescale 1ns/1ps

module tb_twidle_mult0;

    reg in_point;
    reg signed [15:0] in_r, in_i;
    wire signed [15:0] out_r, out_i;

    // Instantiate the module under test
    twidle_mult0 uut (
        .in_point(in_point),
        .in_r(in_r),
        .in_i(in_i),
        .out_r(out_r),
        .out_i(out_i)
    );

    initial begin
        // Test case 1: Rotate by 0°
        in_point = 0;
        in_r = 16'h0001; // 1
        in_i = 16'h0002; // 2
        #10;
        if (out_r !== in_r || out_i !== in_i) begin
            $display("FAIL: Test case 1 failed (0° rotation)");
            $finish;
        end

        // Test case 2: Rotate by 90°
        in_point = 1;
        in_r = 16'h0001; // 1
        in_i = 16'h0002; // 2
        #10;
        if (out_r !== in_i || out_i !== -in_r) begin
            $display("FAIL: Test case 2 failed (90° rotation)");
            $finish;
        end

        // Test case 3: Rotate by 0° with negative values
        in_point = 0;
        in_r = 16'hFFFE; // -2
        in_i = 16'hFFFF; // -1
        #10;
        if (out_r !== in_r || out_i !== in_i) begin
            $display("FAIL: Test case 3 failed (0° rotation with negatives)");
            $finish;
        end

        // Test case 4: Rotate by 90° with negative values
        in_point = 1;
        in_r = 16'hFFFE; // -2
        in_i = 16'hFFFF; // -1
        #10;
        if (out_r !== in_i || out_i !== -in_r) begin
            $display("FAIL: Test case 4 failed (90° rotation with negatives)");
            $finish;
        end

        // Test case 5: Rotate by 0° with zero values
        in_point = 0;
        in_r = 16'h0000; // 0
        in_i = 16'h0000; // 0
        #10;
        if (out_r !== in_r || out_i !== in_i) begin
            $display("FAIL: Test case 5 failed (0° rotation with zeros)");
            $finish;
        end

        // Test case 6: Rotate by 90° with zero values
        in_point = 1;
        in_r = 16'h0000; // 0
        in_i = 16'h0000; // 0
        #10;
        if (out_r !== in_i || out_i !== -in_r) begin
            $display("FAIL: Test case 6 failed (90° rotation with zeros)");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule