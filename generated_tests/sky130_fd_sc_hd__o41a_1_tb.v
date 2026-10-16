`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__o41a;

    // Testbench signals
    reg A1, A2, A3, A4, B1;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__o41a uut (
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
        if (X !== 0) begin
            $display("FAIL: Test case 1 failed, expected X=0, got X=%b", X);
            $finish;
        end

        // Test case 2: B1 high, all A inputs low
        A1 = 0; A2 = 0; A3 = 0; A4 = 0; B1 = 1;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 2 failed, expected X=0, got X=%b", X);
            $finish;
        end

        // Test case 3: One A input high, B1 low
        A1 = 1; A2 = 0; A3 = 0; A4 = 0; B1 = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 3 failed, expected X=0, got X=%b", X);
            $finish;
        end

        // Test case 4: One A input high, B1 high
        A1 = 1; A2 = 0; A3 = 0; A4 = 0; B1 = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 4 failed, expected X=1, got X=%b", X);
            $finish;
        end

        // Test case 5: Multiple A inputs high, B1 low
        A1 = 1; A2 = 1; A3 = 0; A4 = 0; B1 = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 5 failed, expected X=0, got X=%b", X);
            $finish;
        end

        // Test case 6: All A inputs high, B1 high
        A1 = 1; A2 = 1; A3 = 1; A4 = 1; B1 = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 6 failed, expected X=1, got X=%b", X);
            $finish;
        end

        // Test case 7: Mixed A inputs, B1 high
        A1 = 1; A2 = 1; A3 = 0; A4 = 1; B1 = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 7 failed, expected X=1, got X=%b", X);
            $finish;
        end

        // Test case 8: Mixed A inputs, B1 low
        A1 = 1; A2 = 1; A3 = 0; A4 = 1; B1 = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 8 failed, expected X=0, got X=%b", X);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule