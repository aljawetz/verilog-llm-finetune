`timescale 1ns/1ps

module tb_strl_model;

    reg X;
    reg Y;
    wire F_and;
    wire F_or;
    wire F_xor;
    wire F_not;
    wire F_nand;
    wire F_nor;
    wire F_xnor;

    // Instantiate the module under test (uut)
    strl_model uut (
        .X(X),
        .Y(Y),
        .F_and(F_and),
        .F_or(F_or),
        .F_xor(F_xor),
        .F_not(F_not),
        .F_nand(F_nand),
        .F_nor(F_nor),
        .F_xnor(F_xnor)
    );

    initial begin
        // Test all combinations of X and Y
        // X = 0, Y = 0
        X = 0; Y = 0; #10;
        if (F_and !== 0 || F_or !== 0 || F_xor !== 0 || F_not !== 1 || F_nand !== 1 || F_nor !== 1 || F_xnor !== 1) 
            $display("FAIL: Test case X=0, Y=0 failed");
        
        // X = 0, Y = 1
        X = 0; Y = 1; #10;
        if (F_and !== 0 || F_or !== 1 || F_xor !== 1 || F_not !== 1 || F_nand !== 1 || F_nor !== 0 || F_xnor !== 0) 
            $display("FAIL: Test case X=0, Y=1 failed");
        
        // X = 1, Y = 0
        X = 1; Y = 0; #10;
        if (F_and !== 0 || F_or !== 1 || F_xor !== 1 || F_not !== 0 || F_nand !== 1 || F_nor !== 0 || F_xnor !== 0) 
            $display("FAIL: Test case X=1, Y=0 failed");
        
        // X = 1, Y = 1
        X = 1; Y = 1; #10;
        if (F_and !== 1 || F_or !== 1 || F_xor !== 0 || F_not !== 0 || F_nand !== 0 || F_nor !== 0 || F_xnor !== 1) 
            $display("FAIL: Test case X=1, Y=1 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule