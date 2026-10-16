`timescale 1ns/1ps

module tb_demux_1to2;

    reg a;
    reg s;
    wire [1:0] y;

    // Instantiate the module under test (uut)
    demux_1to2 uut (
        .a(a),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: s = 0, a = 1
        a = 1'b1; s = 1'b0;
        #10;
        if (y !== 2'b01) begin
            $display("FAIL: Test case 1 failed, expected y = 01, got y = %b", y);
            $finish;
        end

        // Test case 2: s = 0, a = 0
        a = 1'b0; s = 1'b0;
        #10;
        if (y !== 2'b00) begin
            $display("FAIL: Test case 2 failed, expected y = 00, got y = %b", y);
            $finish;
        end

        // Test case 3: s = 1, a = 1
        a = 1'b1; s = 1'b1;
        #10;
        if (y !== 2'b10) begin
            $display("FAIL: Test case 3 failed, expected y = 10, got y = %b", y);
            $finish;
        end

        // Test case 4: s = 1, a = 0
        a = 1'b0; s = 1'b1;
        #10;
        if (y !== 2'b00) begin
            $display("FAIL: Test case 4 failed, expected y = 00, got y = %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule