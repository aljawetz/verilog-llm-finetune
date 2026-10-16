`timescale 1ns/1ps

module tb_demux_1to4;

    reg enable;
    reg [1:0] select;
    wire out0, out1, out2, out3;

    // Instantiate the module under test
    demux_1to4 uut (
        .enable(enable),
        .select(select),
        .out0(out0),
        .out1(out1),
        .out2(out2),
        .out3(out3)
    );

    initial begin
        // Initialize inputs
        enable = 0;
        select = 2'b00;

        // Test case 1: Enable is low, all outputs should be low
        #10;
        if (out0 !== 1'b0 || out1 !== 1'b0 || out2 !== 1'b0 || out3 !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Enable is high, select = 00
        enable = 1;
        select = 2'b00;
        #10;
        if (out0 !== 1'b1 || out1 !== 1'b0 || out2 !== 1'b0 || out3 !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Enable is high, select = 01
        select = 2'b01;
        #10;
        if (out0 !== 1'b0 || out1 !== 1'b1 || out2 !== 1'b0 || out3 !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Enable is high, select = 10
        select = 2'b10;
        #10;
        if (out0 !== 1'b0 || out1 !== 1'b0 || out2 !== 1'b1 || out3 !== 1'b0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Enable is high, select = 11
        select = 2'b11;
        #10;
        if (out0 !== 1'b0 || out1 !== 1'b0 || out2 !== 1'b0 || out3 !== 1'b1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Enable is low again, all outputs should be low
        enable = 0;
        #10;
        if (out0 !== 1'b0 || out1 !== 1'b0 || out2 !== 1'b0 || out3 !== 1'b0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule