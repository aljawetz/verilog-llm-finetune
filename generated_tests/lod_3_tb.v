`timescale 1ns/1ps

module tb_lod;

    reg [7:0] data_in;
    wire [2:0] data_out;

    // Instantiate the module under test (uut)
    lod uut (
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        // Test case 1: First high bit at position 7
        data_in = 8'b10000000; // Expected output: 3'b111
        #10;
        if (data_out !== 3'b111) $display("FAIL: Test case 1 failed, expected 3'b111 but got %b", data_out);

        // Test case 2: First high bit at position 6
        data_in = 8'b01000000; // Expected output: 3'b110
        #10;
        if (data_out !== 3'b110) $display("FAIL: Test case 2 failed, expected 3'b110 but got %b", data_out);

        // Test case 3: First high bit at position 5
        data_in = 8'b00100000; // Expected output: 3'b101
        #10;
        if (data_out !== 3'b101) $display("FAIL: Test case 3 failed, expected 3'b101 but got %b", data_out);

        // Test case 4: First high bit at position 4
        data_in = 8'b00010000; // Expected output: 3'b100
        #10;
        if (data_out !== 3'b100) $display("FAIL: Test case 4 failed, expected 3'b100 but got %b", data_out);

        // Test case 5: First high bit at position 3
        data_in = 8'b00001000; // Expected output: 3'b011
        #10;
        if (data_out !== 3'b011) $display("FAIL: Test case 5 failed, expected 3'b011 but got %b", data_out);

        // Test case 6: First high bit at position 2
        data_in = 8'b00000100; // Expected output: 3'b010
        #10;
        if (data_out !== 3'b010) $display("FAIL: Test case 6 failed, expected 3'b010 but got %b", data_out);

        // Test case 7: First high bit at position 1
        data_in = 8'b00000010; // Expected output: 3'b001
        #10;
        if (data_out !== 3'b001) $display("FAIL: Test case 7 failed, expected 3'b001 but got %b", data_out);

        // Test case 8: First high bit at position 0
        data_in = 8'b00000001; // Expected output: 3'b000
        #10;
        if (data_out !== 3'b000) $display("FAIL: Test case 8 failed, expected 3'b000 but got %b", data_out);

        // Test case 9: All bits low
        data_in = 8'b00000000; // Expected output: 3'b000
        #10;
        if (data_out !== 3'b000) $display("FAIL: Test case 9 failed, expected 3'b000 but got %b", data_out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule