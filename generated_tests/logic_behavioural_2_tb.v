`timescale 1ns/1ps

module tb_logic_behavioural;

reg a;
reg b;
wire and_1;
wire or_1;
wire nand_1;
wire nor_1;
wire not_1;
wire xor_1;
wire xnor_1;

// Instantiate the module under test (uut)
logic_behavioural uut (
    .a(a),
    .b(b),
    .and_1(and_1),
    .or_1(or_1),
    .nand_1(nand_1),
    .nor_1(nor_1),
    .not_1(not_1),
    .xor_1(xor_1),
    .xnor_1(xnor_1)
);

initial begin
    // Test all combinations of a and b
    // Test case 1: a = 0, b = 0
    a = 0; b = 0; #10;
    if (and_1 !== 0 || or_1 !== 0 || nand_1 !== 1 || nor_1 !== 1 || not_1 !== 1 || xor_1 !== 0 || xnor_1 !== 1) 
        $display("FAIL: Test case 1 failed");
    
    // Test case 2: a = 0, b = 1
    a = 0; b = 1; #10;
    if (and_1 !== 0 || or_1 !== 1 || nand_1 !== 1 || nor_1 !== 0 || not_1 !== 1 || xor_1 !== 1 || xnor_1 !== 0) 
        $display("FAIL: Test case 2 failed");
    
    // Test case 3: a = 1, b = 0
    a = 1; b = 0; #10;
    if (and_1 !== 0 || or_1 !== 1 || nand_1 !== 1 || nor_1 !== 0 || not_1 !== 0 || xor_1 !== 1 || xnor_1 !== 0) 
        $display("FAIL: Test case 3 failed");
    
    // Test case 4: a = 1, b = 1
    a = 1; b = 1; #10;
    if (and_1 !== 1 || or_1 !== 1 || nand_1 !== 0 || nor_1 !== 0 || not_1 !== 0 || xor_1 !== 0 || xnor_1 !== 1) 
        $display("FAIL: Test case 4 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule