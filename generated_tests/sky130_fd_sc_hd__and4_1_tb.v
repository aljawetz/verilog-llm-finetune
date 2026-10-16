`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__and4;

    // Inputs
    reg A;
    reg B;
    reg C;
    reg D;

    // Output
    wire X;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__and4 uut (
        .X(X),
        .A(A),
        .B(B),
        .C(C),
        .D(D)
    );

    initial begin
        // Test case 1: All inputs low
        A = 0; B = 0; C = 0; D = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 1 failed, expected X=0, got X=%b", X);
            $finish;
        end

        // Test case 2: One input high
        A = 1; B = 0; C = 0; D = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 2 failed, expected X=0, got X=%b", X);
            $finish;
        end

        // Test case 3: Two inputs high
        A = 1; B = 1; C = 0; D = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 3 failed, expected X=0, got X=%b", X);
            $finish;
        end

        // Test case 4: Three inputs high
        A = 1; B = 1; C = 1; D = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 4 failed, expected X=0, got X=%b", X);
            $finish;
        end

        // Test case 5: All inputs high
        A = 1; B = 1; C = 1; D = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 5 failed, expected X=1, got X=%b", X);
            $finish;
        end

        // Test case 6: Random combination
        A = 0; B = 1; C = 1; D = 1;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 6 failed, expected X=0, got X=%b", X);
            $finish;
        end

        // Test case 7: Another random combination
        A = 1; B = 0; C = 1; D = 1;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 7 failed, expected X=0, got X=%b", X);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule