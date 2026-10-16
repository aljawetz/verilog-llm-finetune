`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__o31ai;

    // Inputs
    reg A1;
    reg A2;
    reg A3;
    reg B1;

    // Output
    wire Y;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__o31ai uut (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .B1(B1)
    );

    initial begin
        // Initialize Inputs
        A1 = 0; A2 = 0; A3 = 0; B1 = 0;

        // Test case 1: All inputs low
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 1 failed (A1=0, A2=0, A3=0, B1=0) => Y=%b", Y);
            $finish;
        end

        // Test case 2: A1=1, A2=0, A3=0, B1=1
        A1 = 1; A2 = 0; A3 = 0; B1 = 1;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 2 failed (A1=1, A2=0, A3=0, B1=1) => Y=%b", Y);
            $finish;
        end

        // Test case 3: A1=0, A2=1, A3=0, B1=1
        A1 = 0; A2 = 1; A3 = 0; B1 = 1;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 3 failed (A1=0, A2=1, A3=0, B1=1) => Y=%b", Y);
            $finish;
        end

        // Test case 4: A1=0, A2=0, A3=1, B1=1
        A1 = 0; A2 = 0; A3 = 1; B1 = 1;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 4 failed (A1=0, A2=0, A3=1, B1=1) => Y=%b", Y);
            $finish;
        end

        // Test case 5: A1=1, A2=1, A3=1, B1=0
        A1 = 1; A2 = 1; A3 = 1; B1 = 0;
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 5 failed (A1=1, A2=1, A3=1, B1=0) => Y=%b", Y);
            $finish;
        end

        // Test case 6: A1=1, A2=1, A3=0, B1=1
        A1 = 1; A2 = 1; A3 = 0; B1 = 1;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 6 failed (A1=1, A2=1, A3=0, B1=1) => Y=%b", Y);
            $finish;
        end

        // Test case 7: A1=1, A2=0, A3=1, B1=1
        A1 = 1; A2 = 0; A3 = 1; B1 = 1;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 7 failed (A1=1, A2=0, A3=1, B1=1) => Y=%b", Y);
            $finish;
        end

        // Test case 8: A1=0, A2=1, A3=1, B1=1
        A1 = 0; A2 = 1; A3 = 1; B1 = 1;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 8 failed (A1=0, A2=1, A3=1, B1=1) => Y=%b", Y);
            $finish;
        end

        // Test case 9: A1=1, A2=1, A3=1, B1=1
        A1 = 1; A2 = 1; A3 = 1; B1 = 1;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 9 failed (A1=1, A2=1, A3=1, B1=1) => Y=%b", Y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule