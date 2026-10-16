`timescale 1ns/1ps

module tb_example;

    // Inputs
    reg [31:0] x;

    // Outputs
    wire [31:0] y;
    wire [31:0] z;
    wire [31:0] w;

    // Instantiate the Unit Under Test (UUT)
    example uut (
        .x(x),
        .y(y),
        .z(z),
        .w(w)
    );

    initial begin
        // Test case 1: x = 1
        x = 1;
        #10;
        if (y !== 13) $display("FAIL: Test case 1 (x=1) failed for y");
        if (z !== 25) $display("FAIL: Test case 1 (x=1) failed for z");
        if (w !== 63) $display("FAIL: Test case 1 (x=1) failed for w");

        // Test case 2: x = 2
        x = 2;
        #10;
        if (y !== 26) $display("FAIL: Test case 2 (x=2) failed for y");
        if (z !== 50) $display("FAIL: Test case 2 (x=2) failed for z");
        if (w !== 126) $display("FAIL: Test case 2 (x=2) failed for w");

        // Test case 3: x = 3
        x = 3;
        #10;
        if (y !== 39) $display("FAIL: Test case 3 (x=3) failed for y");
        if (z !== 75) $display("FAIL: Test case 3 (x=3) failed for z");
        if (w !== 189) $display("FAIL: Test case 3 (x=3) failed for w");

        // Test case 4: x = 4
        x = 4;
        #10;
        if (y !== 52) $display("FAIL: Test case 4 (x=4) failed for y");
        if (z !== 100) $display("FAIL: Test case 4 (x=4) failed for z");
        if (w !== 252) $display("FAIL: Test case 4 (x=4) failed for w");

        // Test case 5: x = 10
        x = 10;
        #10;
        if (y !== 130) $display("FAIL: Test case 5 (x=10) failed for y");
        if (z !== 250) $display("FAIL: Test case 5 (x=10) failed for z");
        if (w !== 630) $display("FAIL: Test case 5 (x=10) failed for w");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule