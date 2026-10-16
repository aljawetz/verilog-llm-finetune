`timescale 1ns/1ps

module tb_top_module;

    reg [3:0] in;
    wire [1:0] pos;

    // Instantiate the module under test
    top_module uut (
        .in(in),
        .pos(pos)
    );

    initial begin
        // Test cases
        // Test case 1: in = 4'b0001, expect pos = 0
        in = 4'b0001; #10;
        if (pos !== 2'b00) begin
            $display("FAIL: Expected pos = 00 for in = 0001, got pos = %b", pos);
            $finish;
        end

        // Test case 2: in = 4'b0010, expect pos = 1
        in = 4'b0010; #10;
        if (pos !== 2'b01) begin
            $display("FAIL: Expected pos = 01 for in = 0010, got pos = %b", pos);
            $finish;
        end

        // Test case 3: in = 4'b0100, expect pos = 2
        in = 4'b0100; #10;
        if (pos !== 2'b10) begin
            $display("FAIL: Expected pos = 10 for in = 0100, got pos = %b", pos);
            $finish;
        end

        // Test case 4: in = 4'b1000, expect pos = 3
        in = 4'b1000; #10;
        if (pos !== 2'b11) begin
            $display("FAIL: Expected pos = 11 for in = 1000, got pos = %b", pos);
            $finish;
        end

        // Test case 5: in = 4'b1111, expect pos = 0 (default case)
        in = 4'b1111; #10;
        if (pos !== 2'b00) begin
            $display("FAIL: Expected pos = 00 for in = 1111, got pos = %b", pos);
            $finish;
        end

        // Test case 6: in = 4'b1101, expect pos = 0 (default case)
        in = 4'b1101; #10;
        if (pos !== 2'b00) begin
            $display("FAIL: Expected pos = 00 for in = 1101, got pos = %b", pos);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule