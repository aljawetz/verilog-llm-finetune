`timescale 1ns/1ps

module tb_odd_par_checker;

    reg [2:0] b;
    reg p;
    wire par_checker;

    // Instantiate the module under test (uut)
    odd_par_checker uut (
        .par_checker(par_checker),
        .b(b),
        .p(p)
    );

    initial begin
        // Test case 1: b = 3'b000, p = 0 (even parity)
        b = 3'b000; p = 0;
        #10;
        if (par_checker !== 1) $display("FAIL: Test case 1 failed, expected 1 but got %b", par_checker);

        // Test case 2: b = 3'b001, p = 0 (odd parity)
        b = 3'b001; p = 0;
        #10;
        if (par_checker !== 0) $display("FAIL: Test case 2 failed, expected 0 but got %b", par_checker);

        // Test case 3: b = 3'b010, p = 0 (odd parity)
        b = 3'b010; p = 0;
        #10;
        if (par_checker !== 0) $display("FAIL: Test case 3 failed, expected 0 but got %b", par_checker);

        // Test case 4: b = 3'b011, p = 0 (even parity)
        b = 3'b011; p = 0;
        #10;
        if (par_checker !== 1) $display("FAIL: Test case 4 failed, expected 1 but got %b", par_checker);

        // Test case 5: b = 3'b111, p = 1 (even parity)
        b = 3'b111; p = 1;
        #10;
        if (par_checker !== 1) $display("FAIL: Test case 5 failed, expected 1 but got %b", par_checker);

        // Test case 6: b = 3'b110, p = 1 (odd parity)
        b = 3'b110; p = 1;
        #10;
        if (par_checker !== 0) $display("FAIL: Test case 6 failed, expected 0 but got %b", par_checker);

        // Test case 7: b = 3'b101, p = 1 (odd parity)
        b = 3'b101; p = 1;
        #10;
        if (par_checker !== 0) $display("FAIL: Test case 7 failed, expected 0 but got %b", par_checker);

        // Test case 8: b = 3'b100, p = 1 (even parity)
        b = 3'b100; p = 1;
        #10;
        if (par_checker !== 1) $display("FAIL: Test case 8 failed, expected 1 but got %b", par_checker);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule