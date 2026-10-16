`timescale 1ns/1ps

module tb_Code_Converter;

reg [3:0] code_in;
reg [1:0] select;
wire [3:0] code_out;

Code_Converter uut (
    .code_in(code_in),
    .select(select),
    .code_out(code_out)
);

initial begin
    // Test Binary to Gray Code
    select = 2'b00;

    code_in = 4'b0000; #10; 
    if (code_out !== 4'b0000) $display("FAIL: Binary to Gray Code Test 1 Failed");

    code_in = 4'b0001; #10; 
    if (code_out !== 4'b0001) $display("FAIL: Binary to Gray Code Test 2 Failed");

    code_in = 4'b0010; #10; 
    if (code_out !== 4'b0011) $display("FAIL: Binary to Gray Code Test 3 Failed");

    code_in = 4'b0011; #10; 
    if (code_out !== 4'b0010) $display("FAIL: Binary to Gray Code Test 4 Failed");

    code_in = 4'b0100; #10; 
    if (code_out !== 4'b0110) $display("FAIL: Binary to Gray Code Test 5 Failed");

    code_in = 4'b1111; #10; 
    if (code_out !== 4'b1000) $display("FAIL: Binary to Gray Code Test 6 Failed");

    // Test BCD to Excess-3
    select = 2'b01;

    code_in = 4'b0000; #10; 
    if (code_out !== 4'b0011) $display("FAIL: BCD to Excess-3 Test 1 Failed");

    code_in = 4'b0101; #10; 
    if (code_out !== 4'b0110) $display("FAIL: BCD to Excess-3 Test 2 Failed");

    code_in = 4'b1001; #10; 
    if (code_out !== 4'b1100) $display("FAIL: BCD to Excess-3 Test 3 Failed");

    code_in = 4'b1010; #10; 
    if (code_out !== 4'bxxxx) $display("FAIL: BCD to Excess-3 Test 4 Failed");

    // Test Gray Code to Binary
    select = 2'b10;

    code_in = 4'b0000; #10; 
    if (code_out !== 4'b0000) $display("FAIL: Gray to Binary Test 1 Failed");

    code_in = 4'b0001; #10; 
    if (code_out !== 4'b0001) $display("FAIL: Gray to Binary Test 2 Failed");

    code_in = 4'b0011; #10; 
    if (code_out !== 4'b0010) $display("FAIL: Gray to Binary Test 3 Failed");

    code_in = 4'b0110; #10; 
    if (code_out !== 4'b0100) $display("FAIL: Gray to Binary Test 4 Failed");

    // Test Excess-3 to BCD
    select = 2'b11;

    code_in = 4'b0011; #10; 
    if (code_out !== 4'b0000) $display("FAIL: Excess-3 to BCD Test 1 Failed");

    code_in = 4'b0110; #10; 
    if (code_out !== 4'b0101) $display("FAIL: Excess-3 to BCD Test 2 Failed");

    code_in = 4'b1100; #10; 
    if (code_out !== 4'b1001) $display("FAIL: Excess-3 to BCD Test 3 Failed");

    code_in = 4'b1101; #10; 
    if (code_out !== 4'bxxxx) $display("FAIL: Excess-3 to BCD Test 4 Failed");

    $display("PASS");
    $finish;
end

endmodule