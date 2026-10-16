`timescale 1ns/1ps

module tb_parity;

    reg [4:0] a;
    reg s;
    wire p;

    // Instantiate the module under test (uut)
    parity uut (
        .a(a),
        .s(s),
        .p(p)
    );

    initial begin
        // Test case 1: s = 0, a = 5'b00000
        a = 5'b00000; s = 0;
        #10;
        if (p !== 1'b0) $display("FAIL: Test case 1 failed, expected p=0, got p=%b", p);

        // Test case 2: s = 0, a = 5'b11111
        a = 5'b11111; s = 0;
        #10;
        if (p !== 1'b1) $display("FAIL: Test case 2 failed, expected p=1, got p=%b", p);

        // Test case 3: s = 1, a = 5'b00000
        a = 5'b00000; s = 1;
        #10;
        if (p !== 1'b1) $display("FAIL: Test case 3 failed, expected p=1, got p=%b", p);

        // Test case 4: s = 1, a = 5'b11111
        a = 5'b11111; s = 1;
        #10;
        if (p !== 1'b0) $display("FAIL: Test case 4 failed, expected p=0, got p=%b", p);

        // Test case 5: s = 0, a = 5'b10101
        a = 5'b10101; s = 0;
        #10;
        if (p !== 1'b0) $display("FAIL: Test case 5 failed, expected p=0, got p=%b", p);

        // Test case 6: s = 1, a = 5'b10101
        a = 5'b10101; s = 1;
        #10;
        if (p !== 1'b1) $display("FAIL: Test case 6 failed, expected p=1, got p=%b", p);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule