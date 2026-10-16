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
        if (dat_o !== 2'b00) begin
            $display("FAIL: Test case 1 failed, expected 2'b00, got %b", dat_o);
            $finish;
        end

        // Test case 2: plus_one = 0, minus_one = 1
        plus_one = 0; minus_one = 1;
        #10;
        if (dat_o !== 2'b10) begin
            $display("FAIL: Test case 2 failed, expected 2'b10, got %b", dat_o);
            $finish;
        end

        // Test case 3: plus_one = 1, minus_one = 0
        plus_one = 1; minus_one = 0;
        #10;
        if (dat_o !== 2'b01) begin
            $display("FAIL: Test case 3 failed, expected 2'b01, got %b", dat_o);
            $finish;
        end

        // Test case 4: plus_one = 1, minus_one = 1
        plus_one = 1; minus_one = 1;
        #10;
        if (dat_o !== 2'b00) begin
            $display("FAIL: Test case 4 failed, expected 2'b00, got %b", dat_o);
            $finish;
        end

        // Test case 5: plus_one = 0, minus_one = 0 (again to check stability)
        plus_one = 0; minus_one = 0;
        #10;
        if (dat_o !== 2'b00) begin
            $display("FAIL: Test case 5 failed, expected 2'b00, got %b", dat_o);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule