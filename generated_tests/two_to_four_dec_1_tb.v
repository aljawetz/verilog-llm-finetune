`timescale 1ns/1ps

module tb_two_to_four_dec;

    reg en;
    reg [1:0] in;
    wire [3:0] y;

    // Instantiate the unit under test (uut)
    two_to_four_dec uut (
        .en(en),
        .in(in),
        .y(y)
    );

    initial begin
        // Test case 1: Enable with input 00
        en = 1;
        in = 2'b00;
        #10;
        if (y !== 4'b0001) begin
            $display("FAIL: Test case 1 failed, expected 0001, got %b", y);
            $finish;
        end

        // Test case 2: Enable with input 01
        in = 2'b01;
        #10;
        if (y !== 4'b0010) begin
            $display("FAIL: Test case 2 failed, expected 0010, got %b", y);
            $finish;
        end

        // Test case 3: Enable with input 10
        in = 2'b10;
        #10;
        if (y !== 4'b0100) begin
            $display("FAIL: Test case 3 failed, expected 0100, got %b", y);
            $finish;
        end

        // Test case 4: Enable with input 11
        in = 2'b11;
        #10;
        if (y !== 4'b1000) begin
            $display("FAIL: Test case 4 failed, expected 1000, got %b", y);
            $finish;
        end

        // Test case 5: Disable the decoder
        en = 0;
        #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 5 failed, expected 0000, got %b", y);
            $finish;
        end

        // Test case 6: Check behavior with enable low and different inputs
        in = 2'b01;
        #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 6 failed, expected 0000, got %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule