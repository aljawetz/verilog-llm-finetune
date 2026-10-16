`timescale 1ns/1ps

module tb_tribuf;

    reg in;
    reg cntrl;
    wire y;

    // Instantiate the module under test (uut)
    tribuf uut (
        .in(in),
        .cntrl(cntrl),
        .y(y)
    );

    initial begin
        // Test sequence
        // Test case 1: Control is low, output should be high impedance
        cntrl = 0; in = 1;
        #10;
        if (y !== 1'bz) begin
            $display("FAIL: Expected high impedance (Z) when cntrl is low");
            $finish;
        end

        // Test case 2: Control is high, output should follow input
        cntrl = 1; in = 0;
        #10;
        if (y !== 1'b0) begin
            $display("FAIL: Expected output 0 when cntrl is high and in is 0");
            $finish;
        end

        // Test case 3: Control is high, output should follow input
        in = 1;
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: Expected output 1 when cntrl is high and in is 1");
            $finish;
        end

        // Test case 4: Control is low again, output should be high impedance
        cntrl = 0;
        #10;
        if (y !== 1'bz) begin
            $display("FAIL: Expected high impedance (Z) when cntrl is low");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule