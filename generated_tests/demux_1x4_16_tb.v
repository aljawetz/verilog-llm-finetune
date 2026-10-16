`timescale 1ns/1ps

module tb_demux_1x4;

    reg a;
    reg [1:0] s;
    wire [3:0] y;

    // Instantiate the demux_1x4 module
    demux_1x4 uut (
        .a(a),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Input a = 1, select = 00
        a = 1; s = 2'b00; #10;
        if (y !== 4'b0001) begin
            $display("FAIL: Test case 1 failed, expected y = 0001, got y = %b", y);
            $finish;
        end

        // Test case 2: Input a = 1, select = 01
        a = 1; s = 2'b01; #10;
        if (y !== 4'b0010) begin
            $display("FAIL: Test case 2 failed, expected y = 0010, got y = %b", y);
            $finish;
        end

        // Test case 3: Input a = 1, select = 10
        a = 1; s = 2'b10; #10;
        if (y !== 4'b0100) begin
            $display("FAIL: Test case 3 failed, expected y = 0100, got y = %b", y);
            $finish;
        end

        // Test case 4: Input a = 1, select = 11
        a = 1; s = 2'b11; #10;
        if (y !== 4'b1000) begin
            $display("FAIL: Test case 4 failed, expected y = 1000, got y = %b", y);
            $finish;
        end

        // Test case 5: Input a = 0, select = 00
        a = 0; s = 2'b00; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 5 failed, expected y = 0000, got y = %b", y);
            $finish;
        end

        // Test case 6: Input a = 0, select = 01
        a = 0; s = 2'b01; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 6 failed, expected y = 0000, got y = %b", y);
            $finish;
        end

        // Test case 7: Input a = 0, select = 10
        a = 0; s = 2'b10; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 7 failed, expected y = 0000, got y = %b", y);
            $finish;
        end

        // Test case 8: Input a = 0, select = 11
        a = 0; s = 2'b11; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 8 failed, expected y = 0000, got y = %b", y);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule