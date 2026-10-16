`timescale 1ns/1ps

module tb_ginv;

    // Inputs
    reg a;

    // Outputs
    wire y;

    // Instantiate the Unit Under Test (UUT)
    ginv uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test case 1: Input is 0
        a = 0;
        #10; // Wait for 10 time units
        if (y !== 1) begin
            $display("FAIL: Test case 1 failed, expected y = 1 when a = 0, got y = %b", y);
            $finish;
        end

        // Test case 2: Input is 1
        a = 1;
        #10; // Wait for 10 time units
        if (y !== 0) begin
            $display("FAIL: Test case 2 failed, expected y = 0 when a = 1, got y = %b", y);
            $finish;
        end

        // Test case 3: Input toggling
        a = 0;
        #10; // Wait for 10 time units
        if (y !== 1) begin
            $display("FAIL: Test case 3 failed, expected y = 1 when a = 0, got y = %b", y);
            $finish;
        end
        
        a = 1;
        #10; // Wait for 10 time units
        if (y !== 0) begin
            $display("FAIL: Test case 3 failed, expected y = 0 when a = 1, got y = %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule