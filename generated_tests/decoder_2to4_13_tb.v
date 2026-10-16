`timescale 1ns/1ps

module tb_decoder_2to4;

    reg [1:0] in;
    wire [3:0] out;
    
    // Instantiate the module under test (uut)
    decoder_2to4 uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Check input 00
        in = 2'b00;
        #10;
        if (out !== 4'b0001) begin
            $display("FAIL: Test case 1 failed for input 00, expected 0001 but got %b", out);
            $finish;
        end

        // Test case 2: Check input 01
        in = 2'b01;
        #10;
        if (out !== 4'b0010) begin
            $display("FAIL: Test case 2 failed for input 01, expected 0010 but got %b", out);
            $finish;
        end

        // Test case 3: Check input 10
        in = 2'b10;
        #10;
        if (out !== 4'b0100) begin
            $display("FAIL: Test case 3 failed for input 10, expected 0100 but got %b", out);
            $finish;
        end

        // Test case 4: Check input 11
        in = 2'b11;
        #10;
        if (out !== 4'b1000) begin
            $display("FAIL: Test case 4 failed for input 11, expected 1000 but got %b", out);
            $finish;
        end

        // Test case 5: Check undefined input 2'bxx
        in = 2'bxx; // This will be treated as a don't care in simulation
        #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 5 failed for undefined input, expected 0000 but got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule