`timescale 1ns/1ps

module tb_mux4x1;

reg [3:0] n;
reg [1:0] s;
wire y;

// Instantiate the module under test (uut)
mux4x1 uut (
    .n(n),
    .s(s),
    .y(y)
);

initial begin
    // Test case 1: Select input 0
    n = 4'b1010; // n[0] = 0
    s = 2'b00;   // select n[0]
    #10;
    if (y !== 1'b0) $display("FAIL: Test case 1 failed, expected y=0, got y=%b", y);

    // Test case 2: Select input 1
    s = 2'b01;   // select n[1]
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 2 failed, expected y=1, got y=%b", y);

    // Test case 3: Select input 2
    s = 2'b10;   // select n[2]
    #10;
    if (y !== 1'b0) $display("FAIL: Test case 3 failed, expected y=0, got y=%b", y);

    // Test case 4: Select input 3
    s = 2'b11;   // select n[3]
    #10;
    if (y !== 1'b0) $display("FAIL: Test case 4 failed, expected y=0, got y=%b", y);

    // Test case 5: Change inputs
    n = 4'b1111; // All inputs are 1
    s = 2'b00;   // select n[0]
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 5 failed, expected y=1, got y=%b", y);

    s = 2'b01;   // select n[1]
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 6 failed, expected y=1, got y=%b", y);

    s = 2'b10;   // select n[2]
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 7 failed, expected y=1, got y=%b", y);

    s = 2'b11;   // select n[3]
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 8 failed, expected y=1, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule