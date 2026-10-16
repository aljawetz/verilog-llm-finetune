`timescale 1ns/1ps

module tb_enc4to2;

    reg [3:0] in;
    reg en;
    wire [1:0] y;

    // Instantiate the module under test (uut)
    enc4to2 uut (
        .in(in),
        .en(en),
        .y(y)
    );

    initial begin
        // Initialize inputs
        in = 4'b0000;
        en = 0;

        // Test case 1: Enable is low, expect undefined output
        #10;
        if (y !== 2'bxx) begin
            $display("FAIL: Expected y = xx when en = 0, got y = %b", y);
            $finish;
        end

        // Test case 2: Enable is high, input is 0001, expect output 00
        en = 1;
        in = 4'b0001;
        #10;
        if (y !== 2'b00) begin
            $display("FAIL: Expected y = 00 for input 0001, got y = %b", y);
            $finish;
        end

        // Test case 3: Input is 0010, expect output 01
        in = 4'b0010;
        #10;
        if (y !== 2'b01) begin
            $display("FAIL: Expected y = 01 for input 0010, got y = %b", y);
            $finish;
        end

        // Test case 4: Input is 0100, expect output 10
        in = 4'b0100;
        #10;
        if (y !== 2'b10) begin
            $display("FAIL: Expected y = 10 for input 0100, got y = %b", y);
            $finish;
        end

        // Test case 5: Input is 1000, expect output 11
        in = 4'b1000;
        #10;
        if (y !== 2'b11) begin
            $display("FAIL: Expected y = 11 for input 1000, got y = %b", y);
            $finish;
        end

        // Test case 6: Input is invalid, expect high impedance output
        in = 4'b0011; // Invalid one-hot
        #10;
        if (y !== 2'bzz) begin
            $display("FAIL: Expected y = zz for invalid input 0011, got y = %b", y);
            $finish;
        end

        // Test case 7: Enable is low again, expect undefined output
        en = 0;
        #10;
        if (y !== 2'bxx) begin
            $display("FAIL: Expected y = xx when en = 0, got y = %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule