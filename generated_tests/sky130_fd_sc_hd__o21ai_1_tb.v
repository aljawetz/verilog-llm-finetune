`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__o21ai;

    // Inputs
    reg A1;
    reg A2;
    reg B1;

    // Output
    wire Y;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__o21ai uut (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .B1(B1)
    );

    initial begin
        // Initialize Inputs
        A1 = 0; A2 = 0; B1 = 0;
        #10;

        // Test case 1: A1 = 0, A2 = 0, B1 = 0
        // OR(0, 0) = 0 -> NAND(0, 0) = 1
        if (Y !== 1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: A1 = 0, A2 = 1, B1 = 0
        // OR(0, 1) = 1 -> NAND(1, 0) = 1
        A2 = 1;
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: A1 = 1, A2 = 0, B1 = 0
        // OR(1, 0) = 1 -> NAND(1, 0) = 1
        A1 = 1; A2 = 0;
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: A1 = 1, A2 = 1, B1 = 0
        // OR(1, 1) = 1 -> NAND(1, 0) = 1
        A2 = 1;
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: A1 = 0, A2 = 0, B1 = 1
        // OR(0, 0) = 0 -> NAND(0, 1) = 1
        A1 = 0; A2 = 0; B1 = 1;
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: A1 = 0, A2 = 1, B1 = 1
        // OR(0, 1) = 1 -> NAND(1, 1) = 0
        A2 = 1; B1 = 1;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: A1 = 1, A2 = 0, B1 = 1
        // OR(1, 0) = 1 -> NAND(1, 1) = 0
        A1 = 1; A2 = 0;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: A1 = 1, A2 = 1, B1 = 1
        // OR(1, 1) = 1 -> NAND(1, 1) = 0
        A2 = 1;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule