`timescale 1ns/1ps

module tb_cde_pad_od_dig;

    // Testbench signals
    reg pad_oe;
    wire pad_in;
    wire PAD;

    // Instantiate the module under test (uut)
    cde_pad_od_dig uut (
        .PAD(PAD),
        .pad_in(pad_in),
        .pad_oe(pad_oe)
    );

    // Drive the PAD signal
    assign PAD = (pad_oe) ? 1'b0 : 1'bz;

    initial begin
        // Initialize signals
        pad_oe = 1'b0;

        // Test 1: Check high-impedance state when pad_oe is low
        #10;
        if (pad_in !== 1'bz) begin
            $display("FAIL: Expected pad_in to be high-impedance when pad_oe is low");
            $finish;
        end

        // Test 2: Drive the pad low when pad_oe is high
        pad_oe = 1'b1;
        #10;
        if (pad_in !== 1'b0) begin
            $display("FAIL: Expected pad_in to be 0 when pad_oe is high");
            $finish;
        end

        // Test 3: Check high-impedance state again when pad_oe is low
        pad_oe = 1'b0;
        #10;
        if (pad_in !== 1'bz) begin
            $display("FAIL: Expected pad_in to be high-impedance when pad_oe is low");
            $finish;
        end

        // Test 4: Drive the pad low again when pad_oe is high
        pad_oe = 1'b1;
        #10;
        if (pad_in !== 1'b0) begin
            $display("FAIL: Expected pad_in to be 0 when pad_oe is high");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule