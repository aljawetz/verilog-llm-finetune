`timescale 1ns/1ps

module tb_simple_cal;

    reg [3:0] in; // 4-bit input to accommodate left shift
    wire [3:0] out; // 4-bit output to accommodate the result

    // Instantiate the module under test (uut)
    simple_cal uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test sequence
        in = 4'b0000; // Test with input 0
        #10;
        if (out !== 4'b0001) $display("FAIL: Expected out = 1 for in = 0, got out = %b", out);

        in = 4'b0001; // Test with input 1
        #10;
        if (out !== 4'b0011) $display("FAIL: Expected out = 3 for in = 1, got out = %b", out);

        in = 4'b0010; // Test with input 2
        #10;
        if (out !== 4'b0101) $display("FAIL: Expected out = 5 for in = 2, got out = %b", out);

        in = 4'b0011; // Test with input 3
        #10;
        if (out !== 4'b0111) $display("FAIL: Expected out = 7 for in = 3, got out = %b", out);

        in = 4'b0100; // Test with input 4
        #10;
        if (out !== 4'b1001) $display("FAIL: Expected out = 9 for in = 4, got out = %b", out);

        in = 4'b1111; // Test with maximum input 15
        #10;
        if (out !== 4'b1111) $display("FAIL: Expected out = 15 for in = 15, got out = %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule