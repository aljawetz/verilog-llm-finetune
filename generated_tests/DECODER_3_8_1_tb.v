`timescale 1ns/1ps

module tb_DECODER_3_8;

    reg [2:0] x;
    wire [7:0] y;

    // Instantiate the module under test
    DECODER_3_8 uut (
        .x(x),
        .y(y)
    );

    initial begin
        // Test all possible input combinations
        // Expected outputs are commented next to each input
        x = 3'b000; #10; // y = 8'b00000001
        if (y !== 8'b00000001) $display("FAIL: Test case x=000 failed");

        x = 3'b001; #10; // y = 8'b00000010
        if (y !== 8'b00000010) $display("FAIL: Test case x=001 failed");

        x = 3'b010; #10; // y = 8'b00000100
        if (y !== 8'b00000100) $display("FAIL: Test case x=010 failed");

        x = 3'b011; #10; // y = 8'b00001000
        if (y !== 8'b00001000) $display("FAIL: Test case x=011 failed");

        x = 3'b100; #10; // y = 8'b00010000
        if (y !== 8'b00010000) $display("FAIL: Test case x=100 failed");

        x = 3'b101; #10; // y = 8'b00100000
        if (y !== 8'b00100000) $display("FAIL: Test case x=101 failed");

        x = 3'b110; #10; // y = 8'b01000000
        if (y !== 8'b01000000) $display("FAIL: Test case x=110 failed");

        x = 3'b111; #10; // y = 8'b10000000
        if (y !== 8'b10000000) $display("FAIL: Test case x=111 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule