`timescale 1ns/1ps

module tb_priority_circuit;

    reg [7:0] in;
    wire [7:0] prio;

    // Instantiate the module under test (uut)
    priority_circuit uut (
        .in(in),
        .prio(prio)
    );

    initial begin
        // Test case 1: Only the highest bit is active
        in = 8'b10000000; // Input: 128
        #10;
        if (prio !== 8'b10000000) $display("FAIL: Test case 1 failed, expected 10000000, got %b", prio);

        // Test case 2: Second highest bit is active
        in = 8'b01000000; // Input: 64
        #10;
        if (prio !== 8'b01000000) $display("FAIL: Test case 2 failed, expected 01000000, got %b", prio);

        // Test case 3: Middle bit is active
        in = 8'b00100000; // Input: 32
        #10;
        if (prio !== 8'b00100000) $display("FAIL: Test case 3 failed, expected 00100000, got %b", prio);

        // Test case 4: Lower bit is active
        in = 8'b00000001; // Input: 1
        #10;
        if (prio !== 8'b00000001) $display("FAIL: Test case 4 failed, expected 00000001, got %b", prio);

        // Test case 5: Multiple bits active, highest priority should be taken
        in = 8'b01100000; // Input: 96
        #10;
        if (prio !== 8'b01000000) $display("FAIL: Test case 5 failed, expected 01000000, got %b", prio);

        // Test case 6: All bits inactive
        in = 8'b00000000; // Input: 0
        #10;
        if (prio !== 8'b00000000) $display("FAIL: Test case 6 failed, expected 00000000, got %b", prio);

        // Test case 7: Multiple bits active, highest priority should be taken
        in = 8'b00010100; // Input: 20
        #10;
        if (prio !== 8'b00010000) $display("FAIL: Test case 7 failed, expected 00010000, got %b", prio);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule