`timescale 1ns/1ps

module tb_priority_encoder;

reg [7:0] i;
wire [2:0] y;
wire valid;

// Instantiate the module under test
priority_encoder uut (
    .i(i),
    .y(y),
    .valid(valid)
);

initial begin
    // Test case 1: Input with highest bit set
    i = 8'b10000000; // Expect y = 3'b111, valid = 1
    #10;
    if (y !== 3'b111 || valid !== 1) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Input with second highest bit set
    i = 8'b01000000; // Expect y = 3'b110, valid = 1
    #10;
    if (y !== 3'b110 || valid !== 1) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Input with third highest bit set
    i = 8'b00100000; // Expect y = 3'b101, valid = 1
    #10;
    if (y !== 3'b101 || valid !== 1) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: Input with fourth highest bit set
    i = 8'b00010000; // Expect y = 3'b100, valid = 1
    #10;
    if (y !== 3'b100 || valid !== 1) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: Input with fifth highest bit set
    i = 8'b00001000; // Expect y = 3'b011, valid = 1
    #10;
    if (y !== 3'b011 || valid !== 1) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: Input with sixth highest bit set
    i = 8'b00000100; // Expect y = 3'b010, valid = 1
    #10;
    if (y !== 3'b010 || valid !== 1) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    // Test case 7: Input with seventh highest bit set
    i = 8'b00000010; // Expect y = 3'b001, valid = 1
    #10;
    if (y !== 3'b001 || valid !== 1) begin
        $display("FAIL: Test case 7 failed");
        $finish;
    end

    // Test case 8: Input with lowest bit set
    i = 8'b00000001; // Expect y = 3'b000, valid = 1
    #10;
    if (y !== 3'b000 || valid !== 1) begin
        $display("FAIL: Test case 8 failed");
        $finish;
    end

    // Test case 9: Input with no bits set
    i = 8'b00000000; // Expect y = 3'b000, valid = 0
    #10;
    if (y !== 3'b000 || valid !== 0) begin
        $display("FAIL: Test case 9 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule