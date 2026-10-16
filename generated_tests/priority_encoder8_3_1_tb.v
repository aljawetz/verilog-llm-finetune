`timescale 1ns/1ps

module tb_priority_encoder8_3;
    reg [7:0] d;
    wire [2:0] y;
    wire valid;

    // Instantiate the module under test (uut)
    priority_encoder8_3 uut (
        .d(d),
        .y(y),
        .valid(valid)
    );

    initial begin
        // Test case 1: Only the highest bit is active
        d = 8'b10000000; #10;
        if (y !== 3'b111 || valid !== 1'b1) $display("FAIL: Test case 1 failed");

        // Test case 2: Second highest bit is active
        d = 8'b01000000; #10;
        if (y !== 3'b110 || valid !== 1'b1) $display("FAIL: Test case 2 failed");

        // Test case 3: Middle bit is active
        d = 8'b00100000; #10;
        if (y !== 3'b101 || valid !== 1'b1) $display("FAIL: Test case 3 failed");

        // Test case 4: Lower bit is active
        d = 8'b00010000; #10;
        if (y !== 3'b100 || valid !== 1'b1) $display("FAIL: Test case 4 failed");

        // Test case 5: Multiple lower bits are active
        d = 8'b00001111; #10;
        if (y !== 3'b011 || valid !== 1'b1) $display("FAIL: Test case 5 failed");

        // Test case 6: Second lowest bit is active
        d = 8'b00000010; #10;
        if (y !== 3'b001 || valid !== 1'b1) $display("FAIL: Test case 6 failed");

        // Test case 7: Only the lowest bit is active
        d = 8'b00000001; #10;
        if (y !== 3'b000 || valid !== 1'b1) $display("FAIL: Test case 7 failed");

        // Test case 8: No bits are active
        d = 8'b00000000; #10;
        if (y !== 3'b000 || valid !== 1'b0) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule