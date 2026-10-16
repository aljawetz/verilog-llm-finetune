`timescale 1ns/1ps

module tb_num_of_ones;

    reg [7:0] byte;
    wire [2:0] count;

    // Instantiate the module under test (uut)
    num_of_ones uut (
        .byte(byte),
        .count(count)
    );

    initial begin
        // Test case 1: All zeros
        byte = 8'b00000000; #10;
        if (count !== 3'b000) $display("FAIL: Expected count 0 for input 00000000, got %b", count);

        // Test case 2: One one
        byte = 8'b00000001; #10;
        if (count !== 3'b001) $display("FAIL: Expected count 1 for input 00000001, got %b", count);

        // Test case 3: Two ones
        byte = 8'b00000011; #10;
        if (count !== 3'b010) $display("FAIL: Expected count 2 for input 00000011, got %b", count);

        // Test case 4: Four ones
        byte = 8'b00001111; #10;
        if (count !== 3'b100) $display("FAIL: Expected count 4 for input 00001111, got %b", count);

        // Test case 5: All ones
        byte = 8'b11111111; #10;
        if (count !== 3'b111) $display("FAIL: Expected count 8 for input 11111111, got %b", count);

        // Test case 6: Random value
        byte = 8'b10101010; #10;
        if (count !== 3'b010) $display("FAIL: Expected count 4 for input 10101010, got %b", count);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule