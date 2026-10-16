`timescale 1ns/1ps

module tb_demux1_8;

    reg in;
    reg [2:0] s;
    wire [7:0] y;

    // Instantiate the module under test
    demux1_8 uut (
        .in(in),
        .s(s),
        .y(y)
    );

    initial begin
        // Initialize inputs
        in = 0;
        s = 3'b000;

        // Test all combinations of select lines with input high
        in = 1;
        for (integer i = 0; i < 8; i = i + 1) begin
            s = i[2:0];
            #10; // Wait for output to settle
            if (y != (1 << i)) begin
                $display("FAIL: Expected y = %b for s = %b, got y = %b", (1 << i), s, y);
                $finish;
            end
        end

        // Test all combinations of select lines with input low
        in = 0;
        for (integer i = 0; i < 8; i = i + 1) begin
            s = i[2:0];
            #10; // Wait for output to settle
            if (y != 8'b00000000) begin
                $display("FAIL: Expected y = 00000000 for s = %b, got y = %b", s, y);
                $finish;
            end
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule