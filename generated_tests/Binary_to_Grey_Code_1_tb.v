`timescale 1ns/1ps

module tb_Binary_to_Grey_Code;

    reg [2:0] B;
    wire [2:0] G;

    // Instantiate the module under test (uut)
    Binary_to_Grey_Code uut (
        .B(B),
        .G(G)
    );

    initial begin
        // Test case 1: B = 3'b000
        B = 3'b000; #10;
        if (G !== 3'b000) $display("FAIL: Test case 1 failed, expected G = 3'b000, got G = %b", G);

        // Test case 2: B = 3'b001
        B = 3'b001; #10;
        if (G !== 3'b001) $display("FAIL: Test case 2 failed, expected G = 3'b001, got G = %b", G);

        // Test case 3: B = 3'b010
        B = 3'b010; #10;
        if (G !== 3'b011) $display("FAIL: Test case 3 failed, expected G = 3'b011, got G = %b", G);

        // Test case 4: B = 3'b011
        B = 3'b011; #10;
        if (G !== 3'b010) $display("FAIL: Test case 4 failed, expected G = 3'b010, got G = %b", G);

        // Test case 5: B = 3'b100
        B = 3'b100; #10;
        if (G !== 3'b110) $display("FAIL: Test case 5 failed, expected G = 3'b110, got G = %b", G);

        // Test case 6: B = 3'b101
        B = 3'b101; #10;
        if (G !== 3'b111) $display("FAIL: Test case 6 failed, expected G = 3'b111, got G = %b", G);

        // Test case 7: B = 3'b110
        B = 3'b110; #10;
        if (G !== 3'b100) $display("FAIL: Test case 7 failed, expected G = 3'b100, got G = %b", G);

        // Test case 8: B = 3'b111
        B = 3'b111; #10;
        if (G !== 3'b101) $display("FAIL: Test case 8 failed, expected G = 3'b101, got G = %b", G);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule