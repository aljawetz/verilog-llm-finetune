`timescale 1ns/1ps

module tb_fadder;

    // Inputs
    reg A;
    reg B;
    reg Cin;

    // Outputs
    wire Sum;
    wire Cout;

    // Instantiate the Unit Under Test (UUT)
    fadder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // Test case 1: A=0, B=0, Cin=0
        A = 0; B = 0; Cin = 0;
        #10;
        if (Sum !== 0 || Cout !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: A=0, B=0, Cin=1
        A = 0; B = 0; Cin = 1;
        #10;
        if (Sum !== 1 || Cout !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: A=0, B=1, Cin=0
        A = 0; B = 1; Cin = 0;
        #10;
        if (Sum !== 1 || Cout !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: A=0, B=1, Cin=1
        A = 0; B = 1; Cin = 1;
        #10;
        if (Sum !== 0 || Cout !== 1) $display("FAIL: Test case 4 failed");

        // Test case 5: A=1, B=0, Cin=0
        A = 1; B = 0; Cin = 0;
        #10;
        if (Sum !== 1 || Cout !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: A=1, B=0, Cin=1
        A = 1; B = 0; Cin = 1;
        #10;
        if (Sum !== 0 || Cout !== 1) $display("FAIL: Test case 6 failed");

        // Test case 7: A=1, B=1, Cin=0
        A = 1; B = 1; Cin = 0;
        #10;
        if (Sum !== 0 || Cout !== 1) $display("FAIL: Test case 7 failed");

        // Test case 8: A=1, B=1, Cin=1
        A = 1; B = 1; Cin = 1;
        #10;
        if (Sum !== 1 || Cout !== 1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule