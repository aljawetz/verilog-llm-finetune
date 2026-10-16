`timescale 1ns/1ps

module tb_ex;

    reg a;
    wire y;

    // Instantiate the module under test (uut)
    ex uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test sequence
        // Test case 1: a = 0
        a = 1'b0; 
        #10; // Wait for 10 time units
        if (y !== 1'b1) begin
            $display("FAIL: Expected y = 1'b1 when a = 0, got y = %b", y);
            $finish;
        end

        // Test case 2: a = 1
        a = 1'b1; 
        #10; // Wait for 10 time units
        if (y !== 1'b0) begin
            $display("FAIL: Expected y = 1'b0 when a = 1, got y = %b", y);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule