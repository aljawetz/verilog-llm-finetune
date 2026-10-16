`timescale 1ns/1ps

module tb_number_of_ones;

    reg [7:0] a;
    wire [2:0] c;

    // Instantiate the module under test (uut)
    number_of_ones uut (
        .a(a),
        .c(c)
    );

    initial begin
        // Test case 1: All zeros
        a = 8'b00000000;
        #10;
        if (c !== 3'b000) $display("FAIL: Test case 1 failed, expected 0, got %b", c);

        // Test case 2: One '1'
        a = 8'b00000001;
        #10;
        if (c !== 3'b001) $display("FAIL: Test case 2 failed, expected 1, got %b", c);

        // Test case 3: Three '1's
        a = 8'b00000111;
        #10;
        if (c !== 3'b011) $display("FAIL: Test case 3 failed, expected 3, got %b", c);

        // Test case 4: Five '1's
        a = 8'b11111000;
        #10;
        if (c !== 3'b101) $display("FAIL: Test case 4 failed, expected 5, got %b", c);

        // Test case 5: Eight '1's
        a = 8'b11111111;
        #10;
        if (c !== 3'b111) $display("FAIL: Test case 5 failed, expected 8, got %b", c);

        // Test case 6: Random pattern
        a = 8'b10101010;
        #10;
        if (c !== 3'b010) $display("FAIL: Test case 6 failed, expected 4, got %b", c);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule