`timescale 1ns/1ps

module tb_thePriorityEncoder;

    reg [7:0] data;
    wire [2:0] out;

    // Instantiate the module under test (uut)
    thePriorityEncoder uut (
        .data(data),
        .out(out)
    );

    initial begin
        // Test case 1: Highest bit set (data = 8'b10000000)
        data = 8'b10000000; #10;
        if (out !== 3'b111) $display("FAIL: Expected 3'b111 for input 8'b10000000, got %b", out);

        // Test case 2: Second highest bit set (data = 8'b01000000)
        data = 8'b01000000; #10;
        if (out !== 3'b110) $display("FAIL: Expected 3'b110 for input 8'b01000000, got %b", out);

        // Test case 3: Middle bit set (data = 8'b00100000)
        data = 8'b00100000; #10;
        if (out !== 3'b101) $display("FAIL: Expected 3'b101 for input 8'b00100000, got %b", out);

        // Test case 4: Lower middle bit set (data = 8'b00010000)
        data = 8'b00010000; #10;
        if (out !== 3'b100) $display("FAIL: Expected 3'b100 for input 8'b00010000, got %b", out);

        // Test case 5: Lower bit set (data = 8'b00000010)
        data = 8'b00000010; #10;
        if (out !== 3'b001) $display("FAIL: Expected 3'b001 for input 8'b00000010, got %b", out);

        // Test case 6: No bits set (data = 8'b00000000)
        data = 8'b00000000; #10;
        if (out !== 3'b000) $display("FAIL: Expected 3'b000 for input 8'b00000000, got %b", out);

        // Test case 7: Multiple bits set (data = 8'b11000000)
        data = 8'b11000000; #10;
        if (out !== 3'b111) $display("FAIL: Expected 3'b111 for input 8'b11000000, got %b", out);

        // Test case 8: Another multiple bits set (data = 8'b00110000)
        data = 8'b00110000; #10;
        if (out !== 3'b101) $display("FAIL: Expected 3'b101 for input 8'b00110000, got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule