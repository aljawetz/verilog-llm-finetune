`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__a41o;

    // Inputs
    reg A1;
    reg A2;
    reg A3;
    reg A4;
    reg B1;

    // Output
    wire X;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__a41o uut (
        .X(X),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .A4(A4),
        .B1(B1)
    );

    initial begin
        // Test case 1: All inputs low
        A1 = 0; A2 = 0; A3 = 0; A4 = 0; B1 = 0;
        #10;
        if (X !== 0) $display("FAIL: Test case 1 failed, expected X=0, got X=%b", X);

        // Test case 2: All AND inputs high, B1 low
        A1 = 1; A2 = 1; A3 = 1; A4 = 1; B1 = 0;
        #10;
        if (X !== 1) $display("FAIL: Test case 2 failed, expected X=1, got X=%b", X);

        // Test case 3: Three AND inputs high, B1 low
        A1 = 1; A2 = 1; A3 = 1; A4 = 0; B1 = 0;
        #10;
        if (X !== 0) $display("FAIL: Test case 3 failed, expected X=0, got X=%b", X);

        // Test case 4: All AND inputs low, B1 high
        A1 = 0; A2 = 0; A3 = 0; A4 = 0; B1 = 1;
        #10;
        if (X !== 1) $display("FAIL: Test case 4 failed, expected X=1, got X=%b", X);

        // Test case 5: Mixed inputs, B1 high
        A1 = 1; A2 = 0; A3 = 1; A4 = 1; B1 = 1;
        #10;
        if (X !== 1) $display("FAIL: Test case 5 failed, expected X=1, got X=%b", X);

        // Test case 6: Mixed inputs, B1 low
        A1 = 1; A2 = 0; A3 = 1; A4 = 1; B1 = 0;
        #10;
        if (X !== 0) $display("FAIL: Test case 6 failed, expected X=0, got X=%b", X);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule