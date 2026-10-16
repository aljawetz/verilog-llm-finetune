`timescale 1ns/1ps

module tb_mux;

reg [1:0] d;
reg s;
wire y;

// Instantiate the module under test (uut)
mux uut (
    .d(d),
    .s(s),
    .y(y)
);

// Test sequence
initial begin
    // Test case 1: d = 2'b00, s = 0
    d = 2'b00; s = 0; #10;
    if (y !== 1'b0) $display("FAIL: Test case 1 failed, expected y=0, got y=%b", y);

    // Test case 2: d = 2'b00, s = 1
    d = 2'b00; s = 1; #10;
    if (y !== 1'b0) $display("FAIL: Test case 2 failed, expected y=0, got y=%b", y);

    // Test case 3: d = 2'b01, s = 0
    d = 2'b01; s = 0; #10;
    if (y !== 1'b1) $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);

    // Test case 4: d = 2'b01, s = 1
    d = 2'b01; s = 1; #10;
    if (y !== 1'b0) $display("FAIL: Test case 4 failed, expected y=0, got y=%b", y);

    // Test case 5: d = 2'b10, s = 0
    d = 2'b10; s = 0; #10;
    if (y !== 1'b0) $display("FAIL: Test case 5 failed, expected y=0, got y=%b", y);

    // Test case 6: d = 2'b10, s = 1
    d = 2'b10; s = 1; #10;
    if (y !== 1'b1) $display("FAIL: Test case 6 failed, expected y=1, got y=%b", y);

    // Test case 7: d = 2'b11, s = 0
    d = 2'b11; s = 0; #10;
    if (y !== 1'b1) $display("FAIL: Test case 7 failed, expected y=1, got y=%b", y);

    // Test case 8: d = 2'b11, s = 1
    d = 2'b11; s = 1; #10;
    if (y !== 1'b1) $display("FAIL: Test case 8 failed, expected y=1, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule