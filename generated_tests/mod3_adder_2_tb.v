`timescale 1ns/1ps

module tb_mod3_adder;

    reg [1:0] din_a, din_b;
    wire [1:0] dat_o;

    // Instantiate the module under test (uut)
    mod3_adder uut (
        .din_a(din_a),
        .din_b(din_b),
        .dat_o(dat_o)
    );

    initial begin
        // Test cases
        din_a = 2'b00; din_b = 2'b00; #10;
        if (dat_o !== 2'b00) $display("FAIL: Test case 1 failed (00 + 00)");

        din_a = 2'b00; din_b = 2'b01; #10;
        if (dat_o !== 2'b01) $display("FAIL: Test case 2 failed (00 + 01)");

        din_a = 2'b00; din_b = 2'b10; #10;
        if (dat_o !== 2'b10) $display("FAIL: Test case 3 failed (00 + 10)");

        din_a = 2'b01; din_b = 2'b00; #10;
        if (dat_o !== 2'b01) $display("FAIL: Test case 4 failed (01 + 00)");

        din_a = 2'b01; din_b = 2'b01; #10;
        if (dat_o !== 2'b10) $display("FAIL: Test case 5 failed (01 + 01)");

        din_a = 2'b01; din_b = 2'b10; #10;
        if (dat_o !== 2'b00) $display("FAIL: Test case 6 failed (01 + 10)");

        din_a = 2'b10; din_b = 2'b00; #10;
        if (dat_o !== 2'b10) $display("FAIL: Test case 7 failed (10 + 00)");

        din_a = 2'b10; din_b = 2'b01; #10;
        if (dat_o !== 2'b00) $display("FAIL: Test case 8 failed (10 + 01)");

        din_a = 2'b10; din_b = 2'b10; #10;
        if (dat_o !== 2'b01) $display("FAIL: Test case 9 failed (10 + 10)");

        $display("PASS");
        $finish;
    end

endmodule