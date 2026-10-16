`timescale 1ns/1ps

module tb_demux_1x8;

    reg I;
    reg [2:0] sel;
    reg enable;
    wire [7:0] y;

    // Instantiate the module under test (uut)
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

        // Test case 1: Enable is low, select output 0
        I = 1;
        sel = 3'b000;
        enable = 0;
        #10;
        if (y !== 8'b00000001) begin
            $display("FAIL: Test case 1 failed, expected y = 00000001, got y = %b", y);
            $finish;
        end

        // Test case 2: Enable is low, select output 1
        sel = 3'b001;
        #10;
        if (y !== 8'b00000010) begin
            $display("FAIL: Test case 2 failed, expected y = 00000010, got y = %b", y);
            $finish;
        end

        // Test case 3: Enable is low, select output 2
        sel = 3'b010;
        #10;
        if (y !== 8'b00000100) begin
            $display("FAIL: Test case 3 failed, expected y = 00000100, got y = %b", y);
            $finish;
        end

        // Test case 4: Enable is low, select output 3
        sel = 3'b011;
        #10;
        if (y !== 8'b00001000) begin
            $display("FAIL: Test case 4 failed, expected y = 00001000, got y = %b", y);
            $finish;
        end

        // Test case 5: Enable is low, select output 4
        sel = 3'b100;
        #10;
        if (y !== 8'b00010000) begin
            $display("FAIL: Test case 5 failed, expected y = 00010000, got y = %b", y);
            $finish;
        end

        // Test case 6: Enable is low, select output 5
        sel = 3'b101;
        #10;
        if (y !== 8'b00100000) begin
            $display("FAIL: Test case 6 failed, expected y = 00100000, got y = %b", y);
            $finish;
        end

        // Test case 7: Enable is low, select output 6
        sel = 3'b110;
        #10;
        if (y !== 8'b01000000) begin
            $display("FAIL: Test case 7 failed, expected y = 01000000, got y = %b", y);
            $finish;
        end

        // Test case 8: Enable is low, select output 7
        sel = 3'b111;
        #10;
        if (y !== 8'b10000000) begin
            $display("FAIL: Test case 8 failed, expected y = 10000000, got y = %b", y);
            $finish;
        end

        // Test case 9: Enable is high, all outputs should be zero
        enable = 1;
        #10;
        if (y !== 8'b00000000) begin
            $display("FAIL: Test case 9 failed, expected y = 00000000, got y = %b", y);
            $finish;
        end

        // Test case 10: Enable is high, check with different select
        sel = 3'b010;
        #10;
        if (y !== 8'b00000000) begin
            $display("FAIL: Test case 10 failed, expected y = 00000000, got y = %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule