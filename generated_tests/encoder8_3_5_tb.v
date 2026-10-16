`timescale 1ns/1ps

module tb_encoder8_3;

reg [7:0] d;
wire [2:0] y;

// Instantiate the module under test
encoder8_3 uut (
    .d(d),
    .y(y)
);

initial begin
    // Test case 1: Valid input 0000_0001
    d = 8'b0000_0001; #10;
    if (y !== 3'b000) begin
        $display("FAIL: Expected 000 for input 0000_0001, got %b", y);
        $finish;
    end

    // Test case 2: Valid input 0000_0010
    d = 8'b0000_0010; #10;
    if (y !== 3'b001) begin
        $display("FAIL: Expected 001 for input 0000_0010, got %b", y);
        $finish;
    end

    // Test case 3: Valid input 0000_0100
    d = 8'b0000_0100; #10;
    if (y !== 3'b010) begin
        $display("FAIL: Expected 010 for input 0000_0100, got %b", y);
        $finish;
    end

    // Test case 4: Valid input 0000_1000
    d = 8'b0000_1000; #10;
    if (y !== 3'b011) begin
        $display("FAIL: Expected 011 for input 0000_1000, got %b", y);
        $finish;
    end

    // Test case 5: Valid input 0001_0000
    d = 8'b0001_0000; #10;
    if (y !== 3'b100) begin
        $display("FAIL: Expected 100 for input 0001_0000, got %b", y);
        $finish;
    end

    // Test case 6: Valid input 0010_0000
    d = 8'b0010_0000; #10;
    if (y !== 3'b101) begin
        $display("FAIL: Expected 101 for input 0010_0000, got %b", y);
        $finish;
    end

    // Test case 7: Valid input 0100_0000
    d = 8'b0100_0000; #10;
    if (y !== 3'b110) begin
        $display("FAIL: Expected 110 for input 0100_0000, got %b", y);
        $finish;
    end

    // Test case 8: Valid input 1000_0000
    d = 8'b1000_0000; #10;
    if (y !== 3'b111) begin
        $display("FAIL: Expected 111 for input 1000_0000, got %b", y);
        $finish;
    end

    // Test case 9: Invalid input (no one-hot)
    d = 8'b0000_0000; #10;
    if (y !== 3'b000) begin
        $display("FAIL: Expected 000 for input 0000_0000, got %b", y);
        $finish;
    end

    // Test case 10: Invalid input (multiple bits set)
    d = 8'b0000_0011; #10;
    if (y !== 3'b000) begin
        $display("FAIL: Expected 000 for input 0000_0011, got %b", y);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule