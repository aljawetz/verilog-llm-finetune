`timescale 1ns/1ps

module tb_cde_pad_tri_dig;

    reg pad_oe;
    reg pad_out;
    wire PAD;

    // Instantiate the module under test (uut)
    cde_pad_tri_dig uut (
        .PAD(PAD),
        .pad_out(pad_out),
        .pad_oe(pad_oe)
    );

    initial begin
        // Initialize inputs
        pad_oe = 0;
        pad_out = 0;

        // Test case 1: Check high impedance state when pad_oe is low
        #10;
        if (PAD !== 1'bz) begin
            $display("FAIL: PAD should be high impedance when pad_oe is low");
            $finish;
        end

        // Test case 2: Drive PAD with pad_out when pad_oe is high
        pad_oe = 1;
        pad_out = 1;
        #10;
        if (PAD !== 1'b1) begin
            $display("FAIL: PAD should be driven high when pad_oe is high and pad_out is high");
            $finish;
        end

        // Test case 3: Drive PAD low with pad_out when pad_oe is high
        pad_out = 0;
        #10;
        if (PAD !== 1'b0) begin
            $display("FAIL: PAD should be driven low when pad_oe is high and pad_out is low");
            $finish;
        end

        // Test case 4: Check high impedance state again when pad_oe is low
        pad_oe = 0;
        #10;
        if (PAD !== 1'bz) begin
            $display("FAIL: PAD should be high impedance when pad_oe is low");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule