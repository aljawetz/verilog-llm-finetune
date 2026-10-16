`timescale 1ns/1ps

module tb_gnor;

    // Inputs
    reg a;
    reg b;

    // Output
    wire y;

    // Instantiate the Unit Under Test (UUT)
    gnor uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Test case 1: Both inputs are low
        a = 0; b = 0; #10;
        if (y !== 1) begin
            $display("FAIL: Test case 1 failed, expected y=1 when a=0 and b=0, got y=%b", y);
            $finish;
        end

        // Test case 2: First input is high, second input is low
        a = 1; b = 0; #10;
        if (y !== 0) begin
            $display("FAIL: Test case 2 failed, expected y=0 when a=1 and b=0, got y=%b", y);
            $finish;
        end

        // Test case 3: First input is low, second input is high
        a = 0; b = 1; #10;
        if (y !== 0) begin
            $display("FAIL: Test case 3 failed, expected y=0 when a=0 and b=1, got y=%b", y);
            $finish;
        end

        // Test case 4: Both inputs are high
        a = 1; b = 1; #10;
        if (y !== 0) begin
            $display("FAIL: Test case 4 failed, expected y=0 when a=1 and b=1, got y=%b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule