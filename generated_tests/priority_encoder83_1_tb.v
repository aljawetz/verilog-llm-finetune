`timescale 1ns/1ps

module tb_priority_encoder83;

    reg [7:0] in;
    reg enable;
    wire [2:0] y;

    // Instantiate the module under test (uut)
    priority_encoder83 uut (
        .in(in),
        .enable(enable),
        .y(y)
    );

    initial begin
        // Test case 1: Enable with highest bit set
        enable = 1;
        in = 8'b00000001; // Expect y = 3'b000
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 3'b000, got %b", y);

        // Test case 2: Enable with second highest bit set
        in = 8'b00000010; // Expect y = 3'b001
        #10;
        if (y !== 3'b001) $display("FAIL: Test case 2 failed, expected 3'b001, got %b", y);

        // Test case 3: Enable with third highest bit set
        in = 8'b00000100; // Expect y = 3'b010
        #10;
        if (y !== 3'b010) $display("FAIL: Test case 3 failed, expected 3'b010, got %b", y);

        // Test case 4: Enable with fourth highest bit set
        in = 8'b00001000; // Expect y = 3'b011
        #10;
        if (y !== 3'b011) $display("FAIL: Test case 4 failed, expected 3'b011, got %b", y);

        // Test case 5: Enable with fifth highest bit set
        in = 8'b00010000; // Expect y = 3'b100
        #10;
        if (y !== 3'b100) $display("FAIL: Test case 5 failed, expected 3'b100, got %b", y);

        // Test case 6: Enable with sixth highest bit set
        in = 8'b00100000; // Expect y = 3'b101
        #10;
        if (y !== 3'b101) $display("FAIL: Test case 6 failed, expected 3'b101, got %b", y);

        // Test case 7: Enable with seventh highest bit set
        in = 8'b01000000; // Expect y = 3'b110
        #10;
        if (y !== 3'b110) $display("FAIL: Test case 7 failed, expected 3'b110, got %b", y);

        // Test case 8: Enable with highest bit set
        in = 8'b10000000; // Expect y = 3'b111
        #10;
        if (y !== 3'b111) $display("FAIL: Test case 8 failed, expected 3'b111, got %b", y);

        // Test case 9: Disable the encoder
        enable = 0;
        in = 8'b00000000; // Expect y = 3'bzzz
        #10;
        if (y !== 3'bzzz) $display("FAIL: Test case 9 failed, expected high impedance, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule