`timescale 1ns/1ps

module tb_majority_input;

    reg [6:0] in;
    wire out;

    // Instantiate the module under test (uut)
    majority_input uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Majority from first group (1, 1, 0) and second group (1, 0, 0) with single input 1
        in = 7'b1101001; // Expected out = 1
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 1 failed");

        // Test case 2: Majority from first group (0, 0, 0) and second group (0, 0, 0) with single input 0
        in = 7'b0000000; // Expected out = 0
        #10;
        if (out !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: Majority from first group (1, 1, 1) and second group (1, 1, 0) with single input 0
        in = 7'b1111100; // Expected out = 1
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 3 failed");

        // Test case 4: Majority from first group (0, 1, 1) and second group (0, 1, 1) with single input 1
        in = 7'b0110111; // Expected out = 1
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 4 failed");

        // Test case 5: Majority from first group (0, 0, 1) and second group (0, 0, 1) with single input 0
        in = 7'b0000010; // Expected out = 0
        #10;
        if (out !== 1'b0) $display("FAIL: Test case 5 failed");

        // Test case 6: Majority from first group (1, 0, 0) and second group (1, 1, 1) with single input 1
        in = 7'b1001111; // Expected out = 1
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule