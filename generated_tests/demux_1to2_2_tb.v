`timescale 1ns/1ps

module tb_demux_1to2;

    reg enable;
    reg select;
    wire out0;
    wire out1;

    // Instantiate the demux_1to2 module
    demux_1to2 uut (
        .enable(enable),
        .select(select),
        .out0(out0),
        .out1(out1)
    );

    initial begin
        // Test case 1: Enable high, select 0
        enable = 1;
        select = 0;
        #10;
        if (out0 !== 1'b1 || out1 !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Enable high, select 1
        enable = 1;
        select = 1;
        #10;
        if (out0 !== 1'b0 || out1 !== 1'b1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Enable low, select 0
        enable = 0;
        select = 0;
        #10;
        if (out0 !== 1'b0 || out1 !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Enable low, select 1
        enable = 0;
        select = 1;
        #10;
        if (out0 !== 1'b0 || out1 !== 1'b0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Enable high, select 0, then low
        enable = 1;
        select = 0;
        #10;
        enable = 0;
        #10;
        if (out0 !== 1'b0 || out1 !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule