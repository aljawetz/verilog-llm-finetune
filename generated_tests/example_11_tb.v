`timescale 1ns/1ps

module tb_example;

    reg [31:0] x;
    wire [31:0] y;
    wire [31:0] z;
    wire [31:0] w;

    // Instantiate the module under test (uut)
    example uut (
        .x(x),
        .y(y),
        .z(z),
        .w(w)
    );

    initial begin
        // Test case 1
        x = 32'd1; // Input: 1
        #10;
        if (y !== 32'd5) $display("FAIL: Test case 1 failed for y");
        if (z !== 32'd23) $display("FAIL: Test case 1 failed for z");
        if (w !== 32'd81) $display("FAIL: Test case 1 failed for w");

        // Test case 2
        x = 32'd2; // Input: 2
        #10;
        if (y !== 32'd13) $display("FAIL: Test case 2 failed for y");
        if (z !== 32'd59) $display("FAIL: Test case 2 failed for z");
        if (w !== 32'd193) $display("FAIL: Test case 2 failed for w");

        // Test case 3
        x = 32'd3; // Input: 3
        #10;
        if (y !== 32'd21) $display("FAIL: Test case 3 failed for y");
        if (z !== 32'd95) $display("FAIL: Test case 3 failed for z");
        if (w !== 32'd305) $display("FAIL: Test case 3 failed for w");

        // Test case 4
        x = 32'd0; // Input: 0
        #10;
        if (y !== 32'd0) $display("FAIL: Test case 4 failed for y");
        if (z !== 32'd0) $display("FAIL: Test case 4 failed for z");
        if (w !== 32'd0) $display("FAIL: Test case 4 failed for w");

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule