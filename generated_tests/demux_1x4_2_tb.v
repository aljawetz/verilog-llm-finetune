`timescale 1ns/1ps

module tb_demux_1x4;

    reg in;
    reg [1:0] sel;
    wire out0, out1, out2, out3;

    // Instantiate the demux_1x4 module
    demux_1x4 uut (
        .in(in),
        .sel(sel),
        .out0(out0),
        .out1(out1),
        .out2(out2),
        .out3(out3)
    );

    initial begin
        // Test case 1: Select 0
        in = 1;
        sel = 2'b00;
        #10;
        if (out0 !== 1 || out1 !== 0 || out2 !== 0 || out3 !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Select 1
        in = 1;
        sel = 2'b01;
        #10;
        if (out0 !== 0 || out1 !== 1 || out2 !== 0 || out3 !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Select 2
        in = 1;
        sel = 2'b10;
        #10;
        if (out0 !== 0 || out1 !== 0 || out2 !== 1 || out3 !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Select 3
        in = 1;
        sel = 2'b11;
        #10;
        if (out0 !== 0 || out1 !== 0 || out2 !== 0 || out3 !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Check with input 0
        in = 0;
        sel = 2'b00;
        #10;
        if (out0 !== 0 || out1 !== 0 || out2 !== 0 || out3 !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule