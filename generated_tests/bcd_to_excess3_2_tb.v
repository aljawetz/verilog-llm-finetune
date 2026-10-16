`timescale 1ns/1ps

module tb_bcd_to_excess3;

    reg [3:0] b;
    wire [3:0] e;

    // Instantiate the module under test
    bcd_to_excess3 uut (
        .b(b),
        .e(e)
    );

    initial begin
        // Test cases for BCD to Excess-3 conversion
        // BCD 0 (0000) -> Excess-3 3 (0011)
        b = 4'b0000; #10;
        if (e !== 4'b0011) begin
            $display("FAIL: BCD 0 to Excess-3 conversion failed");
            $finish;
        end

        // BCD 1 (0001) -> Excess-3 4 (0100)
        b = 4'b0001; #10;
        if (e !== 4'b0100) begin
            $display("FAIL: BCD 1 to Excess-3 conversion failed");
            $finish;
        end

        // BCD 2 (0010) -> Excess-3 5 (0101)
        b = 4'b0010; #10;
        if (e !== 4'b0101) begin
            $display("FAIL: BCD 2 to Excess-3 conversion failed");
            $finish;
        end

        // BCD 3 (0011) -> Excess-3 6 (0110)
        b = 4'b0011; #10;
        if (e !== 4'b0110) begin
            $display("FAIL: BCD 3 to Excess-3 conversion failed");
            $finish;
        end

        // BCD 4 (0100) -> Excess-3 7 (0111)
        b = 4'b0100; #10;
        if (e !== 4'b0111) begin
            $display("FAIL: BCD 4 to Excess-3 conversion failed");
            $finish;
        end

        // BCD 5 (0101) -> Excess-3 8 (1000)
        b = 4'b0101; #10;
        if (e !== 4'b1000) begin
            $display("FAIL: BCD 5 to Excess-3 conversion failed");
            $finish;
        end

        // BCD 6 (0110) -> Excess-3 9 (1001)
        b = 4'b0110; #10;
        if (e !== 4'b1001) begin
            $display("FAIL: BCD 6 to Excess-3 conversion failed");
            $finish;
        end

        // BCD 7 (0111) -> Excess-3 10 (1010)
        b = 4'b0111; #10;
        if (e !== 4'b1010) begin
            $display("FAIL: BCD 7 to Excess-3 conversion failed");
            $finish;
        end

        // BCD 8 (1000) -> Excess-3 11 (1011)
        b = 4'b1000; #10;
        if (e !== 4'b1011) begin
            $display("FAIL: BCD 8 to Excess-3 conversion failed");
            $finish;
        end

        // BCD 9 (1001) -> Excess-3 12 (1100)
        b = 4'b1001; #10;
        if (e !== 4'b1100) begin
            $display("FAIL: BCD 9 to Excess-3 conversion failed");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule