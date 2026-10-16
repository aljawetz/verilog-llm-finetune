`timescale 1ns/1ps

module tb_nand_nor;
    reg [3:0] in;
    wire [1:0] aout;
    wire bout;
    wire cout;

    // Instantiate the module under test (uut)
    nand_nor uut (
        .in(in),
        .aout(aout),
        .bout(bout),
        .cout(cout)
    );

    initial begin
        // Test case 1
        in = 4'b0000; // aout = 00, bout = 1, cout = 1
        #10;
        if (aout !== 2'b00 || bout !== 1'b1 || cout !== 1'b1) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2
        in = 4'b1100; // aout = 10, bout = 1, cout = 1
        #10;
        if (aout !== 2'b10 || bout !== 1'b1 || cout !== 1'b1) 
            $display("FAIL: Test case 2 failed");

        // Test case 3
        in = 4'b1010; // aout = 10, bout = 1, cout = 1
        #10;
        if (aout !== 2'b10 || bout !== 1'b1 || cout !== 1'b1) 
            $display("FAIL: Test case 3 failed");

        // Test case 4
        in = 4'b1111; // aout = 11, bout = 0, cout = 1
        #10;
        if (aout !== 2'b11 || bout !== 1'b0 || cout !== 1'b1) 
            $display("FAIL: Test case 4 failed");

        // Test case 5
        in = 4'b0011; // aout = 01, bout = 1, cout = 1
        #10;
        if (aout !== 2'b01 || bout !== 1'b1 || cout !== 1'b1) 
            $display("FAIL: Test case 5 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule