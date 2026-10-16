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
        // Initialize inputs
        I = 0;
        sel = 3'b000;
        enable = 0;

        // Test case 1: Enable is low, output should be all zeros
        #10;
        if (y !== 8'b00000000) begin
            $display("FAIL: Test case 1 failed, expected 00000000, got %b", y);
            $finish;
        end

        // Test case 2: Enable is high, output should still be all zeros
        enable = 1;
        #10;
        if (y !== 8'b00000000) begin
            $display("FAIL: Test case 2 failed, expected 00000000, got %b", y);
            $finish;
        end

        // Test case 3: Enable is low, select 0, output should reflect I
        enable = 0;
        sel = 3'b000;
        I = 1;
        #10;
        if (y !== 8'b00000001) begin
            $display("FAIL: Test case 3 failed, expected 00000001, got %b", y);
            $finish;
        end

        // Test case 4: Enable is low, select 1, output should reflect I
        sel = 3'b001;
        #10;
        if (y !== 8'b00000010) begin
            $display("FAIL: Test case 4 failed, expected 00000010, got %b", y);
            $finish;
        end

        // Test case 5: Enable is low, select 2, output should reflect I
        sel = 3'b010;
        #10;
        if (y !== 8'b00000100) begin
            $display("FAIL: Test case 5 failed, expected 00000100, got %b", y);
            $finish;
        end

        // Test case 6: Enable is low, select 3, output should reflect I
        sel = 3'b011;
        #10;
        if (y !== 8'b00001000) begin
            $display("FAIL: Test case 6 failed, expected 00001000, got %b", y);
            $finish;
        end

        // Test case 7: Enable is low, select 4, output should reflect I
        sel = 3'b100;
        #10;
        if (y !== 8'b00010000) begin
            $display("FAIL: Test case 7 failed, expected 00010000, got %b", y);
            $finish;
        end

        // Test case 8: Enable is low, select 5, output should reflect I
        sel = 3'b101;
        #10;
        if (y !== 8'b00100000) begin
            $display("FAIL: Test case 8 failed, expected 00100000, got %b", y);
            $finish;
        end

        // Test case 9: Enable is low, select 6, output should reflect I
        sel = 3'b110;
        #10;
        if (y !== 8'b01000000) begin
            $display("FAIL: Test case 9 failed, expected 01000000, got %b", y);
            $finish;
        end

        // Test case 10: Enable is low, select 7, output should reflect I
        sel = 3'b111;
        #10;
        if (y !== 8'b10000000) begin
            $display("FAIL: Test case 10 failed, expected 10000000, got %b", y);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule