`timescale 1ns/1ps

module tb_decoder_2to4_case;

    // Inputs
    reg [1:0] en;

    // Outputs
    wire [3:0] out;

    // Instantiate the Unit Under Test (UUT)
    decoder_2to4_case uut (
        .en(en),
        .out(out)
    );

    initial begin
        // Test case 1: Input 00
        en = 2'b00;
        #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 1 failed, expected 0000, got %b", out);
            $finish;
        end

        // Test case 2: Input 01
        en = 2'b01;
        #10;
        if (out !== 4'b0001) begin
            $display("FAIL: Test case 2 failed, expected 0001, got %b", out);
            $finish;
        end

        // Test case 3: Input 10
        en = 2'b10;
        #10;
        if (out !== 4'b0010) begin
            $display("FAIL: Test case 3 failed, expected 0010, got %b", out);
            $finish;
        end

        // Test case 4: Input 11
        en = 2'b11;
        #10;
        if (out !== 4'b0100) begin
            $display("FAIL: Test case 4 failed, expected 0100, got %b", out);
            $finish;
        end

        // Test case 5: Input invalid (default case)
        en = 2'bxx; // Invalid input
        #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 5 failed, expected 0000, got %b", out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule