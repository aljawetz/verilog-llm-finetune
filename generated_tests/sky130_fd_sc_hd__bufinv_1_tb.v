`timescale 1ns/1ps

module tb_bufinv;

    // Inputs
    reg A;

    // Outputs
    wire Y;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__bufinv uut (
        .Y(Y),
        .A(A)
    );

    initial begin
        // Test sequence
        // Test case 1: A = 0
        A = 0;
        #10; // Wait for 10 time units
        if (Y !== 1) begin
            $display("FAIL: Expected Y = 1 when A = 0, got Y = %b", Y);
            $finish;
        end

        // Test case 2: A = 1
        A = 1;
        #10; // Wait for 10 time units
        if (Y !== 0) begin
            $display("FAIL: Expected Y = 0 when A = 1, got Y = %b", Y);
            $finish;
        end

        // Test case 3: A = 0 again
        A = 0;
        #10; // Wait for 10 time units
        if (Y !== 1) begin
            $display("FAIL: Expected Y = 1 when A = 0, got Y = %b", Y);
            $finish;
        end

        // Test case 4: A = 1 again
        A = 1;
        #10; // Wait for 10 time units
        if (Y !== 0) begin
            $display("FAIL: Expected Y = 0 when A = 1, got Y = %b", Y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule