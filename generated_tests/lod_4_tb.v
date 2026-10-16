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
        // Test cases
        // Test case 1: First high bit at position 7
        data_in = 8'b10000000; #10;
        if (data_out !== 3'b111) $display("FAIL: Expected 3'b111 for input 8'b10000000, got %b", data_out);

        // Test case 2: First high bit at position 6
        data_in = 8'b01000000; #10;
        if (data_out !== 3'b110) $display("FAIL: Expected 3'b110 for input 8'b01000000, got %b", data_out);

        // Test case 3: First high bit at position 5
        data_in = 8'b00100000; #10;
        if (data_out !== 3'b101) $display("FAIL: Expected 3'b101 for input 8'b00100000, got %b", data_out);

        // Test case 4: First high bit at position 4
        data_in = 8'b00010000; #10;
        if (data_out !== 3'b100) $display("FAIL: Expected 3'b100 for input 8'b00010000, got %b", data_out);

        // Test case 5: First high bit at position 3
        data_in = 8'b00001000; #10;
        if (data_out !== 3'b011) $display("FAIL: Expected 3'b011 for input 8'b00001000, got %b", data_out);

        // Test case 6: First high bit at position 2
        data_in = 8'b00000100; #10;
        if (data_out !== 3'b010) $display("FAIL: Expected 3'b010 for input 8'b00000100, got %b", data_out);

        // Test case 7: First high bit at position 1
        data_in = 8'b00000010; #10;
        if (data_out !== 3'b001) $display("FAIL: Expected 3'b001 for input 8'b00000010, got %b", data_out);

        // Test case 8: First high bit at position 0
        data_in = 8'b00000001; #10;
        if (data_out !== 3'b000) $display("FAIL: Expected 3'b000 for input 8'b00000001, got %b", data_out);

        // Test case 9: All bits low
        data_in = 8'b00000000; #10;
        if (data_out !== 3'b000) $display("FAIL: Expected 3'b000 for input 8'b00000000, got %b", data_out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule