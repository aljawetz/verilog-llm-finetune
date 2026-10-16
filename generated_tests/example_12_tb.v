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
        // Test case 1: x = 1
        x = 32'h00000001;
        #10;
        if (y !== 32'h0000000D) $display("FAIL: Test case 1 failed for y");
        if (z !== 32'h00000019) $display("FAIL: Test case 1 failed for z");
        if (w !== 32'h0000003F) $display("FAIL: Test case 1 failed for w");

        // Test case 2: x = 2
        x = 32'h00000002;
        #10;
        if (y !== 32'h0000001A) $display("FAIL: Test case 2 failed for y");
        if (z !== 32'h00000032) $display("FAIL: Test case 2 failed for z");
        if (w !== 32'h0000007E) $display("FAIL: Test case 2 failed for w");

        // Test case 3: x = 3
        x = 32'h00000003;
        #10;
        if (y !== 32'h00000026) $display("FAIL: Test case 3 failed for y");
        if (z !== 32'h0000004B) $display("FAIL: Test case 3 failed for z");
        if (w !== 32'h000000BF) $display("FAIL: Test case 3 failed for w");

        // Test case 4: x = 4
        x = 32'h00000004;
        #10;
        if (y !== 32'h00000033) $display("FAIL: Test case 4 failed for y");
        if (z !== 32'h00000064) $display("FAIL: Test case 4 failed for z");
        if (w !== 32'h000000FE) $display("FAIL: Test case 4 failed for w");

        // Test case 5: x = 5
        x = 32'h00000005;
        #10;
        if (y !== 32'h00000040) $display("FAIL: Test case 5 failed for y");
        if (z !== 32'h0000007D) $display("FAIL: Test case 5 failed for z");
        if (w !== 32'h0000011D) $display("FAIL: Test case 5 failed for w");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule