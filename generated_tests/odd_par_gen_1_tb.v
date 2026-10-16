`timescale 1ns/1ps

module tb_odd_par_gen;

    reg [2:0] a;
    wire odd;

    // Instantiate the module under test (uut)
    odd_par_gen uut (
        .a(a),
        .odd(odd)
    );

    initial begin
        // Test case 1: a = 3'b000, expected odd = 0
        a = 3'b000;
        #10;
        if (odd !== 0) $display("FAIL: Test case 1 failed, a = %b, odd = %b", a, odd);

        // Test case 2: a = 3'b001, expected odd = 1
        a = 3'b001;
        #10;
        if (odd !== 1) $display("FAIL: Test case 2 failed, a = %b, odd = %b", a, odd);

        // Test case 3: a = 3'b010, expected odd = 1
        a = 3'b010;
        #10;
        if (odd !== 1) $display("FAIL: Test case 3 failed, a = %b, odd = %b", a, odd);

        // Test case 4: a = 3'b011, expected odd = 0
        a = 3'b011;
        #10;
        if (odd !== 0) $display("FAIL: Test case 4 failed, a = %b, odd = %b", a, odd);

        // Test case 5: a = 3'b100, expected odd = 1
        a = 3'b100;
        #10;
        if (odd !== 1) $display("FAIL: Test case 5 failed, a = %b, odd = %b", a, odd);

        // Test case 6: a = 3'b101, expected odd = 0
        a = 3'b101;
        #10;
        if (odd !== 0) $display("FAIL: Test case 6 failed, a = %b, odd = %b", a, odd);

        // Test case 7: a = 3'b110, expected odd = 0
        a = 3'b110;
        #10;
        if (odd !== 0) $display("FAIL: Test case 7 failed, a = %b, odd = %b", a, odd);

        // Test case 8: a = 3'b111, expected odd = 1
        a = 3'b111;
        #10;
        if (odd !== 1) $display("FAIL: Test case 8 failed, a = %b, odd = %b", a, odd);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule