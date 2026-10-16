`timescale 1ns/1ps

module tb_even_parity_df;

    reg [2:0] data;
    wire even_p;

    // Instantiate the module under test (uut)
    even_parity_df uut (
        .data(data),
        .even_p(even_p)
    );

    initial begin
        // Test case 1: Input = 3'b000 (even parity)
        data = 3'b000;
        #10;
        if (even_p !== 1'b1) $display("FAIL: Test case 1 failed, expected even_p = 1, got %b", even_p);

        // Test case 2: Input = 3'b001 (odd parity)
        data = 3'b001;
        #10;
        if (even_p !== 1'b0) $display("FAIL: Test case 2 failed, expected even_p = 0, got %b", even_p);

        // Test case 3: Input = 3'b010 (odd parity)
        data = 3'b010;
        #10;
        if (even_p !== 1'b0) $display("FAIL: Test case 3 failed, expected even_p = 0, got %b", even_p);

        // Test case 4: Input = 3'b011 (even parity)
        data = 3'b011;
        #10;
        if (even_p !== 1'b1) $display("FAIL: Test case 4 failed, expected even_p = 1, got %b", even_p);

        // Test case 5: Input = 3'b100 (odd parity)
        data = 3'b100;
        #10;
        if (even_p !== 1'b0) $display("FAIL: Test case 5 failed, expected even_p = 0, got %b", even_p);

        // Test case 6: Input = 3'b101 (even parity)
        data = 3'b101;
        #10;
        if (even_p !== 1'b1) $display("FAIL: Test case 6 failed, expected even_p = 1, got %b", even_p);

        // Test case 7: Input = 3'b110 (even parity)
        data = 3'b110;
        #10;
        if (even_p !== 1'b1) $display("FAIL: Test case 7 failed, expected even_p = 1, got %b", even_p);

        // Test case 8: Input = 3'b111 (odd parity)
        data = 3'b111;
        #10;
        if (even_p !== 1'b0) $display("FAIL: Test case 8 failed, expected even_p = 0, got %b", even_p);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule