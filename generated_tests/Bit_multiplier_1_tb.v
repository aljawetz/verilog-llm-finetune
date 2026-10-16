`timescale 1ns/1ps

module tb_Bit_multiplier;

    reg a;
    reg [3:0] b;
    wire [3:0] p;

    // Instantiate the module under test (uut)
    Bit_multiplier uut (
        .a(a),
        .b(b),
        .p(p)
    );

    initial begin
        // Test case 1: a = 0, b = 4'b0000
        a = 0; b = 4'b0000;
        #10;
        if (p !== 4'b0000) $display("FAIL: Test case 1 failed, expected p = 0000, got p = %b", p);

        // Test case 2: a = 0, b = 4'b1111
        a = 0; b = 4'b1111;
        #10;
        if (p !== 4'b0000) $display("FAIL: Test case 2 failed, expected p = 0000, got p = %b", p);

        // Test case 3: a = 1, b = 4'b0000
        a = 1; b = 4'b0000;
        #10;
        if (p !== 4'b0000) $display("FAIL: Test case 3 failed, expected p = 0000, got p = %b", p);

        // Test case 4: a = 1, b = 4'b1111
        a = 1; b = 4'b1111;
        #10;
        if (p !== 4'b1111) $display("FAIL: Test case 4 failed, expected p = 1111, got p = %b", p);

        // Test case 5: a = 1, b = 4'b1010
        a = 1; b = 4'b1010;
        #10;
        if (p !== 4'b1010) $display("FAIL: Test case 5 failed, expected p = 1010, got p = %b", p);

        // Test case 6: a = 0, b = 4'b1010
        a = 0; b = 4'b1010;
        #10;
        if (p !== 4'b0000) $display("FAIL: Test case 6 failed, expected p = 0000, got p = %b", p);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule