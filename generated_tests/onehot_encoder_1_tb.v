`timescale 1ns/1ps

module tb_onehot_encoder;

    reg [3:0] datain;
    wire [15:0] dataout;

    // Instantiate the module under test (uut)
    onehot_encoder uut (
        .datain(datain),
        .dataout(dataout)
    );

    initial begin
        // Test cases
        // Test case 0
        datain = 4'd0; #10;
        if (dataout !== 16'b0000000000000001) begin
            $display("FAIL: Test case 0 failed");
            $finish;
        end

        // Test case 1
        datain = 4'd1; #10;
        if (dataout !== 16'b0000000000000010) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2
        datain = 4'd2; #10;
        if (dataout !== 16'b0000000000000100) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3
        datain = 4'd3; #10;
        if (dataout !== 16'b0000000000001000) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4
        datain = 4'd4; #10;
        if (dataout !== 16'b0000000000010000) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5
        datain = 4'd5; #10;
        if (dataout !== 16'b0000000000100000) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6
        datain = 4'd6; #10;
        if (dataout !== 16'b0000000001000000) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7
        datain = 4'd7; #10;
        if (dataout !== 16'b0000000010000000) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8
        datain = 4'd8; #10;
        if (dataout !== 16'b0000000100000000) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // Test case 9
        datain = 4'd9; #10;
        if (dataout !== 16'b0000001000000000) begin
            $display("FAIL: Test case 9 failed");
            $finish;
        end

        // Test case 10
        datain = 4'd10; #10;
        if (dataout !== 16'b0000010000000000) begin
            $display("FAIL: Test case 10 failed");
            $finish;
        end

        // Test case 11
        datain = 4'd11; #10;
        if (dataout !== 16'b0000100000000000) begin
            $display("FAIL: Test case 11 failed");
            $finish;
        end

        // Test case 12
        datain = 4'd12; #10;
        if (dataout !== 16'b0001000000000000) begin
            $display("FAIL: Test case 12 failed");
            $finish;
        end

        // Test case 13
        datain = 4'd13; #10;
        if (dataout !== 16'b0010000000000000) begin
            $display("FAIL: Test case 13 failed");
            $finish;
        end

        // Test case 14
        datain = 4'd14; #10;
        if (dataout !== 16'b0100000000000000) begin
            $display("FAIL: Test case 14 failed");
            $finish;
        end

        // Test case 15
        datain = 4'd15; #10;
        if (dataout !== 16'b1000000000000000) begin
            $display("FAIL: Test case 15 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule