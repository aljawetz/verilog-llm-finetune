`timescale 1ns/1ps

module tb_demux_1x8;

    reg I;
    reg [2:0] sel;
    reg enable;
    wire [7:0] y;

    // Instantiate the demux_1x8 module
    demux_1x8 uut (
        .I(I),
        .sel(sel),
        .enable(enable),
        .y(y)
    );

    initial begin
        // Test case 1: Enable is low, select output 0
        I = 1'b1; sel = 3'd0; enable = 1'b0;
        #10;
        if (y !== 8'b00000001) begin
            $display("FAIL: Test case 1 failed, expected 00000001, got %b", y);
            $finish;
        end

        // Test case 2: Enable is low, select output 3
        I = 1'b1; sel = 3'd3; enable = 1'b0;
        #10;
        if (y !== 8'b00001000) begin
            $display("FAIL: Test case 2 failed, expected 00001000, got %b", y);
            $finish;
        end

        // Test case 3: Enable is high, all outputs should be zero
        I = 1'b1; sel = 3'd5; enable = 1'b1;
        #10;
        if (y !== 8'b00000000) begin
            $display("FAIL: Test case 3 failed, expected 00000000, got %b", y);
            $finish;
        end

        // Test case 4: Enable is low, select output 7
        I = 1'b1; sel = 3'd7; enable = 1'b0;
        #10;
        if (y !== 8'b10000000) begin
            $display("FAIL: Test case 4 failed, expected 10000000, got %b", y);
            $finish;
        end

        // Test case 5: Enable is high, select output 0
        I = 1'b0; sel = 3'd0; enable = 1'b1;
        #10;
        if (y !== 8'b00000000) begin
            $display("FAIL: Test case 5 failed, expected 00000000, got %b", y);
            $finish;
        end

        // Test case 6: Enable is low, select output 2
        I = 1'b1; sel = 3'd2; enable = 1'b0;
        #10;
        if (y !== 8'b00000100) begin
            $display("FAIL: Test case 6 failed, expected 00000100, got %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule