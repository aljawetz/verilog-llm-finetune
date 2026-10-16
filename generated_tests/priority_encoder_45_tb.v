`timescale 1ns/1ps

module tb_priority_encoder;

reg [7:0] d;
wire [2:0] y;

// Instantiate the module under test
priority_encoder uut (
    .d(d),
    .y(y)
);

initial begin
    // Test case 1: No bits set
    d = 8'b00000000; #10;
    if (y !== 3'b000) begin
        $display("FAIL: Test case 1 failed, expected 000, got %b", y);
        $finish;
    end

    // Test case 2: Only the highest bit set
    d = 8'b10000000; #10;
    if (y !== 3'b111) begin
        $display("FAIL: Test case 2 failed, expected 111, got %b", y);
        $finish;
    end

    // Test case 3: Middle bit set
    d = 8'b00100000; #10;
    if (y !== 3'b101) begin
        $display("FAIL: Test case 3 failed, expected 101, got %b", y);
        $finish;
    end

    // Test case 4: Lower bit set
    d = 8'b00000010; #10;
    if (y !== 3'b001) begin
        $display("FAIL: Test case 4 failed, expected 001, got %b", y);
        $finish;
    end

    // Test case 5: Multiple bits set, highest should take precedence
    d = 8'b11010000; #10;
    if (y !== 3'b111) begin
        $display("FAIL: Test case 5 failed, expected 111, got %b", y);
        $finish;
    end

    // Test case 6: Another multiple bits set
    d = 8'b01100010; #10;
    if (y !== 3'b110) begin
        $display("FAIL: Test case 6 failed, expected 110, got %b", y);
        $finish;
    end

    // Test case 7: All bits set
    d = 8'b11111111; #10;
    if (y !== 3'b111) begin
        $display("FAIL: Test case 7 failed, expected 111, got %b", y);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule