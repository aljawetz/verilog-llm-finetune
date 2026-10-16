`timescale 1ns/1ps

module tb_priority_encoder;

reg [7:0] d;
wire [2:0] y;

// Instantiate the module under test (uut)
priority_encoder uut (
    .d(d),
    .y(y)
);

initial begin
    // Test case 1: Only the highest priority bit is set
    d = 8'b10000000; // Expect y = 3'b111
    #10;
    if (y !== 3'b111) begin
        $display("FAIL: Test case 1 failed, expected 3'b111 but got %b", y);
        $finish;
    end

    // Test case 2: Second highest priority bit is set
    d = 8'b01000000; // Expect y = 3'b110
    #10;
    if (y !== 3'b110) begin
        $display("FAIL: Test case 2 failed, expected 3'b110 but got %b", y);
        $finish;
    end

    // Test case 3: Middle priority bit is set
    d = 8'b00100000; // Expect y = 3'b101
    #10;
    if (y !== 3'b101) begin
        $display("FAIL: Test case 3 failed, expected 3'b101 but got %b", y);
        $finish;
    end

    // Test case 4: Lower priority bit is set
    d = 8'b00010000; // Expect y = 3'b100
    #10;
    if (y !== 3'b100) begin
        $display("FAIL: Test case 4 failed, expected 3'b100 but got %b", y);
        $finish;
    end

    // Test case 5: Another lower priority bit is set
    d = 8'b00001000; // Expect y = 3'b011
    #10;
    if (y !== 3'b011) begin
        $display("FAIL: Test case 5 failed, expected 3'b011 but got %b", y);
        $finish;
    end

    // Test case 6: Lower priority bit is set
    d = 8'b00000100; // Expect y = 3'b010
    #10;
    if (y !== 3'b010) begin
        $display("FAIL: Test case 6 failed, expected 3'b010 but got %b", y);
        $finish;
    end

    // Test case 7: Second lowest priority bit is set
    d = 8'b00000010; // Expect y = 3'b001
    #10;
    if (y !== 3'b001) begin
        $display("FAIL: Test case 7 failed, expected 3'b001 but got %b", y);
        $finish;
    end

    // Test case 8: No bits set
    d = 8'b00000000; // Expect y = 3'b000
    #10;
    if (y !== 3'b000) begin
        $display("FAIL: Test case 8 failed, expected 3'b000 but got %b", y);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule