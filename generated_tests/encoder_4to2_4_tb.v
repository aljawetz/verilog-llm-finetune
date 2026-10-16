`timescale 1ns/1ps

module tb_encoder_4to2;

    reg en;
    reg [3:0] d_in;
    wire [1:0] y_out;

    // Instantiate the module under test (uut)
    encoder_4to2 uut (
        .en(en),
        .d_in(d_in),
        .y_out(y_out)
    );

    initial begin
        // Test case 1: Disabled encoder
        en = 0; d_in = 4'b0000; #10;
        if (y_out !== 2'b00) begin
            $display("FAIL: Expected y_out = 00 when en = 0");
            $finish;
        end

        // Test case 2: Enable encoder with one active input
        en = 1; d_in = 4'b0001; #10;
        if (y_out !== 2'b00) begin
            $display("FAIL: Expected y_out = 00 for input 0001");
            $finish;
        end

        // Test case 3: Enable encoder with second active input
        d_in = 4'b0010; #10;
        if (y_out !== 2'b01) begin
            $display("FAIL: Expected y_out = 01 for input 0010");
            $finish;
        end

        // Test case 4: Enable encoder with third active input
        d_in = 4'b0100; #10;
        if (y_out !== 2'b10) begin
            $display("FAIL: Expected y_out = 10 for input 0100");
            $finish;
        end

        // Test case 5: Enable encoder with fourth active input
        d_in = 4'b1000; #10;
        if (y_out !== 2'b11) begin
            $display("FAIL: Expected y_out = 11 for input 1000");
            $finish;
        end

        // Test case 6: Enable encoder with no active inputs
        d_in = 4'b0000; #10;
        if (y_out !== 2'b00) begin
            $display("FAIL: Expected y_out = 00 for input 0000");
            $finish;
        end

        // Test case 7: Enable encoder with multiple active inputs
        d_in = 4'b0110; #10;
        if (y_out !== 2'b00) begin
            $display("FAIL: Expected y_out = 00 for input 0110 (invalid case)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule