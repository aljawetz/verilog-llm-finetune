`timescale 1ns/1ps

module tb_compressor42;

reg A;
reg B;
reg C;
reg D;
reg cin;
wire S;
wire carry;
wire cout;

compressor42 uut (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .cin(cin),
    .S(S),
    .carry(carry),
    .cout(cout)
);

initial begin
    // Test case 1: All inputs are 0
    A = 0; B = 0; C = 0; D = 0; cin = 0;
    #10;
    if (S !== 0 || carry !== 0 || cout !== 0) 
        $display("FAIL: Test case 1 failed");
    
    // Test case 2: All inputs are 1
    A = 1; B = 1; C = 1; D = 1; cin = 0;
    #10;
    if (S !== 0 || carry !== 1 || cout !== 1) 
        $display("FAIL: Test case 2 failed");
    
    // Test case 3: Mixed inputs
    A = 1; B = 0; C = 1; D = 0; cin = 1;
    #10;
    if (S !== 0 || carry !== 0 || cout !== 0) 
        $display("FAIL: Test case 3 failed");
    
    // Test case 4: Another mixed input
    A = 1; B = 1; C = 0; D = 0; cin = 1;
    #10;
    if (S !== 1 || carry !== 0 || cout !== 1) 
        $display("FAIL: Test case 4 failed");
    
    // Test case 5: More combinations
    A = 0; B = 1; C = 1; D = 1; cin = 0;
    #10;
    if (S !== 1 || carry !== 1 || cout !== 1) 
        $display("FAIL: Test case 5 failed");

    // Test case 6: All combinations of inputs
    A = 0; B = 0; C = 0; D = 1; cin = 1;
    #10;
    if (S !== 0 || carry !== 0 || cout !== 0) 
        $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule