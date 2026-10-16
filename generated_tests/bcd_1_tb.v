`timescale 1ns/1ps

module tb_bcd;

    reg [3:0] bindata;
    wire [6:0] segment;

    // Instantiate the module under test (uut)
    bcd uut (
        .bindata(bindata),
        .segment(segment)
    );

    initial begin
        // Test cases
        bindata = 4'b0000; // Test for 0
        #10;
        if (segment !== 7'b0000001) begin
            $display("FAIL: Expected segment for 0 is 0000001, got %b", segment);
            $finish;
        end

        bindata = 4'b0001; // Test for 1
        #10;
        if (segment !== 7'b1001111) begin
            $display("FAIL: Expected segment for 1 is 1001111, got %b", segment);
            $finish;
        end

        bindata = 4'b0010; // Test for 2
        #10;
        if (segment !== 7'b0010010) begin
            $display("FAIL: Expected segment for 2 is 0010010, got %b", segment);
            $finish;
        end

        bindata = 4'b0011; // Test for 3
        #10;
        if (segment !== 7'b0000110) begin
            $display("FAIL: Expected segment for 3 is 0000110, got %b", segment);
            $finish;
        end

        bindata = 4'b0100; // Test for 4
        #10;
        if (segment !== 7'b1001100) begin
            $display("FAIL: Expected segment for 4 is 1001100, got %b", segment);
            $finish;
        end

        bindata = 4'b0101; // Test for 5
        #10;
        if (segment !== 7'b0100100) begin
            $display("FAIL: Expected segment for 5 is 0100100, got %b", segment);
            $finish;
        end

        bindata = 4'b0110; // Test for 6
        #10;
        if (segment !== 7'b0100000) begin
            $display("FAIL: Expected segment for 6 is 0100000, got %b", segment);
            $finish;
        end

        bindata = 4'b0111; // Test for 7
        #10;
        if (segment !== 7'b0001111) begin
            $display("FAIL: Expected segment for 7 is 0001111, got %b", segment);
            $finish;
        end

        bindata = 4'b1000; // Test for 8
        #10;
        if (segment !== 7'b0000000) begin
            $display("FAIL: Expected segment for 8 is 0000000, got %b", segment);
            $finish;
        end

        bindata = 4'b1001; // Test for 9
        #10;
        if (segment !== 7'b0000100) begin
            $display("FAIL: Expected segment for 9 is 0000100, got %b", segment);
            $finish;
        end

        bindata = 4'b1010; // Test for invalid input
        #10;
        if (segment !== 7'b1111111) begin
            $display("FAIL: Expected segment for invalid input is 1111111, got %b", segment);
            $finish;
        end

        bindata = 4'b1111; // Test for another invalid input
        #10;
        if (segment !== 7'b1111111) begin
            $display("FAIL: Expected segment for invalid input is 1111111, got %b", segment);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule