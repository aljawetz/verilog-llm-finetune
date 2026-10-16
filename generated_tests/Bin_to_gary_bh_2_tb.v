`timescale 1ns/1ps

module tb_Bin_to_gary_bh;

    reg [3:0] bin;
    wire [3:0] gray;

    // Instantiate the module under test
    Bin_to_gary_bh uut (
        .bin(bin),
        .gray(gray)
    );

    initial begin
        // Test cases
        bin = 4'b0000; #10;
        if (gray !== 4'b0000) $display("FAIL: Expected gray code for 0 is 0000, got %b", gray);

        bin = 4'b0001; #10;
        if (gray !== 4'b0001) $display("FAIL: Expected gray code for 1 is 0001, got %b", gray);

        bin = 4'b0010; #10;
        if (gray !== 4'b0011) $display("FAIL: Expected gray code for 2 is 0011, got %b", gray);

        bin = 4'b0011; #10;
        if (gray !== 4'b0010) $display("FAIL: Expected gray code for 3 is 0010, got %b", gray);

        bin = 4'b0100; #10;
        if (gray !== 4'b0110) $display("FAIL: Expected gray code for 4 is 0110, got %b", gray);

        bin = 4'b0101; #10;
        if (gray !== 4'b0111) $display("FAIL: Expected gray code for 5 is 0111, got %b", gray);

        bin = 4'b0110; #10;
        if (gray !== 4'b0101) $display("FAIL: Expected gray code for 6 is 0101, got %b", gray);

        bin = 4'b0111; #10;
        if (gray !== 4'b0100) $display("FAIL: Expected gray code for 7 is 0100, got %b", gray);

        bin = 4'b1000; #10;
        if (gray !== 4'b1100) $display("FAIL: Expected gray code for 8 is 1100, got %b", gray);

        bin = 4'b1001; #10;
        if (gray !== 4'b1101) $display("FAIL: Expected gray code for 9 is 1101, got %b", gray);

        bin = 4'b1010; #10;
        if (gray !== 4'b1111) $display("FAIL: Expected gray code for 10 is 1111, got %b", gray);

        bin = 4'b1011; #10;
        if (gray !== 4'b1110) $display("FAIL: Expected gray code for 11 is 1110, got %b", gray);

        bin = 4'b1100; #10;
        if (gray !== 4'b1010) $display("FAIL: Expected gray code for 12 is 1010, got %b", gray);

        bin = 4'b1101; #10;
        if (gray !== 4'b1011) $display("FAIL: Expected gray code for 13 is 1011, got %b", gray);

        bin = 4'b1110; #10;
        if (gray !== 4'b1001) $display("FAIL: Expected gray code for 14 is 1001, got %b", gray);

        bin = 4'b1111; #10;
        if (gray !== 4'b1000) $display("FAIL: Expected gray code for 15 is 1000, got %b", gray);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule