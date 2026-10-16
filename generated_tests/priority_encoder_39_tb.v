`timescale 1ns/1ps

module tb_priority_encoder;

    reg [2:0] i;
    wire [1:0] y;

    // Instantiate the module under test (uut)
    priority_encoder uut (
        .i(i),
        .y(y)
    );

    initial begin
        // Test case 1: No bits set
        i = 3'b000; #10;
        if (y !== 2'b11) begin
            $display("FAIL: Expected 2'b11 for input 3'b000, got %b", y);
            $finish;
        end

        // Test case 2: Only the least significant bit set
        i = 3'b001; #10;
        if (y !== 2'b00) begin
            $display("FAIL: Expected 2'b00 for input 3'b001, got %b", y);
            $finish;
        end

        // Test case 3: Middle bit set
        i = 3'b010; #10;
        if (y !== 2'b01) begin
            $display("FAIL: Expected 2'b01 for input 3'b010, got %b", y);
            $finish;
        end

        // Test case 4: Most significant bit set
        i = 3'b100; #10;
        if (y !== 2'b10) begin
            $display("FAIL: Expected 2'b10 for input 3'b100, got %b", y);
            $finish;
        end

        // Test case 5: Multiple bits set (highest priority)
        i = 3'b110; #10;
        if (y !== 2'b10) begin
            $display("FAIL: Expected 2'b10 for input 3'b110, got %b", y);
            $finish;
        end

        // Test case 6: All bits set
        i = 3'b111; #10;
        if (y !== 2'b10) begin
            $display("FAIL: Expected 2'b10 for input 3'b111, got %b", y);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule