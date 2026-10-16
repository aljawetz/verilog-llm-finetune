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
    y = 8'b10000000; // Expected output: 111
    #10;
    if (a !== 3'b111) begin
        $display("FAIL: Test case 1 failed, expected 111 but got %b", a);
        $finish;
    end

    // Test case 2: Second highest bit is set
    y = 8'b01000000; // Expected output: 110
    #10;
    if (a !== 3'b110) begin
        $display("FAIL: Test case 2 failed, expected 110 but got %b", a);
        $finish;
    end

    // Test case 3: Middle bit is set
    y = 8'b00100000; // Expected output: 101
    #10;
    if (a !== 3'b101) begin
        $display("FAIL: Test case 3 failed, expected 101 but got %b", a);
        $finish;
    end

    // Test case 4: Lower bits are set
    y = 8'b00010000; // Expected output: 100
    #10;
    if (a !== 3'b100) begin
        $display("FAIL: Test case 4 failed, expected 100 but got %b", a);
        $finish;
    end

    // Test case 5: Another lower bit is set
    y = 8'b00001000; // Expected output: 011
    #10;
    if (a !== 3'b011) begin
        $display("FAIL: Test case 5 failed, expected 011 but got %b", a);
        $finish;
    end

    // Test case 6: Yet another lower bit is set
    y = 8'b00000100; // Expected output: 010
    #10;
    if (a !== 3'b010) begin
        $display("FAIL: Test case 6 failed, expected 010 but got %b", a);
        $finish;
    end

    // Test case 7: Second lowest bit is set
    y = 8'b00000010; // Expected output: 001
    #10;
    if (a !== 3'b001) begin
        $display("FAIL: Test case 7 failed, expected 001 but got %b", a);
        $finish;
    end

    // Test case 8: No bits are set
    y = 8'b00000000; // Expected output: 000
    #10;
    if (a !== 3'b000) begin
        $display("FAIL: Test case 8 failed, expected 000 but got %b", a);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule