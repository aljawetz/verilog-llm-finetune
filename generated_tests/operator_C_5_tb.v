`timescale 1ns/1ps

module tb_operator_C;

    // Inputs
    reg P;
    reg G;
    reg G1;

    // Outputs
    wire Go;

    // Instantiate the Unit Under Test (UUT)
    operator_C uut (
        .P(P),
        .G(G),
        .G1(G1),
        .Go(Go)
    );

    initial begin
        // Test case 1: P=0, G=0, G1=0 -> Go should be 0
        P = 0; G = 0; G1 = 0;
        #10;
        if (Go !== 0) $display("FAIL: Test case 1 failed, expected Go=0, got Go=%b", Go);

        // Test case 2: P=0, G=0, G1=1 -> Go should be 0
        P = 0; G = 0; G1 = 1;
        #10;
        if (Go !== 0) $display("FAIL: Test case 2 failed, expected Go=0, got Go=%b", Go);

        // Test case 3: P=0, G=1, G1=0 -> Go should be 1
        P = 0; G = 1; G1 = 0;
        #10;
        if (Go !== 1) $display("FAIL: Test case 3 failed, expected Go=1, got Go=%b", Go);

        // Test case 4: P=0, G=1, G1=1 -> Go should be 1
        P = 0; G = 1; G1 = 1;
        #10;
        if (Go !== 1) $display("FAIL: Test case 4 failed, expected Go=1, got Go=%b", Go);

        // Test case 5: P=1, G=0, G1=0 -> Go should be 0
        P = 1; G = 0; G1 = 0;
        #10;
        if (Go !== 0) $display("FAIL: Test case 5 failed, expected Go=0, got Go=%b", Go);

        // Test case 6: P=1, G=0, G1=1 -> Go should be 1
        P = 1; G = 0; G1 = 1;
        #10;
        if (Go !== 1) $display("FAIL: Test case 6 failed, expected Go=1, got Go=%b", Go);

        // Test case 7: P=1, G=1, G1=0 -> Go should be 1
        P = 1; G = 1; G1 = 0;
        #10;
        if (Go !== 1) $display("FAIL: Test case 7 failed, expected Go=1, got Go=%b", Go);

        // Test case 8: P=1, G=1, G1=1 -> Go should be 1
        P = 1; G = 1; G1 = 1;
        #10;
        if (Go !== 1) $display("FAIL: Test case 8 failed, expected Go=1, got Go=%b", Go);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule