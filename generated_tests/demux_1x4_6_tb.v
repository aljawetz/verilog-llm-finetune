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
        // Initialize inputs
        a = 0;
        s = 2'b00;

        // Test case 1: a = 0, s = 00
        #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 1 failed, expected y = 0000, got y = %b", y);
            $finish;
        end

        // Test case 2: a = 1, s = 00
        a = 1; s = 2'b00;
        #10;
        if (y !== 4'b0001) begin
            $display("FAIL: Test case 2 failed, expected y = 0001, got y = %b", y);
            $finish;
        end

        // Test case 3: a = 1, s = 01
        a = 1; s = 2'b01;
        #10;
        if (y !== 4'b0010) begin
            $display("FAIL: Test case 3 failed, expected y = 0010, got y = %b", y);
            $finish;
        end

        // Test case 4: a = 1, s = 10
        a = 1; s = 2'b10;
        #10;
        if (y !== 4'b0100) begin
            $display("FAIL: Test case 4 failed, expected y = 0100, got y = %b", y);
            $finish;
        end

        // Test case 5: a = 1, s = 11
        a = 1; s = 2'b11;
        #10;
        if (y !== 4'b1000) begin
            $display("FAIL: Test case 5 failed, expected y = 1000, got y = %b", y);
            $finish;
        end

        // Test case 6: a = 0, s = 01
        a = 0; s = 2'b01;
        #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 6 failed, expected y = 0000, got y = %b", y);
            $finish;
        end

        // Test case 7: a = 0, s = 10
        a = 0; s = 2'b10;
        #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 7 failed, expected y = 0000, got y = %b", y);
            $finish;
        end

        // Test case 8: a = 0, s = 11
        a = 0; s = 2'b11;
        #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 8 failed, expected y = 0000, got y = %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule