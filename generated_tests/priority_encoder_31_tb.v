`timescale 1ns/1ps

module tb_priority_encoder;
    reg [2:0] i;
    wire [1:0] y;

    // Instantiate the priority encoder module
    priority_encoder uut (
        .i(i),
        .y(y)
    );

    initial begin
        // Test case 1: All bits low
        i = 3'b000; #10;
        if (y !== 2'b11) begin
            $display("FAIL: Test case 1 failed, expected 2'b11, got %b", y);
            $finish;
        end

        // Test case 2: Only LSB set
        i = 3'b001; #10;
        if (y !== 2'b00) begin
            $display("FAIL: Test case 2 failed, expected 2'b00, got %b", y);
            $finish;
        end

        // Test case 3: Middle bit set
        i = 3'b010; #10;
        if (y !== 2'b01) begin
            $display("FAIL: Test case 3 failed, expected 2'b01, got %b", y);
            $finish;
        end

        // Test case 4: MSB set
        i = 3'b100; #10;
        if (y !== 2'b10) begin
            $display("FAIL: Test case 4 failed, expected 2'b10, got %b", y);
            $finish;
        end

        // Test case 5: Multiple bits set (MSB)
        i = 3'b110; #10;
        if (y !== 2'b10) begin
            $display("FAIL: Test case 5 failed, expected 2'b10, got %b", y);
            $finish;
        end

        // Test case 6: Multiple bits set (Middle)
        i = 3'b011; #10;
        if (y !== 2'b01) begin
            $display("FAIL: Test case 6 failed, expected 2'b01, got %b", y);
            $finish;
        end

        // Test case 7: Multiple bits set (LSB)
        i = 3'b111; #10;
        if (y !== 2'b10) begin
            $display("FAIL: Test case 7 failed, expected 2'b10, got %b", y);
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule