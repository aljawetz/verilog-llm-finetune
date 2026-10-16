`timescale 1ns/1ps

module tb_mux4to1;

reg [3:0] i;
reg [1:0] s;
wire y;

// Instantiate the module under test
mux4to1 uut (
    .i(i),
    .s(s),
    .y(y)
);

initial begin
    // Test case 1: Select input 0
    i = 4'b1010; // Inputs: 0=1, 1=0, 2=1, 3=0
    s = 2'b00;   // Select input 0
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 1 failed, expected y=1, got y=%b", y);

    // Test case 2: Select input 1
    s = 2'b01;   // Select input 1
    #10;
    if (y !== 1'b0) $display("FAIL: Test case 2 failed, expected y=0, got y=%b", y);

    // Test case 3: Select input 2
    s = 2'b10;   // Select input 2
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);

    // Test case 4: Select input 3
    s = 2'b11;   // Select input 3
    #10;
    if (y !== 1'b0) $display("FAIL: Test case 4 failed, expected y=0, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule