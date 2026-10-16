`timescale 1ns/1ps

module tb_hs_1b;

    reg IN0;
    reg IN1;
    wire SUB;
    wire BORROW_OUT;

    // Instantiate the half subtractor
    hs_1b uut (
        .IN0(IN0),
        .IN1(IN1),
        .SUB(SUB),
        .BORROW_OUT(BORROW_OUT)
    );

    initial begin
        // Test case 1: IN0 = 0, IN1 = 0
        IN0 = 0; IN1 = 0;
        #10;
        if (SUB !== 0 || BORROW_OUT !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: IN0 = 0, IN1 = 1
        IN0 = 0; IN1 = 1;
        #10;
        if (SUB !== 1 || BORROW_OUT !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: IN0 = 1, IN1 = 0
        IN0 = 1; IN1 = 0;
        #10;
        if (SUB !== 1 || BORROW_OUT !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: IN0 = 1, IN1 = 1
        IN0 = 1; IN1 = 1;
        #10;
        if (SUB !== 0 || BORROW_OUT !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule