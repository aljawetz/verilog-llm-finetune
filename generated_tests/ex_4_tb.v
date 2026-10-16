`timescale 1ns/1ps

module tb_ex;

    // Inputs
    reg a;

    // Outputs
    wire y;

    // Instantiate the Unit Under Test (UUT)
    ex uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test case 1: a = 0
        a = 1'b0;
        #10; // Wait for 10 time units
        if (y !== 1'b1) begin
            $display("FAIL: Expected y = 1 when a = 0, got y = %b", y);
            $finish;
        end

        // Test case 2: a = 1
        a = 1'b1;
        #10; // Wait for 10 time units
        if (y !== 1'b0) begin
            $display("FAIL: Expected y = 0 when a = 1, got y = %b", y);
            $finish;
        end

        // Test case 3: a = 0 again
        a = 1'b0;
        #10; // Wait for 10 time units
        if (y !== 1'b1) begin
            $display("FAIL: Expected y = 1 when a = 0, got y = %b", y);
            $finish;
        end

        // Test case 4: a = 1 again
        a = 1'b1;
        #10; // Wait for 10 time units
        if (y !== 1'b0) begin
            $display("FAIL: Expected y = 0 when a = 1, got y = %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule