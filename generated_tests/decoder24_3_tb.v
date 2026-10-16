`timescale 1ns/1ps

module tb_decoder24;

reg a, b, en;
wire i0, i1, i2, i3;

// Instantiate the module under test (uut)
decoder24 uut (
    .a(a),
    .b(b),
    .en(en),
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3)
);

initial begin
    // Test case 1: Enable low, all outputs should be 0
    en = 0; a = 0; b = 0; #10;
    if (i0 !== 0 || i1 !== 0 || i2 !== 0 || i3 !== 0) 
        $display("FAIL: Test case 1 failed");
    
    // Test case 2: Enable high, a=0, b=0, i0 should be 1
    en = 1; a = 0; b = 0; #10;
    if (i0 !== 1 || i1 !== 0 || i2 !== 0 || i3 !== 0) 
        $display("FAIL: Test case 2 failed");
    
    // Test case 3: Enable high, a=0, b=1, i1 should be 1
    a = 0; b = 1; #10;
    if (i0 !== 0 || i1 !== 1 || i2 !== 0 || i3 !== 0) 
        $display("FAIL: Test case 3 failed");
    
    // Test case 4: Enable high, a=1, b=0, i2 should be 1
    a = 1; b = 0; #10;
    if (i0 !== 0 || i1 !== 0 || i2 !== 1 || i3 !== 0) 
        $display("FAIL: Test case 4 failed");
    
    // Test case 5: Enable high, a=1, b=1, i3 should be 1
    a = 1; b = 1; #10;
    if (i0 !== 0 || i1 !== 0 || i2 !== 0 || i3 !== 1) 
        $display("FAIL: Test case 5 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule