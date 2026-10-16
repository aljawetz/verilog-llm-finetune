`timescale 1ns/1ps

module tb_simple_logic;

    // Inputs
    reg a;
    reg b;

    // Outputs
    wire y;

    // Instantiate the Unit Under Test (UUT)
    simple_logic uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Test case 1: Both inputs low
        a = 0; b = 0;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test case 1 failed (a=0, b=0, y=%b)", y);
            $finish;
        end

        // Test case 2: Both inputs high
        a = 1; b = 1;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test case 2 failed (a=1, b=1, y=%b)", y);
            $finish;
        end

        // Test case 3: One input high, one low
        a = 0; b = 1;
        #10;
        if (y !== 0) begin
            $display("FAIL: Test case 3 failed (a=0, b=1, y=%b)", y);
            $finish;
        end

        // Test case 4: One input low, one high
        a = 1; b = 0;
        #10;
        if (y !== 0) begin
            $display("FAIL: Test case 4 failed (a=1, b=0, y=%b)", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule