`timescale 1ns/1ps

module tb_top_module;

    reg [4:1] x;
    wire f;

    // Instantiate the module under test
    top_module uut (
        .x(x),
        .f(f)
    );

    initial begin
        // Test case 1: x = 4'b0000 -> f should be 1
        x = 4'b0000; #10;
        if (f !== 1) $display("FAIL: Test case 1 failed, x = %b, f = %b", x, f);

        // Test case 2: x = 4'b1000 -> f should be 0
        x = 4'b1000; #10;
        if (f !== 0) $display("FAIL: Test case 2 failed, x = %b, f = %b", x, f);

        // Test case 3: x = 4'b0100 -> f should be 1
        x = 4'b0100; #10;
        if (f !== 1) $display("FAIL: Test case 3 failed, x = %b, f = %b", x, f);

        // Test case 4: x = 4'b1100 -> f should be 0
        x = 4'b1100; #10;
        if (f !== 0) $display("FAIL: Test case 4 failed, x = %b, f = %b", x, f);

        // Test case 5: x = 4'b0110 -> f should be 1
        x = 4'b0110; #10;
        if (f !== 1) $display("FAIL: Test case 5 failed, x = %b, f = %b", x, f);

        // Test case 6: x = 4'b1111 -> f should be 1
        x = 4'b1111; #10;
        if (f !== 1) $display("FAIL: Test case 6 failed, x = %b, f = %b", x, f);

        // Test case 7: x = 4'b1010 -> f should be 0
        x = 4'b1010; #10;
        if (f !== 0) $display("FAIL: Test case 7 failed, x = %b, f = %b", x, f);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule