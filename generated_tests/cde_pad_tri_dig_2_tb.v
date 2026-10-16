`timescale 1ns/1ps

module tb_cde_pad_tri_dig;

    reg pad_out;
    reg pad_oe;
    wire PAD;

    // Instantiate the module under test (uut)
    cde_pad_tri_dig uut (
        .PAD(PAD),
        .pad_out(pad_out),
        .pad_oe(pad_oe)
    );

    initial begin
        // Initialize inputs
        pad_out = 1'b0;
        pad_oe = 1'b0;

        // Test case 1: pad_oe is low, PAD should be high impedance
        #10;
        if (PAD !== 1'bz) begin
            $display("FAIL: Test case 1 failed, expected PAD to be high impedance");
            $finish;
        end

        // Test case 2: pad_oe is high, pad_out is low, PAD should be driven low
        pad_oe = 1'b1;
        pad_out = 1'b0;
        #10;
        if (PAD !== 1'b0) begin
            $display("FAIL: Test case 2 failed, expected PAD to be 0");
            $finish;
        end

        // Test case 3: pad_oe is high, pad_out is high, PAD should be driven high
        pad_out = 1'b1;
        #10;
        if (PAD !== 1'b1) begin
            $display("FAIL: Test case 3 failed, expected PAD to be 1");
            $finish;
        end

        // Test case 4: pad_oe is low again, PAD should be high impedance
        pad_oe = 1'b0;
        #10;
        if (PAD !== 1'bz) begin
            $display("FAIL: Test case 4 failed, expected PAD to be high impedance");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule