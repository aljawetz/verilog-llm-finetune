`timescale 1ns/1ps

module testbench;

reg A;
reg B;
wire Y;

// Instantiate the NAND2x1 module
NAND2x1 uut (
    .Y(Y),
    .A(A),
    .B(B)
);

initial begin
    // Test case 1: A = 0, B = 0
    A = 0; B = 0;
    #10;
    if (Y !== 1) $display("FAIL: Test case 1 failed (A=0, B=0)"); 

    // Test case 2: A = 0, B = 1
    A = 0; B = 1;
    #10;
    if (Y !== 1) $display("FAIL: Test case 2 failed (A=0, B=1)"); 

    // Test case 3: A = 1, B = 0
    A = 1; B = 0;
    #10;
    if (Y !== 1) $display("FAIL: Test case 3 failed (A=1, B=0)"); 

    // Test case 4: A = 1, B = 1
    A = 1; B = 1;
    #10;
    if (Y !== 0) $display("FAIL: Test case 4 failed (A=1, B=1)"); 

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule