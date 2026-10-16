`timescale 1ns/1ps

module tb_dinv;

    // Inputs
    reg a;

    // Outputs
    wire y;

    // Instantiate the Unit Under Test (UUT)
    dinv uut (
        .a(a), 
        .y(y)
    );

    initial begin
        // Test case 1: Check when a = 0
        a = 0;
        #10; // Wait for 10 time units
        if (y !== 1) begin
            $display("FAIL: Test case 1 failed, expected y = 1 when a = 0, got y = %b", y);
            $finish;
        end

        // Test case 2: Check when a = 1
        a = 1;
        #10; // Wait for 10 time units
        if (y !== 0) begin
            $display("FAIL: Test case 2 failed, expected y = 0 when a = 1, got y = %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule