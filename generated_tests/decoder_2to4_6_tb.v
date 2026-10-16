`timescale 1ns/1ps

module tb_decoder_2to4;

    reg a_in;
    reg b_in;
    reg en;
    wire [3:0] y_out;

    // Instantiate the module under test (uut)
    decoder_2to4 uut (
        .a_in(a_in),
        .b_in(b_in),
        .en(en),
        .y_out(y_out)
    );

    initial begin
        // Test case 1: Enable low, a_in = 0, b_in = 0
        en = 0; a_in = 0; b_in = 0;
        #10;
        if (y_out !== 4'b1110) $display("FAIL: Test case 1 failed");

        // Test case 2: Enable low, a_in = 0, b_in = 1
        a_in = 0; b_in = 1;
        #10;
        if (y_out !== 4'b1101) $display("FAIL: Test case 2 failed");

        // Test case 3: Enable low, a_in = 1, b_in = 0
        a_in = 1; b_in = 0;
        #10;
        if (y_out !== 4'b1011) $display("FAIL: Test case 3 failed");

        // Test case 4: Enable low, a_in = 1, b_in = 1
        a_in = 1; b_in = 1;
        #10;
        if (y_out !== 4'b0111) $display("FAIL: Test case 4 failed");

        // Test case 5: Enable high, should not affect output
        en = 1; a_in = 0; b_in = 0;
        #10;
        if (y_out !== 4'b0000) $display("FAIL: Test case 5 failed");

        // Test case 6: Enable high, should not affect output
        a_in = 0; b_in = 1;
        #10;
        if (y_out !== 4'b0000) $display("FAIL: Test case 6 failed");

        // Test case 7: Enable high, should not affect output
        a_in = 1; b_in = 0;
        #10;
        if (y_out !== 4'b0000) $display("FAIL: Test case 7 failed");

        // Test case 8: Enable high, should not affect output
        a_in = 1; b_in = 1;
        #10;
        if (y_out !== 4'b0000) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule