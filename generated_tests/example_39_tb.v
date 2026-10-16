`timescale 1ns/1ps

module tb_example;
    reg [15:0] in0, in1, in2, in3;
    wire [17:0] sum;

    // Instantiate the module under test (uut)
    example uut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .sum(sum)
    );

    initial begin
        // Test case 1: Simple addition
        in0 = 16'h0001; in1 = 16'h0002; in2 = 16'h0003; in3 = 16'h0004;
        #10;
        if (sum !== 18'h000A) $display("FAIL: Test case 1 failed, expected 0x000A, got 0x%h", sum);

        // Test case 2: Maximum values
        in0 = 16'hFFFF; in1 = 16'hFFFF; in2 = 16'hFFFF; in3 = 16'hFFFF;
        #10;
        if (sum !== 18'h0003FFFF) $display("FAIL: Test case 2 failed, expected 0x3FFFF, got 0x%h", sum);

        // Test case 3: Mixed values
        in0 = 16'h1234; in1 = 16'h5678; in2 = 16'h9ABC; in3 = 16'hDEF0;
        #10;
        if (sum !== 18'h1A2B0) $display("FAIL: Test case 3 failed, expected 0x1A2B0, got 0x%h", sum);

        // Test case 4: Zero inputs
        in0 = 16'h0000; in1 = 16'h0000; in2 = 16'h0000; in3 = 16'h0000;
        #10;
        if (sum !== 18'h0000) $display("FAIL: Test case 4 failed, expected 0x0000, got 0x%h", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule