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
        // Initialize inputs
        a = 0;
        s = 3'b000;

        // Test case 1: a = 0, expect all outputs to be 0
        #10;
        if (y !== 8'b00000000) begin
            $display("FAIL: Test case 1 failed, expected 00000000 but got %b", y);
            $finish;
        end

        // Test case 2: a = 1, s = 000, expect y[0] = 1
        a = 1; s = 3'b000;
        #10;
        if (y !== 8'b00000001) begin
            $display("FAIL: Test case 2 failed, expected 00000001 but got %b", y);
            $finish;
        end

        // Test case 3: a = 1, s = 001, expect y[1] = 1
        s = 3'b001;
        #10;
        if (y !== 8'b00000010) begin
            $display("FAIL: Test case 3 failed, expected 00000010 but got %b", y);
            $finish;
        end

        // Test case 4: a = 1, s = 010, expect y[2] = 1
        s = 3'b010;
        #10;
        if (y !== 8'b00000100) begin
            $display("FAIL: Test case 4 failed, expected 00000100 but got %b", y);
            $finish;
        end

        // Test case 5: a = 1, s = 011, expect y[3] = 1
        s = 3'b011;
        #10;
        if (y !== 8'b00001000) begin
            $display("FAIL: Test case 5 failed, expected 00001000 but got %b", y);
            $finish;
        end

        // Test case 6: a = 1, s = 100, expect y[4] = 1
        s = 3'b100;
        #10;
        if (y !== 8'b00010000) begin
            $display("FAIL: Test case 6 failed, expected 00010000 but got %b", y);
            $finish;
        end

        // Test case 7: a = 1, s = 101, expect y[5] = 1
        s = 3'b101;
        #10;
        if (y !== 8'b00100000) begin
            $display("FAIL: Test case 7 failed, expected 00100000 but got %b", y);
            $finish;
        end

        // Test case 8: a = 1, s = 110, expect y[6] = 1
        s = 3'b110;
        #10;
        if (y !== 8'b01000000) begin
            $display("FAIL: Test case 8 failed, expected 01000000 but got %b", y);
            $finish;
        end

        // Test case 9: a = 1, s = 111, expect y[7] = 1
        s = 3'b111;
        #10;
        if (y !== 8'b10000000) begin
            $display("FAIL: Test case 9 failed, expected 10000000 but got %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule