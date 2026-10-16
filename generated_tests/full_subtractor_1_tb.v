`timescale 1ns/1ps

module tb_full_subtractor;

    // Inputs
    reg A;
    reg B;
    reg BIN;

    // Outputs
    wire DIFF;
    wire BOUT;

    // Instantiate the full_subtractor module
    full_subtractor uut (
        .A(A),
        .B(B),
        .BIN(BIN),
        .DIFF(DIFF),
        .BOUT(BOUT)
    );

    initial begin
        // Test case 1: A = 0, B = 0, BIN = 0
        A = 0; B = 0; BIN = 0;
        #10;
        if (DIFF !== 0 || BOUT !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: A = 0, B = 0, BIN = 1
        A = 0; B = 0; BIN = 1;
        #10;
        if (DIFF !== 1 || BOUT !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: A = 0, B = 1, BIN = 0
        A = 0; B = 1; BIN = 0;
        #10;
        if (DIFF !== 1 || BOUT !== 1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: A = 0, B = 1, BIN = 1
        A = 0; B = 1; BIN = 1;
        #10;
        if (DIFF !== 0 || BOUT !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: A = 1, B = 0, BIN = 0
        A = 1; B = 0; BIN = 0;
        #10;
        if (DIFF !== 1 || BOUT !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: A = 1, B = 0, BIN = 1
        A = 1; B = 0; BIN = 1;
        #10;
        if (DIFF !== 0 || BOUT !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: A = 1, B = 1, BIN = 0
        A = 1; B = 1; BIN = 0;
        #10;
        if (DIFF !== 0 || BOUT !== 0) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: A = 1, B = 1, BIN = 1
        A = 1; B = 1; BIN = 1;
        #10;
        if (DIFF !== 1 || BOUT !== 1) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule