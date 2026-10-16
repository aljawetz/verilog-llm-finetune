`timescale 1ns/1ps

module tb_priorityenc8to3;

    reg [7:0] i;
    reg en;
    wire [2:0] y;

    // Instantiate the module under test (uut)
    priorityenc8to3 uut (
        .i(i),
        .en(en),
        .y(y)
    );

    initial begin
        // Initialize inputs
        i = 8'b00000000;
        en = 0;

        // Test case 1: Check output when disabled
        #10;
        if (y !== 3'bzzz) begin
            $display("FAIL: Expected high impedance (zzz) when disabled, got %b", y);
            $finish;
        end

        // Enable the encoder
        en = 1;

        // Test case 2: Check output for highest priority input
        i = 8'b00000001; // Expect output 000
        #10;
        if (y !== 3'b000) begin
            $display("FAIL: Expected output 000 for input %b, got %b", i, y);
            $finish;
        end

        i = 8'b00000010; // Expect output 001
        #10;
        if (y !== 3'b001) begin
            $display("FAIL: Expected output 001 for input %b, got %b", i, y);
            $finish;
        end

        i = 8'b00000100; // Expect output 010
        #10;
        if (y !== 3'b010) begin
            $display("FAIL: Expected output 010 for input %b, got %b", i, y);
            $finish;
        end

        i = 8'b00001000; // Expect output 011
        #10;
        if (y !== 3'b011) begin
            $display("FAIL: Expected output 011 for input %b, got %b", i, y);
            $finish;
        end

        i = 8'b00010000; // Expect output 100
        #10;
        if (y !== 3'b100) begin
            $display("FAIL: Expected output 100 for input %b, got %b", i, y);
            $finish;
        end

        i = 8'b00100000; // Expect output 101
        #10;
        if (y !== 3'b101) begin
            $display("FAIL: Expected output 101 for input %b, got %b", i, y);
            $finish;
        end

        i = 8'b01000000; // Expect output 110
        #10;
        if (y !== 3'b110) begin
            $display("FAIL: Expected output 110 for input %b, got %b", i, y);
            $finish;
        end

        i = 8'b10000000; // Expect output 111
        #10;
        if (y !== 3'b111) begin
            $display("FAIL: Expected output 111 for input %b, got %b", i, y);
            $finish;
        end

        // Test case 3: Check output when no inputs are asserted
        i = 8'b00000000; // Expect output 000
        #10;
        if (y !== 3'b000) begin
            $display("FAIL: Expected output 000 for input %b, got %b", i, y);
            $finish;
        end

        // Disable the encoder again
        en = 0;
        #10;
        if (y !== 3'bzzz) begin
            $display("FAIL: Expected high impedance (zzz) when disabled, got %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule