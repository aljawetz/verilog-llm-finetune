`timescale 1ns/1ps

module tb_cla_block;

    reg [3:0] Pi;
    reg [3:0] Gi;
    reg Cin;
    wire [4:1] C;

    // Instantiate the Unit Under Test (UUT)
    cla_block uut (
        .Pi(Pi),
        .Gi(Gi),
        .Cin(Cin),
        .C(C)
    );

    initial begin
        // Test Case 1: Basic carry generation
        Pi = 4'b0001; Gi = 4'b0000; Cin = 0; #10;
        if (C !== 4'b0001) $display("FAIL: Test Case 1 Failed, Expected C=0001, Got C=%b", C);

        // Test Case 2: Generate carry with Cin
        Pi = 4'b0001; Gi = 4'b0000; Cin = 1; #10;
        if (C !== 4'b0001) $display("FAIL: Test Case 2 Failed, Expected C=0001, Got C=%b", C);

        // Test Case 3: Multiple generates
        Pi = 4'b1111; Gi = 4'b0000; Cin = 0; #10;
        if (C !== 4'b1111) $display("FAIL: Test Case 3 Failed, Expected C=1111, Got C=%b", C);

        // Test Case 4: Mixed propagate and generate
        Pi = 4'b1010; Gi = 4'b0101; Cin = 0; #10;
        if (C !== 4'b1111) $display("FAIL: Test Case 4 Failed, Expected C=1111, Got C=%b", C);

        // Test Case 5: No propagate or generate
        Pi = 4'b0000; Gi = 4'b0000; Cin = 0; #10;
        if (C !== 4'b0000) $display("FAIL: Test Case 5 Failed, Expected C=0000, Got C=%b", C);

        // Test Case 6: All generates with Cin
        Pi = 4'b1111; Gi = 4'b1111; Cin = 1; #10;
        if (C !== 4'b1111) $display("FAIL: Test Case 6 Failed, Expected C=1111, Got C=%b", C);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule