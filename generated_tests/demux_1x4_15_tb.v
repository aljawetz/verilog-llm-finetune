`timescale 1ns/1ps

module tb_demux_1x4;

    reg din;
    reg [1:0] sel;
    wire dout_0, dout_1, dout_2, dout_3;

    // Instantiate the module under test
    demux_1x4 uut (
        .din(din),
        .sel(sel),
        .dout_0(dout_0),
        .dout_1(dout_1),
        .dout_2(dout_2),
        .dout_3(dout_3)
    );

    initial begin
        // Test case 1: Select 0, expect dout_0 to be din
        din = 1'b1; sel = 2'b00; #10;
        if (dout_0 !== 1'b1 || dout_1 !== 1'b0 || dout_2 !== 1'b0 || dout_3 !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Select 1, expect dout_1 to be din
        din = 1'b1; sel = 2'b01; #10;
        if (dout_0 !== 1'b0 || dout_1 !== 1'b1 || dout_2 !== 1'b0 || dout_3 !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Select 2, expect dout_2 to be din
        din = 1'b1; sel = 2'b10; #10;
        if (dout_0 !== 1'b0 || dout_1 !== 1'b0 || dout_2 !== 1'b1 || dout_3 !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Select 3, expect dout_3 to be din
        din = 1'b1; sel = 2'b11; #10;
        if (dout_0 !== 1'b0 || dout_1 !== 1'b0 || dout_2 !== 1'b0 || dout_3 !== 1'b1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Check with din = 0
        din = 1'b0; sel = 2'b00; #10;
        if (dout_0 !== 1'b0 || dout_1 !== 1'b0 || dout_2 !== 1'b0 || dout_3 !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule