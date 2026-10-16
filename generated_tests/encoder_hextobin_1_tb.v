`timescale 1ns/1ps

module tb_encoder_hextobin;

reg [15:0] i;
wire [3:0] y;

// Instantiate the module under test (uut)
encoder_hextobin uut (
    .i(i),
    .y(y)
);

initial begin
    // Test case 1: Input is one-hot for 0 (0000 0000 0000 0001)
    i = 16'b0000_0000_0000_0001; #10;
    if (y !== 4'b0000) $display("FAIL: Expected 0000, got %b", y);

    // Test case 2: Input is one-hot for 1 (0000 0000 0000 0010)
    i = 16'b0000_0000_0000_0010; #10;
    if (y !== 4'b0001) $display("FAIL: Expected 0001, got %b", y);

    // Test case 3: Input is one-hot for 2 (0000 0000 0000 0100)
    i = 16'b0000_0000_0000_0100; #10;
    if (y !== 4'b0010) $display("FAIL: Expected 0010, got %b", y);

    // Test case 4: Input is one-hot for 3 (0000 0000 0000 1000)
    i = 16'b0000_0000_0000_1000; #10;
    if (y !== 4'b0011) $display("FAIL: Expected 0011, got %b", y);

    // Test case 5: Input is one-hot for 4 (0000 0000 0001 0000)
    i = 16'b0000_0000_0001_0000; #10;
    if (y !== 4'b0100) $display("FAIL: Expected 0100, got %b", y);

    // Test case 6: Input is one-hot for 5 (0000 0000 0010 0000)
    i = 16'b0000_0000_0010_0000; #10;
    if (y !== 4'b0101) $display("FAIL: Expected 0101, got %b", y);

    // Test case 7: Input is one-hot for 6 (0000 0000 0100 0000)
    i = 16'b0000_0000_0100_0000; #10;
    if (y !== 4'b0110) $display("FAIL: Expected 0110, got %b", y);

    // Test case 8: Input is one-hot for 7 (0000 0000 1000 0000)
    i = 16'b0000_0000_1000_0000; #10;
    if (y !== 4'b0111) $display("FAIL: Expected 0111, got %b", y);

    // Test case 9: Input is one-hot for 8 (0000 0001 0000 0000)
    i = 16'b0000_0001_0000_0000; #10;
    if (y !== 4'b1000) $display("FAIL: Expected 1000, got %b", y);

    // Test case 10: Input is one-hot for 15 (1000 0000 0000 0000)
    i = 16'b1000_0000_0000_0000; #10;
    if (y !== 4'b1111) $display("FAIL: Expected 1111, got %b", y);

    // Test case 11: Input is a combination (0000 0000 1111 1111)
    i = 16'b0000_0000_1111_1111; #10;
    if (y !== 4'b1111) $display("FAIL: Expected 1111, got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule