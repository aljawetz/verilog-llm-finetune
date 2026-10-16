`timescale 1ns/1ps

module tb_decoder_2to4;

    reg [1:0] data_in;
    wire [3:0] data_out;

    // Instantiate the module under test (uut)
    decoder_2to4 uut (
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        // Test case 1: Input = 00
        data_in = 2'b00;
        #10;
        if (data_out !== 4'b0001) begin
            $display("FAIL: Test case 1 failed for input 00");
            $finish;
        end

        // Test case 2: Input = 01
        data_in = 2'b01;
        #10;
        if (data_out !== 4'b0010) begin
            $display("FAIL: Test case 2 failed for input 01");
            $finish;
        end

        // Test case 3: Input = 10
        data_in = 2'b10;
        #10;
        if (data_out !== 4'b0100) begin
            $display("FAIL: Test case 3 failed for input 10");
            $finish;
        end

        // Test case 4: Input = 11
        data_in = 2'b11;
        #10;
        if (data_out !== 4'b1000) begin
            $display("FAIL: Test case 4 failed for input 11");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule