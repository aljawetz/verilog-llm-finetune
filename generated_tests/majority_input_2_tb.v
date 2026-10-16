`timescale 1ns/1ps

module tb_majority_input;

    reg [6:0] in;
    wire out;

    // Instantiate the module under test
    majority_input uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Majority from first group (1, 1, 0) and second group (0, 0, 0) with 0
        in = 7'b1100000; // Expect out = 0
        #10;
        if (out !== 1'b0) $display("FAIL: Test case 1 failed, expected 0 but got %b", out);

        // Test case 2: Majority from first group (1, 1, 1) and second group (0, 0, 0) with 0
        in = 7'b1110000; // Expect out = 0
        #10;
        if (out !== 1'b0) $display("FAIL: Test case 2 failed, expected 0 but got %b", out);

        // Test case 3: Majority from first group (1, 1, 0) and second group (1, 1, 0) with 1
        in = 7'b1101101; // Expect out = 1
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 3 failed, expected 1 but got %b", out);

        // Test case 4: Majority from first group (0, 0, 1) and second group (1, 1, 1) with 1
        in = 7'b0011111; // Expect out = 1
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 4 failed, expected 1 but got %b", out);

        // Test case 5: Majority from first group (1, 0, 1) and second group (1, 0, 1) with 1
        in = 7'b1011011; // Expect out = 1
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 5 failed, expected 1 but got %b", out);

        // Test case 6: All zeros
        in = 7'b0000000; // Expect out = 0
        #10;
        if (out !== 1'b0) $display("FAIL: Test case 6 failed, expected 0 but got %b", out);

        // Test case 7: All ones
        in = 7'b1111111; // Expect out = 1
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 7 failed, expected 1 but got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule