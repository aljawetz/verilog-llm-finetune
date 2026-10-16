`timescale 1ns/1ps

module tb_top_module;

    reg [3:0] in;
    wire [1:0] pos;

    // Instantiate the module under test (uut)
    top_module uut (
        .in(in),
        .pos(pos)
    );

    initial begin
        // Test cases
        // Test case 1: Input matches 4'b???1
        in = 4'b0001; #10;
        if (pos !== 2'b00) $display("FAIL: Expected pos = 00 for input 0001, got %b", pos);

        // Test case 2: Input matches 4'b??10
        in = 4'b0010; #10;
        if (pos !== 2'b01) $display("FAIL: Expected pos = 01 for input 0010, got %b", pos);

        // Test case 3: Input matches 4'b?100
        in = 4'b0100; #10;
        if (pos !== 2'b10) $display("FAIL: Expected pos = 10 for input 0100, got %b", pos);

        // Test case 4: Input matches 4'b1000
        in = 4'b1000; #10;
        if (pos !== 2'b11) $display("FAIL: Expected pos = 11 for input 1000, got %b", pos);

        // Test case 5: Input does not match any pattern
        in = 4'b1111; #10;
        if (pos !== 2'b00) $display("FAIL: Expected pos = 00 for input 1111, got %b", pos);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule