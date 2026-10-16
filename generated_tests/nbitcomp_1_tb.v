`timescale 1ns/1ps

module tb_nbitcomp;

reg [31:0] a, b;
wire lesser, equal, greater;

// Instantiate the module under test (uut)
nbitcomp uut (
    .a(a),
    .b(b),
    .lesser(lesser),
    .equal(equal),
    .greater(greater)
);

initial begin
    // Test case 1: a < b
    a = 32'h00000001; 
    b = 32'h00000002; 
    #10;
    if (lesser !== 1 || equal !== 0 || greater !== 0) 
        $display("FAIL: Test case 1 failed (a < b)");
    
    // Test case 2: a == b
    a = 32'h00000003; 
    b = 32'h00000003; 
    #10;
    if (lesser !== 0 || equal !== 1 || greater !== 0) 
        $display("FAIL: Test case 2 failed (a == b)");
    
    // Test case 3: a > b
    a = 32'h00000004; 
    b = 32'h00000003; 
    #10;
    if (lesser !== 0 || equal !== 0 || greater !== 1) 
        $display("FAIL: Test case 3 failed (a > b)");

    // Test case 4: a = 0, b = 0
    a = 32'h00000000; 
    b = 32'h00000000; 
    #10;
    if (lesser !== 0 || equal !== 1 || greater !== 0) 
        $display("FAIL: Test case 4 failed (a = 0, b = 0)");

    // Test case 5: a = max, b = min
    a = 32'hFFFFFFFF; 
    b = 32'h00000000; 
    #10;
    if (lesser !== 0 || equal !== 0 || greater !== 1) 
        $display("FAIL: Test case 5 failed (a = max, b = min)");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule