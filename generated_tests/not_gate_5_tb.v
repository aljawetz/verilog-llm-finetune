`timescale 1ns/1ps

module tb_not_gate;

    // Inputs
    reg A;

    // Outputs
    wire Y;

    // Instantiate the Unit Under Test (UUT)
    not_gate uut (
        .A(A),
        .Y(Y)
    );

    initial begin
        // Test case 1: A = 0
        A = 0;
        #10; // Wait for 10 time units
        if (Y !== 1) begin
            $display("FAIL: Test case 1 failed, expected Y = 1 but got Y = %b", Y);
            $finish;
        end

        // Test case 2: A = 1
        A = 1;
        #10; // Wait for 10 time units
        if (Y !== 0) begin
            $display("FAIL: Test case 2 failed, expected Y = 0 but got Y = %b", Y);
            $finish;
        end

        // Test case 3: A = 0 again
        A = 0;
        #10; // Wait for 10 time units
        if (Y !== 1) begin
            $display("FAIL: Test case 3 failed, expected Y = 1 but got Y = %b", Y);
            $finish;
        end

        // Test case 4: A = 1 again
        A = 1;
        #10; // Wait for 10 time units
        if (Y !== 0) begin
            $display("FAIL: Test case 4 failed, expected Y = 0 but got Y = %b", Y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule