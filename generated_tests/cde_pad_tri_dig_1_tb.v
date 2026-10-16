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

        // Test case 1: Check PAD when pad_oe is low (high impedance)
        #10;
        if (PAD !== 1'bz) begin
            $display("FAIL: Expected PAD to be high impedance when pad_oe is low");
            $finish;
        end

        // Test case 2: Check PAD when pad_oe is high and pad_out is 0
        pad_oe = 1'b1; 
        pad_out = 1'b0; 
        #10;
        if (PAD !== 1'b0) begin
            $display("FAIL: Expected PAD to be 0 when pad_oe is high and pad_out is 0");
            $finish;
        end

        // Test case 3: Check PAD when pad_oe is high and pad_out is 1
        pad_out = 1'b1; 
        #10;
        if (PAD !== 1'b1) begin
            $display("FAIL: Expected PAD to be 1 when pad_oe is high and pad_out is 1");
            $finish;
        end

        // Test case 4: Check PAD when pad_oe is low again
        pad_oe = 1'b0; 
        #10;
        if (PAD !== 1'bz) begin
            $display("FAIL: Expected PAD to be high impedance when pad_oe is low again");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule