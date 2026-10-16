`timescale 1ns/1ps

module tb_binaryto2scomp;

    reg [3:0] data;
    wire signed [3:0] out;

    // Instantiate the module under test (uut)
    binaryto2scomp uut (
        .data(data),
        .out(out)
    );

    initial begin
        // Test case 1: Input 0000 (0 in decimal)
        data = 4'b0000; #10;
        if (out !== 4'b0001) $display("FAIL: Expected 0001 for input 0000, got %b", out);

        // Test case 2: Input 0001 (1 in decimal)
        data = 4'b0001; #10;
        if (out !== 4'b0001) $display("FAIL: Expected 0001 for input 0001, got %b", out);

        // Test case 3: Input 0010 (2 in decimal)
        data = 4'b0010; #10;
        if (out !== 4'b1110) $display("FAIL: Expected 1110 for input 0010, got %b", out);

        // Test case 4: Input 0011 (3 in decimal)
        data = 4'b0011; #10;
        if (out !== 4'b1101) $display("FAIL: Expected 1101 for input 0011, got %b", out);

        // Test case 5: Input 0100 (4 in decimal)
        data = 4'b0100; #10;
        if (out !== 4'b1100) $display("FAIL: Expected 1100 for input 0100, got %b", out);

        // Test case 6: Input 0111 (7 in decimal)
        data = 4'b0111; #10;
        if (out !== 4'b1001) $display("FAIL: Expected 1001 for input 0111, got %b", out);

        // Test case 7: Input 1000 (8 in decimal)
        data = 4'b1000; #10;
        if (out !== 4'b0111) $display("FAIL: Expected 0111 for input 1000, got %b", out);

        // Test case 8: Input 1111 (15 in decimal)
        data = 4'b1111; #10;
        if (out !== 4'b0001) $display("FAIL: Expected 0001 for input 1111, got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule