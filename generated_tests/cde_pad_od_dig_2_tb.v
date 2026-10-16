`timescale 1ns/1ps

module tb_cde_pad_od_dig;

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
        // Initialize pad_oe
        pad_oe = 1'b0;

        // Test case 1: Check high-impedance state
        #10;
        if (pad_in !== 1'bz) begin
            $display("FAIL: Expected pad_in to be high-impedance when pad_oe is low");
            $finish;
        end

        // Test case 2: Drive the pad low
        pad_oe = 1'b1;
        #10;
        if (pad_in !== 1'b0) begin
            $display("FAIL: Expected pad_in to be 0 when pad_oe is high");
            $finish;
        end

        // Test case 3: Return to high-impedance state
        pad_oe = 1'b0;
        #10;
        if (pad_in !== 1'bz) begin
            $display("FAIL: Expected pad_in to be high-impedance when pad_oe is low");
            $finish;
        end

        // Test case 4: Drive the pad low again
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