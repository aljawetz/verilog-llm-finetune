`timescale 1ns/1ps

module tb_priority_encoder;

    reg [7:0] datain;
    wire [2:0] dataout;
    
    // Instantiate the module under test (uut)
    priority_encoder uut (
        .datain(datain),
        .dataout(dataout)
    );

    initial begin
        // Test case 1: Only the highest bit is set
        datain = 8'b10000000; // Expect output: 111
        #10;
        if (dataout !== 3'b111) $display("FAIL: Test case 1 failed, expected 111, got %b", dataout);

        // Test case 2: Second highest bit is set
        datain = 8'b01000000; // Expect output: 110
        #10;
        if (dataout !== 3'b110) $display("FAIL: Test case 2 failed, expected 110, got %b", dataout);

        // Test case 3: Middle bit is set
        datain = 8'b00100000; // Expect output: 101
        #10;
        if (dataout !== 3'b101) $display("FAIL: Test case 3 failed, expected 101, got %b", dataout);

        // Test case 4: Lower bit is set
        datain = 8'b00000010; // Expect output: 001
        #10;
        if (dataout !== 3'b001) $display("FAIL: Test case 4 failed, expected 001, got %b", dataout);

        // Test case 5: No bits set
        datain = 8'b00000000; // Expect output: 000
        #10;
        if (dataout !== 3'b000) $display("FAIL: Test case 5 failed, expected 000, got %b", dataout);

        // Test case 6: Multiple bits set, highest priority should be taken
        datain = 8'b11000000; // Expect output: 111
        #10;
        if (dataout !== 3'b111) $display("FAIL: Test case 6 failed, expected 111, got %b", dataout);

        // Test case 7: Multiple bits set, lower priority should not affect
        datain = 8'b00110000; // Expect output: 101
        #10;
        if (dataout !== 3'b101) $display("FAIL: Test case 7 failed, expected 101, got %b", dataout);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule