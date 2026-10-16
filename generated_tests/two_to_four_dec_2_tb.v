`timescale 1ns/1ps

module tb_two_to_four_dec;

    reg en;
    reg [1:0] in;
    wire [3:0] y;

    // Instantiate the module under test (uut)
    two_to_four_dec uut (
        .en(en),
        .in(in),
        .y(y)
    );

    initial begin
        // Test case 1: Enable and input 00
        en = 1;
        in = 2'b00;
        #10;
        if (y !== 4'b0001) begin
            $display("FAIL: Expected y=0001 for in=00 and en=1, got y=%b", y);
            $finish;
        end

        // Test case 2: Enable and input 01
        in = 2'b01;
        #10;
        if (y !== 4'b0010) begin
            $display("FAIL: Expected y=0010 for in=01 and en=1, got y=%b", y);
            $finish;
        end

        // Test case 3: Enable and input 10
        in = 2'b10;
        #10;
        if (y !== 4'b0100) begin
            $display("FAIL: Expected y=0100 for in=10 and en=1, got y=%b", y);
            $finish;
        end

        // Test case 4: Enable and input 11
        in = 2'b11;
        #10;
        if (y !== 4'b1000) begin
            $display("FAIL: Expected y=1000 for in=11 and en=1, got y=%b", y);
            $finish;
        end

        // Test case 5: Disable the decoder
        en = 0;
        #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Expected y=0000 for en=0, got y=%b", y);
            $finish;
        end

        // Test case 6: Check behavior with en=0 and any input
        in = 2'b01; // Input should not matter when disabled
        #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Expected y=0000 for en=0, got y=%b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule