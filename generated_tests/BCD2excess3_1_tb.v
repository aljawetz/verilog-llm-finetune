`timescale 1ns/1ps

module tb_BCD2excess3;

    reg [3:0] bcd_in;
    wire [3:0] excess3_out;

    // Instantiate the module under test
    BCD2excess3 uut (
        .bcd_in(bcd_in),
        .excess3_out(excess3_out)
    );

    initial begin
        // Test cases
        bcd_in = 4'b0000; #10;
        if (excess3_out !== 4'b0011) $display("FAIL: Test case bcd_in=0000 failed");

        bcd_in = 4'b0001; #10;
        if (excess3_out !== 4'b0100) $display("FAIL: Test case bcd_in=0001 failed");

        bcd_in = 4'b0010; #10;
        if (excess3_out !== 4'b0101) $display("FAIL: Test case bcd_in=0010 failed");

        bcd_in = 4'b0011; #10;
        if (excess3_out !== 4'b0110) $display("FAIL: Test case bcd_in=0011 failed");

        bcd_in = 4'b0100; #10;
        if (excess3_out !== 4'b0111) $display("FAIL: Test case bcd_in=0100 failed");

        bcd_in = 4'b0101; #10;
        if (excess3_out !== 4'b1000) $display("FAIL: Test case bcd_in=0101 failed");

        bcd_in = 4'b0110; #10;
        if (excess3_out !== 4'b1001) $display("FAIL: Test case bcd_in=0110 failed");

        bcd_in = 4'b0111; #10;
        if (excess3_out !== 4'b1010) $display("FAIL: Test case bcd_in=0111 failed");

        bcd_in = 4'b1000; #10;
        if (excess3_out !== 4'b1011) $display("FAIL: Test case bcd_in=1000 failed");

        bcd_in = 4'b1001; #10;
        if (excess3_out !== 4'b1100) $display("FAIL: Test case bcd_in=1001 failed");

        // Check for invalid BCD input
        bcd_in = 4'b1010; #10;
        if (excess3_out !== 4'bxxxx) $display("FAIL: Test case bcd_in=1010 failed");

        bcd_in = 4'b1111; #10;
        if (excess3_out !== 4'bxxxx) $display("FAIL: Test case bcd_in=1111 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule