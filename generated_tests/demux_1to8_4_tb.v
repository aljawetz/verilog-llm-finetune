`timescale 1ns/1ps

module tb_demux_1to8;

    reg [2:0] sel;
    reg in;
    wire [7:0] y;

    // Instantiate the module under test (uut)
    demux_1to8 uut (
        .sel(sel),
        .in(in),
        .y(y)
    );

    initial begin
        // Test case 1: Select 0, input 1
        sel = 3'd0; in = 1'b1;
        #10;
        if (y !== 8'b00000001) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Select 1, input 1
        sel = 3'd1; in = 1'b1;
        #10;
        if (y !== 8'b00000010) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Select 2, input 1
        sel = 3'd2; in = 1'b1;
        #10;
        if (y !== 8'b00000100) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Select 3, input 1
        sel = 3'd3; in = 1'b1;
        #10;
        if (y !== 8'b00001000) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Select 4, input 1
        sel = 3'd4; in = 1'b1;
        #10;
        if (y !== 8'b00010000) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Select 5, input 1
        sel = 3'd5; in = 1'b1;
        #10;
        if (y !== 8'b00100000) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: Select 6, input 1
        sel = 3'd6; in = 1'b1;
        #10;
        if (y !== 8'b01000000) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: Select 7, input 1
        sel = 3'd7; in = 1'b1;
        #10;
        if (y !== 8'b10000000) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // Test case 9: Select 0, input 0
        sel = 3'd0; in = 1'b0;
        #10;
        if (y !== 8'b00000000) begin
            $display("FAIL: Test case 9 failed");
            $finish;
        end

        // Test case 10: Select 1, input 0
        sel = 3'd1; in = 1'b0;
        #10;
        if (y !== 8'b00000000) begin
            $display("FAIL: Test case 10 failed");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule