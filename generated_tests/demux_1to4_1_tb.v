`timescale 1ns/1ps

module tb_demux_1to4;

    reg in;
    reg [1:0] sel;
    wire [3:0] out;

    // Instantiate the module under test (uut)
    demux_1to4 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1: Select 00, expect out[0] = in
        in = 1'b1; sel = 2'b00; #10;
        if (out !== 4'b0001) begin
            $display("FAIL: Test case 1 failed, expected out = 0001, got out = %b", out);
            $finish;
        end

        // Test case 2: Select 01, expect out[1] = in
        in = 1'b1; sel = 2'b01; #10;
        if (out !== 4'b0010) begin
            $display("FAIL: Test case 2 failed, expected out = 0010, got out = %b", out);
            $finish;
        end

        // Test case 3: Select 10, expect out[2] = in
        in = 1'b1; sel = 2'b10; #10;
        if (out !== 4'b0100) begin
            $display("FAIL: Test case 3 failed, expected out = 0100, got out = %b", out);
            $finish;
        end

        // Test case 4: Select 11, expect out[3] = in
        in = 1'b1; sel = 2'b11; #10;
        if (out !== 4'b1000) begin
            $display("FAIL: Test case 4 failed, expected out = 1000, got out = %b", out);
            $finish;
        end

        // Test case 5: Check all outputs are low when in = 0
        in = 1'b0; sel = 2'b00; #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 5 failed, expected out = 0000, got out = %b", out);
            $finish;
        end

        // Test case 6: Check all outputs are low when in = 0 and different sel
        in = 1'b0; sel = 2'b01; #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 6 failed, expected out = 0000, got out = %b", out);
            $finish;
        end

        in = 1'b0; sel = 2'b10; #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 7 failed, expected out = 0000, got out = %b", out);
            $finish;
        end

        in = 1'b0; sel = 2'b11; #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 8 failed, expected out = 0000, got out = %b", out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule