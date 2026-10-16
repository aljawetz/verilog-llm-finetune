`timescale 1ns/1ps

module tb_prior_encoder_8x3;

reg [7:0] y;
wire [2:0] a;

// Instantiate the module under test (uut)
prior_encoder_8x3 uut (
    .y(y),
    .a(a)
);

initial begin
    // Test case 1: No bits set
    y = 8'b00000000; #10;
    if (a !== 3'b000) begin
        $display("FAIL: Test case 1 failed, expected 000, got %b", a);
        $finish;
    end

    // Test case 2: Only the highest bit set
    y = 8'b10000000; #10;
    if (a !== 3'b111) begin
        $display("FAIL: Test case 2 failed, expected 111, got %b", a);
        $finish;
    end

    // Test case 3: Second highest bit set
    y = 8'b01000000; #10;
    if (a !== 3'b110) begin
        $display("FAIL: Test case 3 failed, expected 110, got %b", a);
        $finish;
    end

    // Test case 4: Middle bit set
    y = 8'b00100000; #10;
    if (a !== 3'b101) begin
        $display("FAIL: Test case 4 failed, expected 101, got %b", a);
        $finish;
    end

    // Test case 5: Lower bit set
    y = 8'b00000010; #10;
    if (a !== 3'b001) begin
        $display("FAIL: Test case 5 failed, expected 001, got %b", a);
        $finish;
    end

    // Test case 6: Multiple bits set, highest should take precedence
    y = 8'b11000000; #10;
    if (a !== 3'b111) begin
        $display("FAIL: Test case 6 failed, expected 111, got %b", a);
        $finish;
    end

    // Test case 7: Another combination
    y = 8'b00000101; #10;
    if (a !== 3'b010) begin
        $display("FAIL: Test case 7 failed, expected 010, got %b", a);
        $finish;
    end

    // Test case 8: All bits set
    y = 8'b11111111; #10;
    if (a !== 3'b111) begin
        $display("FAIL: Test case 8 failed, expected 111, got %b", a);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule