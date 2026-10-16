`timescale 1ns/1ps

module tb_demux;

    reg a;
    reg [2:0] s;
    wire [7:0] y;

    // Instantiate the demux module
    demux uut (
        .a(a),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select 0, expect y[0] = 1
        a = 1; s = 3'd0; #10;
        if (y !== 8'b00000001) begin
            $display("FAIL: Test case 1 failed, expected y = 00000001, got y = %b", y);
            $finish;
        end

        // Test case 2: Select 1, expect y[1] = 1
        a = 1; s = 3'd1; #10;
        if (y !== 8'b00000010) begin
            $display("FAIL: Test case 2 failed, expected y = 00000010, got y = %b", y);
            $finish;
        end

        // Test case 3: Select 2, expect y[2] = 1
        a = 1; s = 3'd2; #10;
        if (y !== 8'b00000100) begin
            $display("FAIL: Test case 3 failed, expected y = 00000100, got y = %b", y);
            $finish;
        end

        // Test case 4: Select 3, expect y[3] = 1
        a = 1; s = 3'd3; #10;
        if (y !== 8'b00001000) begin
            $display("FAIL: Test case 4 failed, expected y = 00001000, got y = %b", y);
            $finish;
        end

        // Test case 5: Select 4, expect y[4] = 1
        a = 1; s = 3'd4; #10;
        if (y !== 8'b00010000) begin
            $display("FAIL: Test case 5 failed, expected y = 00010000, got y = %b", y);
            $finish;
        end

        // Test case 6: Select 5, expect y[5] = 1
        a = 1; s = 3'd5; #10;
        if (y !== 8'b00100000) begin
            $display("FAIL: Test case 6 failed, expected y = 00100000, got y = %b", y);
            $finish;
        end

        // Test case 7: Select 6, expect y[6] = 1
        a = 1; s = 3'd6; #10;
        if (y !== 8'b01000000) begin
            $display("FAIL: Test case 7 failed, expected y = 01000000, got y = %b", y);
            $finish;
        end

        // Test case 8: Select 7, expect y[7] = 1
        a = 1; s = 3'd7; #10;
        if (y !== 8'b10000000) begin
            $display("FAIL: Test case 8 failed, expected y = 10000000, got y = %b", y);
            $finish;
        end

        // Test case 9: Select 0 with a = 0, expect all outputs to be 0
        a = 0; s = 3'd0; #10;
        if (y !== 8'b00000000) begin
            $display("FAIL: Test case 9 failed, expected y = 00000000, got y = %b", y);
            $finish;
        end

        // Test case 10: Select 1 with a = 0, expect all outputs to be 0
        a = 0; s = 3'd1; #10;
        if (y !== 8'b00000000) begin
            $display("FAIL: Test case 10 failed, expected y = 00000000, got y = %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule