`timescale 1ns/1ps

module tb_code;

reg a, b, c;
wire x_sel, x2_sel, neg;

// Instantiate the module under test (uut)
code uut (
    .a(a),
    .b(b),
    .c(c),
    .x_sel(x_sel),
    .x2_sel(x2_sel),
    .neg(neg)
);

initial begin
    // Test case 1: a=0, b=0, c=0
    a = 0; b = 0; c = 0;
    #10;
    if (x_sel !== 0 || x2_sel !== 0 || neg !== 0) 
        $display("FAIL: Test case 1 failed");
    
    // Test case 2: a=0, b=0, c=1
    a = 0; b = 0; c = 1;
    #10;
    if (x_sel !== 0 || x2_sel !== 1 || neg !== 1) 
        $display("FAIL: Test case 2 failed");

    // Test case 3: a=0, b=1, c=0
    a = 0; b = 1; c = 0;
    #10;
    if (x_sel !== 1 || x2_sel !== 0 || neg !== 0) 
        $display("FAIL: Test case 3 failed");

    // Test case 4: a=0, b=1, c=1
    a = 0; b = 1; c = 1;
    #10;
    if (x_sel !== 1 || x2_sel !== 0 || neg !== 1) 
        $display("FAIL: Test case 4 failed");

    // Test case 5: a=1, b=0, c=0
    a = 1; b = 0; c = 0;
    #10;
    if (x_sel !== 1 || x2_sel !== 0 || neg !== 0) 
        $display("FAIL: Test case 5 failed");

    // Test case 6: a=1, b=0, c=1
    a = 1; b = 0; c = 1;
    #10;
    if (x_sel !== 1 || x2_sel !== 0 || neg !== 1) 
        $display("FAIL: Test case 6 failed");

    // Test case 7: a=1, b=1, c=0
    a = 1; b = 1; c = 0;
    #10;
    if (x_sel !== 0 || x2_sel !== 1 || neg !== 0) 
        $display("FAIL: Test case 7 failed");

    // Test case 8: a=1, b=1, c=1
    a = 1; b = 1; c = 1;
    #10;
    if (x_sel !== 0 || x2_sel !== 1 || neg !== 1) 
        $display("FAIL: Test case 8 failed");

    $display("PASS");
    $finish;
end

endmodule