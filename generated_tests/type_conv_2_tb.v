`timescale 1ns/1ps

module tb_type_conv;

    reg plus_one;
    reg minus_one;
    wire [1:0] dat_o;

    // Instantiate the module under test (uut)
    type_conv uut (
        .plus_one(plus_one),
        .minus_one(minus_one),
        .dat_o(dat_o)
    );

    initial begin
        // Test case 1: plus_one = 0, minus_one = 0
        plus_one = 0; minus_one = 0;
        #10;
        if (dat_o !== 2'b00) $display("FAIL: Test case 1 failed, expected 00, got %b", dat_o);

        // Test case 2: plus_one = 0, minus_one = 1
        plus_one = 0; minus_one = 1;
        #10;
        if (dat_o !== 2'b10) $display("FAIL: Test case 2 failed, expected 10, got %b", dat_o);

        // Test case 3: plus_one = 1, minus_one = 0
        plus_one = 1; minus_one = 0;
        #10;
        if (dat_o !== 2'b01) $display("FAIL: Test case 3 failed, expected 01, got %b", dat_o);

        // Test case 4: plus_one = 1, minus_one = 1
        plus_one = 1; minus_one = 1;
        #10;
        if (dat_o !== 2'b00) $display("FAIL: Test case 4 failed, expected 00, got %b", dat_o);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule