`timescale 1ns/1ps

module tb_example;

    reg [31:0] x;
    wire [31:0] y, z, w;

    // Instantiate the module under test (uut)
    example uut (
        .x(x),
        .y(y),
        .z(z),
        .w(w)
    );

    initial begin
        // Test case 1: x = 0
        x = 32'h00000000;
        #10;
        if (y !== 32'h00000000) $display("FAIL: Test case 1, expected y = 0, got y = %h", y);
        if (z !== 32'h00000000) $display("FAIL: Test case 1, expected z = 0, got z = %h", z);
        if (w !== 32'h00000000) $display("FAIL: Test case 1, expected w = 0, got w = %h", w);

        // Test case 2: x = 1
        x = 32'h00000001;
        #10;
        if (y !== 32'h00000009) $display("FAIL: Test case 2, expected y = 9, got y = %h", y);
        if (z !== 32'h00000017) $display("FAIL: Test case 2, expected z = 23, got z = %h", z);
        if (w !== 32'h00000051) $display("FAIL: Test case 2, expected w = 81, got w = %h", w);

        // Test case 3: x = 2
        x = 32'h00000002;
        #10;
        if (y !== 32'h00000012) $display("FAIL: Test case 3, expected y = 18, got y = %h", y);
        if (z !== 32'h00000034) $display("FAIL: Test case 3, expected z = 46, got z = %h", z);
        if (w !== 32'h000000A2) $display("FAIL: Test case 3, expected w = 162, got w = %h", w);

        // Test case 4: x = 3
        x = 32'h00000003;
        #10;
        if (y !== 32'h0000001B) $display("FAIL: Test case 4, expected y = 27, got y = %h", y);
        if (z !== 32'h0000004B) $display("FAIL: Test case 4, expected z = 69, got z = %h", z);
        if (w !== 32'h000000C3) $display("FAIL: Test case 4, expected w = 243, got w = %h", w);

        // Test case 5: x = 4
        x = 32'h00000004;
        #10;
        if (y !== 32'h00000024) $display("FAIL: Test case 5, expected y = 36, got y = %h", y);
        if (z !== 32'h00000068) $display("FAIL: Test case 5, expected z = 92, got z = %h", z);
        if (w !== 32'h00000120) $display("FAIL: Test case 5, expected w = 324, got w = %h", w);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule