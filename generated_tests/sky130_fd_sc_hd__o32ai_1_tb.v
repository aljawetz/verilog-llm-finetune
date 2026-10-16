`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__o32ai;

    // Inputs
    reg A1;
    reg A2;
    reg A3;
    reg B1;
    reg B2;

    // Output
    wire Y;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__o32ai uut (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .B1(B1),
        .B2(B2)
    );

    initial begin
        // Initialize Inputs
        A1 = 0; A2 = 0; A3 = 0; B1 = 0; B2 = 0;

        // Test case 1: All inputs low
        #10;
        if (Y !== 1'b1) begin
            $display("FAIL: Test case 1 failed, expected Y=1, got Y=%b", Y);
            $finish;
        end

        // Test case 2: A1=1, A2=0, A3=0, B1=0, B2=0
        A1 = 1; A2 = 0; A3 = 0; B1 = 0; B2 = 0;
        #10;
        if (Y !== 1'b1) begin
            $display("FAIL: Test case 2 failed, expected Y=1, got Y=%b", Y);
            $finish;
        end

        // Test case 3: A1=0, A2=1, A3=0, B1=0, B2=0
        A1 = 0; A2 = 1; A3 = 0; B1 = 0; B2 = 0;
        #10;
        if (Y !== 1'b1) begin
            $display("FAIL: Test case 3 failed, expected Y=1, got Y=%b", Y);
            $finish;
        end

        // Test case 4: A1=0, A2=0, A3=1, B1=0, B2=0
        A1 = 0; A2 = 0; A3 = 1; B1 = 0; B2 = 0;
        #10;
        if (Y !== 1'b1) begin
            $display("FAIL: Test case 4 failed, expected Y=1, got Y=%b", Y);
            $finish;
        end

        // Test case 5: A1=0, A2=0, A3=0, B1=1, B2=0
        A1 = 0; A2 = 0; A3 = 0; B1 = 1; B2 = 0;
        #10;
        if (Y !== 1'b1) begin
            $display("FAIL: Test case 5 failed, expected Y=1, got Y=%b", Y);
            $finish;
        end

        // Test case 6: A1=0, A2=0, A3=0, B1=0, B2=1
        A1 = 0; A2 = 0; A3 = 0; B1 = 0; B2 = 1;
        #10;
        if (Y !== 1'b1) begin
            $display("FAIL: Test case 6 failed, expected Y=1, got Y=%b", Y);
            $finish;
        end

        // Test case 7: A1=1, A2=1, A3=1, B1=1, B2=1
        A1 = 1; A2 = 1; A3 = 1; B1 = 1; B2 = 1;
        #10;
        if (Y !== 1'b0) begin
            $display("FAIL: Test case 7 failed, expected Y=0, got Y=%b", Y);
            $finish;
        end

        // Test case 8: A1=1, A2=1, A3=0, B1=1, B2=1
        A1 = 1; A2 = 1; A3 = 0; B1 = 1; B2 = 1;
        #10;
        if (Y !== 1'b0) begin
            $display("FAIL: Test case 8 failed, expected Y=0, got Y=%b", Y);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule