`timescale 1ns/1ps

module tb_demux_1x2;

    reg din;
    reg sel;
    wire dout_0;
    wire dout_1;

    // Instantiate the module under test (uut)
    demux_1x2 uut (
        .din(din),
        .sel(sel),
        .dout_0(dout_0),
        .dout_1(dout_1)
    );

    initial begin
        // Test sequence
        // Test case 1: sel = 0, din = 1
        din = 1; sel = 0;
        #10;
        if (dout_0 !== 1'b1 || dout_1 !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: sel = 0, din = 0
        din = 0; sel = 0;
        #10;
        if (dout_0 !== 1'b0 || dout_1 !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: sel = 1, din = 1
        din = 1; sel = 1;
        #10;
        if (dout_0 !== 1'b0 || dout_1 !== 1'b1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: sel = 1, din = 0
        din = 0; sel = 1;
        #10;
        if (dout_0 !== 1'b0 || dout_1 !== 1'b0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule