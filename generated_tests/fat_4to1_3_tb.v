`timescale 1ns/1ps

module tb_fat_4to1;

    reg [3:0] d4;
    wire eout3;

    // Instantiate the module under test (uut)
    fat_4to1 uut (
        .d4(d4),
        .eout3(eout3)
    );

    initial begin
        // Test case 1: d4 = 4'b0000
        d4 = 4'b0000; #10;
        if (eout3 !== 1'b1) $display("FAIL: Test case 1 failed (d4 = 0000, eout3 = %b)", eout3);

        // Test case 2: d4 = 4'b0001
        d4 = 4'b0001; #10;
        if (eout3 !== 1'b1) $display("FAIL: Test case 2 failed (d4 = 0001, eout3 = %b)", eout3);

        // Test case 3: d4 = 4'b0010
        d4 = 4'b0010; #10;
        if (eout3 !== 1'b1) $display("FAIL: Test case 3 failed (d4 = 0010, eout3 = %b)", eout3);

        // Test case 4: d4 = 4'b0011
        d4 = 4'b0011; #10;
        if (eout3 !== 1'b0) $display("FAIL: Test case 4 failed (d4 = 0011, eout3 = %b)", eout3);

        // Test case 5: d4 = 4'b0100
        d4 = 4'b0100; #10;
        if (eout3 !== 1'b1) $display("FAIL: Test case 5 failed (d4 = 0100, eout3 = %b)", eout3);

        // Test case 6: d4 = 4'b0101
        d4 = 4'b0101; #10;
        if (eout3 !== 1'b0) $display("FAIL: Test case 6 failed (d4 = 0101, eout3 = %b)", eout3);

        // Test case 7: d4 = 4'b1000
        d4 = 4'b1000; #10;
        if (eout3 !== 1'b1) $display("FAIL: Test case 7 failed (d4 = 1000, eout3 = %b)", eout3);

        // Test case 8: d4 = 4'b1111
        d4 = 4'b1111; #10;
        if (eout3 !== 1'b0) $display("FAIL: Test case 8 failed (d4 = 1111, eout3 = %b)", eout3);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule