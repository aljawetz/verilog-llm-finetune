`timescale 1ns/1ps

module tb_priority_encoder_bh;

    reg [7:0] i;
    wire [2:0] y;

    // Instantiate the module under test (uut)
    priority_encoder_bh uut (
        .i(i),
        .y(y)
    );

    initial begin
        // Test case 1: Only the least significant bit is high
        i = 8'b00000001; #10;
        if (y !== 3'b000) begin
            $display("FAIL: Test case 1 failed, expected 000, got %b", y);
            $finish;
        end

        // Test case 2: Second bit is high
        i = 8'b00000010; #10;
        if (y !== 3'b001) begin
            $display("FAIL: Test case 2 failed, expected 001, got %b", y);
            $finish;
        end

        // Test case 3: Third bit is high
        i = 8'b00000100; #10;
        if (y !== 3'b010) begin
            $display("FAIL: Test case 3 failed, expected 010, got %b", y);
            $finish;
        end

        // Test case 4: Fourth bit is high
        i = 8'b00001000; #10;
        if (y !== 3'b011) begin
            $display("FAIL: Test case 4 failed, expected 011, got %b", y);
            $finish;
        end

        // Test case 5: Fifth bit is high
        i = 8'b00010000; #10;
        if (y !== 3'b100) begin
            $display("FAIL: Test case 5 failed, expected 100, got %b", y);
            $finish;
        end

        // Test case 6: Sixth bit is high
        i = 8'b00100000; #10;
        if (y !== 3'b101) begin
            $display("FAIL: Test case 6 failed, expected 101, got %b", y);
            $finish;
        end

        // Test case 7: Seventh bit is high
        i = 8'b01000000; #10;
        if (y !== 3'b110) begin
            $display("FAIL: Test case 7 failed, expected 110, got %b", y);
            $finish;
        end

        // Test case 8: Most significant bit is high
        i = 8'b10000000; #10;
        if (y !== 3'b111) begin
            $display("FAIL: Test case 8 failed, expected 111, got %b", y);
            $finish;
        end

        // Test case 9: No bits are high
        i = 8'b00000000; #10;
        if (y !== 3'bzzz) begin
            $display("FAIL: Test case 9 failed, expected zzz, got %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule