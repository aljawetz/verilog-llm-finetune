`timescale 1ns/1ps

module tb_decoder_2to4;

    reg [1:0] b;
    wire [3:0] y;

    // Instantiate the module under test (uut)
    decoder_2to4 uut (
        .y(y),
        .b(b)
    );

    initial begin
        // Test case 1: Input 00 should activate output y[0]
        b = 2'b00; #10;
        if (y !== 4'b0001) begin
            $display("FAIL: Test case 1 failed, expected y=0001, got y=%b", y);
            $finish;
        end

        // Test case 2: Input 01 should activate output y[1]
        b = 2'b01; #10;
        if (y !== 4'b0010) begin
            $display("FAIL: Test case 2 failed, expected y=0010, got y=%b", y);
            $finish;
        end

        // Test case 3: Input 10 should activate output y[2]
        b = 2'b10; #10;
        if (y !== 4'b0100) begin
            $display("FAIL: Test case 3 failed, expected y=0100, got y=%b", y);
            $finish;
        end

        // Test case 4: Input 11 should activate output y[3]
        b = 2'b11; #10;
        if (y !== 4'b1000) begin
            $display("FAIL: Test case 4 failed, expected y=1000, got y=%b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule