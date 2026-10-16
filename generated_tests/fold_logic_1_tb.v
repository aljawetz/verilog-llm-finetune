`timescale 1ns/1ps

module tb_fold_logic;

    reg [5:0] F0;
    reg [5:0] F1;
    reg [5:0] F2;
    reg [5:0] F3;
    reg V0;
    reg V1;
    reg V2;
    reg V3;
    reg FOE;
    wire notvalid;
    wire fold1;
    wire fold2;
    wire fold3;
    wire fold4;
    wire gr1;
    wire gr2;
    wire gr3;
    wire gr4;
    wire gr5;
    wire gr6;
    wire gr7;
    wire gr8;
    wire gr9;

    fold_logic uut (
        .F0(F0),
        .F1(F1),
        .F2(F2),
        .F3(F3),
        .V0(V0),
        .V1(V1),
        .V2(V2),
        .V3(V3),
        .FOE(FOE),
        .notvalid(notvalid),
        .fold1(fold1),
        .fold2(fold2),
        .fold3(fold3),
        .fold4(fold4),
        .gr1(gr1),
        .gr2(gr2),
        .gr3(gr3),
        .gr4(gr4),
        .gr5(gr5),
        .gr6(gr6),
        .gr7(gr7),
        .gr8(gr8),
        .gr9(gr9)
    );

    initial begin
        // Test case 1: Basic functionality with valid inputs
        F0 = 6'b000001; F1 = 6'b000001; F2 = 6'b000100; F3 = 6'b000000;
        V0 = 1; V1 = 1; V2 = 1; V3 = 1; FOE = 1;
        #10;
        if (notvalid !== 0 || fold1 !== 0 || fold2 !== 0 || fold3 !== 0 || fold4 !== 0) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: Check notvalid when V0 is low
        V0 = 0; FOE = 1;
        #10;
        if (notvalid !== 1) 
            $display("FAIL: Test case 2 failed");

        // Test case 3: Check fold1 when all folds are inactive
        V0 = 1; FOE = 1; F0 = 6'b000000; F1 = 6'b000000; F2 = 6'b000000;
        #10;
        if (fold1 !== 1 || fold2 !== 0 || fold3 !== 0 || fold4 !== 0) 
            $display("FAIL: Test case 3 failed");

        // Test case 4: Check fold2 activation
        F0 = 6'b000001; F1 = 6'b000001; F2 = 6'b000100; FOE = 1;
        #10;
        if (fold2 !== 1) 
            $display("FAIL: Test case 4 failed");

        // Test case 5: Check fold3 activation
        F0 = 6'b000001; F1 = 6'b000001; F2 = 6'b000110; FOE = 1;
        #10;
        if (fold3 !== 1) 
            $display("FAIL: Test case 5 failed");

        // Test case 6: Check fold4 activation
        F0 = 6'b000001; F1 = 6'b000001; F2 = 6'b000100; F3 = 6'b111111; FOE = 1;
        #10;
        if (fold4 !== 1) 
            $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule