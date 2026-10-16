`timescale 1ns/1ps

module tb_demux_1to4_1;

    reg a;
    reg [1:0] s;
    wire [3:0] y;

    // Instantiate the module under test (uut)
    demux_1to4_1 uut (
        .a(a),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select line 00
        a = 1'b1; s = 2'b00; #10;
        if (y !== 4'b0001) begin
            $display("FAIL: Test case 1 failed, expected 0001, got %b", y);
            $finish;
        end

        // Test case 2: Select line 01
        a = 1'b1; s = 2'b01; #10;
        if (y !== 4'b0010) begin
            $display("FAIL: Test case 2 failed, expected 0010, got %b", y);
            $finish;
        end

        // Test case 3: Select line 10
        a = 1'b1; s = 2'b10; #10;
        if (y !== 4'b0100) begin
            $display("FAIL: Test case 3 failed, expected 0100, got %b", y);
            $finish;
        end

        // Test case 4: Select line 11
        a = 1'b1; s = 2'b11; #10;
        if (y !== 4'b1000) begin
            $display("FAIL: Test case 4 failed, expected 1000, got %b", y);
            $finish;
        end

        // Test case 5: Check with a = 0
        a = 1'b0; s = 2'b00; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 5 failed, expected 0000, got %b", y);
            $finish;
        end

        // Test case 6: Check with a = 0 and different select lines
        a = 1'b0; s = 2'b01; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 6 failed, expected 0000, got %b", y);
            $finish;
        end

        a = 1'b0; s = 2'b10; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 7 failed, expected 0000, got %b", y);
            $finish;
        end

        a = 1'b0; s = 2'b11; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 8 failed, expected 0000, got %b", y);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule