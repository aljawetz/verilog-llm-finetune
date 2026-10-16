`timescale 1ns/1ps

module tb_decoder;

    parameter OUT_DW = 8;
    parameter IN_DW = $clog2(OUT_DW);
    
    reg [IN_DW-1:0] in_data;
    wire [OUT_DW-1:0] dec_out;

    // Instantiate the module under test (uut)
    decoder #(.OUT_DW(OUT_DW)) uut (
        .in_data(in_data),
        .dec_out(dec_out)
    );

    initial begin
        // Test case 1: in_data = 0
        in_data = 0;
        #10;
        if (dec_out !== 8'b00000001) begin
            $display("FAIL: Test case 1 failed, expected 00000001, got %b", dec_out);
            $finish;
        end

        // Test case 2: in_data = 1
        in_data = 1;
        #10;
        if (dec_out !== 8'b00000010) begin
            $display("FAIL: Test case 2 failed, expected 00000010, got %b", dec_out);
            $finish;
        end

        // Test case 3: in_data = 2
        in_data = 2;
        #10;
        if (dec_out !== 8'b00000100) begin
            $display("FAIL: Test case 3 failed, expected 00000100, got %b", dec_out);
            $finish;
        end

        // Test case 4: in_data = 3
        in_data = 3;
        #10;
        if (dec_out !== 8'b00001000) begin
            $display("FAIL: Test case 4 failed, expected 00001000, got %b", dec_out);
            $finish;
        end

        // Test case 5: in_data = 4
        in_data = 4;
        #10;
        if (dec_out !== 8'b00010000) begin
            $display("FAIL: Test case 5 failed, expected 00010000, got %b", dec_out);
            $finish;
        end

        // Test case 6: in_data = 5
        in_data = 5;
        #10;
        if (dec_out !== 8'b00100000) begin
            $display("FAIL: Test case 6 failed, expected 00100000, got %b", dec_out);
            $finish;
        end

        // Test case 7: in_data = 6
        in_data = 6;
        #10;
        if (dec_out !== 8'b01000000) begin
            $display("FAIL: Test case 7 failed, expected 01000000, got %b", dec_out);
            $finish;
        end

        // Test case 8: in_data = 7
        in_data = 7;
        #10;
        if (dec_out !== 8'b10000000) begin
            $display("FAIL: Test case 8 failed, expected 10000000, got %b", dec_out);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule