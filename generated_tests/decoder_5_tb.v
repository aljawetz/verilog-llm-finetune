`timescale 1ns/1ps

module tb_decoder;

    reg en;
    reg [1:0] in;
    wire [3:0] out;

    // Instantiate the decoder module
    decoder uut (
        .en(en),
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Enable decoder and input 0
        en = 1;
        in = 2'b00;
        #10;
        if (out !== 4'b0001) begin
            $display("FAIL: Test case 1 failed, expected 0001, got %b", out);
            $finish;
        end

        // Test case 2: Enable decoder and input 1
        in = 2'b01;
        #10;
        if (out !== 4'b0010) begin
            $display("FAIL: Test case 2 failed, expected 0010, got %b", out);
            $finish;
        end

        // Test case 3: Enable decoder and input 2
        in = 2'b10;
        #10;
        if (out !== 4'b0100) begin
            $display("FAIL: Test case 3 failed, expected 0100, got %b", out);
            $finish;
        end

        // Test case 4: Enable decoder and input 3
        in = 2'b11;
        #10;
        if (out !== 4'b1000) begin
            $display("FAIL: Test case 4 failed, expected 1000, got %b", out);
            $finish;
        end

        // Test case 5: Disable decoder
        en = 0;
        in = 2'b10; // Input should not matter when disabled
        #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 5 failed, expected 0000, got %b", out);
            $finish;
        end

        // Test case 6: Check default case when enabled
        en = 1;
        in = 2'bxx; // Invalid input
        #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 6 failed, expected 0000, got %b", out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule