`timescale 1ns/1ps

module tb_Majority_Circuit;

reg A;
reg B;
reg C;
wire OUT;

// Instantiate the module under test
Majority_Circuit uut (
    .A(A),
    .B(B),
    .C(C),
    .OUT(OUT)
);

initial begin
    // Test case 1: A=0, B=0, C=0 -> OUT should be 0
    A = 0; B = 0; C = 0;
    #10;
    if (OUT !== 1'b0) $display("FAIL: Test case 1 failed, expected OUT=0, got OUT=%b", OUT);

    // Test case 2: A=0, B=0, C=1 -> OUT should be 0
    A = 0; B = 0; C = 1;
    #10;
    if (OUT !== 1'b0) $display("FAIL: Test case 2 failed, expected OUT=0, got OUT=%b", OUT);

    // Test case 3: A=0, B=1, C=1 -> OUT should be 1
    A = 0; B = 1; C = 1;
    #10;
    if (OUT !== 1'b1) $display("FAIL: Test case 3 failed, expected OUT=1, got OUT=%b", OUT);

    // Test case 4: A=1, B=0, C=1 -> OUT should be 1
    A = 1; B = 0; C = 1;
    #10;
    if (OUT !== 1'b1) $display("FAIL: Test case 4 failed, expected OUT=1, got OUT=%b", OUT);

    // Test case 5: A=1, B=1, C=0 -> OUT should be 1
    A = 1; B = 1; C = 0;
    #10;
    if (OUT !== 1'b1) $display("FAIL: Test case 5 failed, expected OUT=1, got OUT=%b", OUT);

    // Test case 6: A=1, B=1, C=1 -> OUT should be 1
    A = 1; B = 1; C = 1;
    #10;
    if (OUT !== 1'b1) $display("FAIL: Test case 6 failed, expected OUT=1, got OUT=%b", OUT);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule