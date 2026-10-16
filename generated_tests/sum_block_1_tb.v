`timescale 1ns/1ps

module tb_sum_block;

    reg A;
    reg B;
    reg Cin;
    wire S;
    wire Pi;
    wire Gi;

    // Instantiate the module under test
    sum_block uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Pi(Pi),
        .Gi(Gi)
    );

    initial begin
        // Test case 1: A=0, B=0, Cin=0
        A = 0; B = 0; Cin = 0;
        #10;
        if (S !== 0 || Pi !== 0 || Gi !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: A=0, B=0, Cin=1
        A = 0; B = 0; Cin = 1;
        #10;
        if (S !== 1 || Pi !== 0 || Gi !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: A=0, B=1, Cin=0
        A = 0; B = 1; Cin = 0;
        #10;
        if (S !== 1 || Pi !== 1 || Gi !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: A=0, B=1, Cin=1
        A = 0; B = 1; Cin = 1;
        #10;
        if (S !== 0 || Pi !== 1 || Gi !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: A=1, B=0, Cin=0
        A = 1; B = 0; Cin = 0;
        #10;
        if (S !== 1 || Pi !== 1 || Gi !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: A=1, B=0, Cin=1
        A = 1; B = 0; Cin = 1;
        #10;
        if (S !== 0 || Pi !== 1 || Gi !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: A=1, B=1, Cin=0
        A = 1; B = 1; Cin = 0;
        #10;
        if (S !== 0 || Pi !== 0 || Gi !== 1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: A=1, B=1, Cin=1
        A = 1; B = 1; Cin = 1;
        #10;
        if (S !== 1 || Pi !== 0 || Gi !== 1) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule