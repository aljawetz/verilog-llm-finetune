`timescale 1ns/1ps

module tb_prior_encoder_8x3;

reg [7:0] y;
wire [2:0] a;

// Instantiate the module under test
prior_encoder_8x3 uut (
    .y(y),
    .a(a)
);

initial begin
    // Test case 1: Only the highest bit is set
    y = 8'b10000000; // Expected output: 3'b111
    #10;
    if (a !== 3'b111) begin
        $display("FAIL: Test case 1 failed, expected 3'b111, got %b", a);
        $finish;
    end

    // Test case 2: Second highest bit is set
    y = 8'b01000000; // Expected output: 3'b110
    #10;
    if (a !== 3'b110) begin
        $display("FAIL: Test case 2 failed, expected 3'b110, got %b", a);
        $finish;
    end

    // Test case 3: Middle bit is set
    y = 8'b00100000; // Expected output: 3'b101
    #10;
    if (a !== 3'b101) begin
        $display("FAIL: Test case 3 failed, expected 3'b101, got %b", a);
        $finish;
    end

    // Test case 4: Lower middle bit is set
    y = 8'b00010000; // Expected output: 3'b100
    #10;
    if (a !== 3'b100) begin
        $display("FAIL: Test case 4 failed, expected 3'b100, got %b", a);
        $finish;
    end

    // Test case 5: Lower bit is set
    y = 8'b00000010; // Expected output: 3'b001
    #10;
    if (a !== 3'b001) begin
        $display("FAIL: Test case 5 failed, expected 3'b001, got %b", a);
        $finish;
    end

    // Test case 6: No bits are set
    y = 8'b00000000; // Expected output: 3'b000
    #10;
    if (a !== 3'b000) begin
        $display("FAIL: Test case 6 failed, expected 3'b000, got %b", a);
        $finish;
    end

    // Test case 7: Multiple bits set, highest should take precedence
    y = 8'b11000000; // Expected output: 3'b111
    #10;
    if (a !== 3'b111) begin
        $display("FAIL: Test case 7 failed, expected 3'b111, got %b", a);
        $finish;
    end

    // Test case 8: Another multiple bits set
    y = 8'b00111000; // Expected output: 3'b101
    #10;
    if (a !== 3'b101) begin
        $display("FAIL: Test case 8 failed, expected 3'b101, got %b", a);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule