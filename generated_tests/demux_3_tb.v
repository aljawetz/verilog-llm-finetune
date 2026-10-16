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
        // Test case 1: Select line 0
        a = 1; s = 3'd0; #10;
        if (y !== 8'b00000001) $display("FAIL: Test case 1 failed, expected 00000001, got %b", y);

        // Test case 2: Select line 1
        a = 1; s = 3'd1; #10;
        if (y !== 8'b00000010) $display("FAIL: Test case 2 failed, expected 00000010, got %b", y);

        // Test case 3: Select line 2
        a = 1; s = 3'd2; #10;
        if (y !== 8'b00000100) $display("FAIL: Test case 3 failed, expected 00000100, got %b", y);

        // Test case 4: Select line 3
        a = 1; s = 3'd3; #10;
        if (y !== 8'b00001000) $display("FAIL: Test case 4 failed, expected 00001000, got %b", y);

        // Test case 5: Select line 4
        a = 1; s = 3'd4; #10;
        if (y !== 8'b00010000) $display("FAIL: Test case 5 failed, expected 00010000, got %b", y);

        // Test case 6: Select line 5
        a = 1; s = 3'd5; #10;
        if (y !== 8'b00100000) $display("FAIL: Test case 6 failed, expected 00100000, got %b", y);

        // Test case 7: Select line 6
        a = 1; s = 3'd6; #10;
        if (y !== 8'b01000000) $display("FAIL: Test case 7 failed, expected 01000000, got %b", y);

        // Test case 8: Select line 7
        a = 1; s = 3'd7; #10;
        if (y !== 8'b10000000) $display("FAIL: Test case 8 failed, expected 10000000, got %b", y);

        // Test case 9: Check all outputs are zero when a is 0
        a = 0; s = 3'd0; #10;
        if (y !== 8'b00000000) $display("FAIL: Test case 9 failed, expected 00000000, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule