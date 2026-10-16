`timescale 1ns/1ps

module tb_demux_1x8;

    reg a;
    reg [2:0] s;
    wire [7:0] y;

    // Instantiate the module under test (uut)
    demux_1x8 uut (
        .a(a),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select 0, expect y[0] = a
        a = 1; s = 3'b000; #10;
        if (y !== 8'b00000001) begin
            $display("FAIL: Test case 1 failed, expected y = 00000001, got y = %b", y);
            $finish;
        end

        // Test case 2: Select 1, expect y[1] = a
        a = 1; s = 3'b001; #10;
        if (y !== 8'b00000010) begin
            $display("FAIL: Test case 2 failed, expected y = 00000010, got y = %b", y);
            $finish;
        end

        // Test case 3: Select 2, expect y[2] = a
        a = 1; s = 3'b010; #10;
        if (y !== 8'b00000100) begin
            $display("FAIL: Test case 3 failed, expected y = 00000100, got y = %b", y);
            $finish;
        end

        // Test case 4: Select 3, expect y[3] = a
        a = 1; s = 3'b011; #10;
        if (y !== 8'b00001000) begin
            $display("FAIL: Test case 4 failed, expected y = 00001000, got y = %b", y);
            $finish;
        end

        // Test case 5: Select 4, expect y[4] = a
        a = 1; s = 3'b100; #10;
        if (y !== 8'b00010000) begin
            $display("FAIL: Test case 5 failed, expected y = 00010000, got y = %b", y);
            $finish;
        end

        // Test case 6: Select 5, expect y[5] = a
        a = 1; s = 3'b101; #10;
        if (y !== 8'b00100000) begin
            $display("FAIL: Test case 6 failed, expected y = 00100000, got y = %b", y);
            $finish;
        end

        // Test case 7: Select 6, expect y[6] = a
        a = 1; s = 3'b110; #10;
        if (y !== 8'b01000000) begin
            $display("FAIL: Test case 7 failed, expected y = 01000000, got y = %b", y);
            $finish;
        end

        // Test case 8: Select 7, expect y[7] = a
        a = 1; s = 3'b111; #10;
        if (y !== 8'b10000000) begin
            $display("FAIL: Test case 8 failed, expected y = 10000000, got y = %b", y);
            $finish;
        end

        // Test case 9: Check all outputs are low when a = 0
        a = 0; s = 3'b000; #10;
        if (y !== 8'b00000000) begin
            $display("FAIL: Test case 9 failed, expected y = 00000000, got y = %b", y);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule