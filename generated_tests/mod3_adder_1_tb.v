`timescale 1ns/1ps

module tb_mod3_adder;

    reg [1:0] din_a, din_b;
    wire [1:0] dat_o;

    // Instantiate the module under test
    mod3_adder uut (
        .din_a(din_a),
        .din_b(din_b),
        .dat_o(dat_o)
    );

    initial begin
        // Test cases
        din_a = 2'b00; din_b = 2'b00; #10;
        if (dat_o !== 2'b00) $display("FAIL: Test case 1 failed, expected 00, got %b", dat_o);

        din_a = 2'b00; din_b = 2'b01; #10;
        if (dat_o !== 2'b01) $display("FAIL: Test case 2 failed, expected 01, got %b", dat_o);

        din_a = 2'b00; din_b = 2'b10; #10;
        if (dat_o !== 2'b10) $display("FAIL: Test case 3 failed, expected 10, got %b", dat_o);

        din_a = 2'b01; din_b = 2'b00; #10;
        if (dat_o !== 2'b01) $display("FAIL: Test case 4 failed, expected 01, got %b", dat_o);

        din_a = 2'b01; din_b = 2'b01; #10;
        if (dat_o !== 2'b10) $display("FAIL: Test case 5 failed, expected 10, got %b", dat_o);

        din_a = 2'b01; din_b = 2'b10; #10;
        if (dat_o !== 2'b00) $display("FAIL: Test case 6 failed, expected 00, got %b", dat_o);

        din_a = 2'b10; din_b = 2'b00; #10;
        if (dat_o !== 2'b10) $display("FAIL: Test case 7 failed, expected 10, got %b", dat_o);

        din_a = 2'b10; din_b = 2'b01; #10;
        if (dat_o !== 2'b00) $display("FAIL: Test case 8 failed, expected 00, got %b", dat_o);

        din_a = 2'b10; din_b = 2'b10; #10;
        if (dat_o !== 2'b01) $display("FAIL: Test case 9 failed, expected 01, got %b", dat_o);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule