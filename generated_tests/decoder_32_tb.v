`timescale 1ns/1ps

module tb_decoder;

    reg a, b, c;
    wire [7:0] out;

    // Instantiate the decoder module
    decoder uut (
        .a(a),
        .b(b),
        .c(c),
        .out(out)
    );

    initial begin
        // Test all combinations of a, b, c
        // Expected output is a one-hot encoded value corresponding to the input combination
        {a, b, c} = 3'b000; #10;
        if (out !== 8'b00000001) $display("FAIL: Test case 000 failed");

        {a, b, c} = 3'b001; #10;
        if (out !== 8'b00000010) $display("FAIL: Test case 001 failed");

        {a, b, c} = 3'b010; #10;
        if (out !== 8'b00000100) $display("FAIL: Test case 010 failed");

        {a, b, c} = 3'b011; #10;
        if (out !== 8'b00000110) $display("FAIL: Test case 011 failed");

        {a, b, c} = 3'b100; #10;
        if (out !== 8'b00010000) $display("FAIL: Test case 100 failed");

        {a, b, c} = 3'b101; #10;
        if (out !== 8'b00010010) $display("FAIL: Test case 101 failed");

        {a, b, c} = 3'b110; #10;
        if (out !== 8'b01000000) $display("FAIL: Test case 110 failed");

        {a, b, c} = 3'b111; #10;
        if (out !== 8'b10000000) $display("FAIL: Test case 111 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule