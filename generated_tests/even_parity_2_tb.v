`timescale 1ns/1ps

module tb_even_parity;

    reg [2:0] data;
    reg even_p;
    wire result;

    // Instantiate the module under test (uut)
    even_parity uut (
        .data(data),
        .even_p(even_p),
        .result(result)
    );

    initial begin
        // Test case 1: data = 3'b000, even_p = 0
        data = 3'b000; even_p = 0; #10;
        if (result !== 0) $display("FAIL: Test case 1 failed, expected result 0, got %b", result);

        // Test case 2: data = 3'b000, even_p = 1
        data = 3'b000; even_p = 1; #10;
        if (result !== 1) $display("FAIL: Test case 2 failed, expected result 1, got %b", result);

        // Test case 3: data = 3'b111, even_p = 0
        data = 3'b111; even_p = 0; #10;
        if (result !== 1) $display("FAIL: Test case 3 failed, expected result 1, got %b", result);

        // Test case 4: data = 3'b111, even_p = 1
        data = 3'b111; even_p = 1; #10;
        if (result !== 0) $display("FAIL: Test case 4 failed, expected result 0, got %b", result);

        // Test case 5: data = 3'b101, even_p = 0
        data = 3'b101; even_p = 0; #10;
        if (result !== 0) $display("FAIL: Test case 5 failed, expected result 0, got %b", result);

        // Test case 6: data = 3'b101, even_p = 1
        data = 3'b101; even_p = 1; #10;
        if (result !== 1) $display("FAIL: Test case 6 failed, expected result 1, got %b", result);

        // Test case 7: data = 3'b010, even_p = 0
        data = 3'b010; even_p = 0; #10;
        if (result !== 1) $display("FAIL: Test case 7 failed, expected result 1, got %b", result);

        // Test case 8: data = 3'b010, even_p = 1
        data = 3'b010; even_p = 1; #10;
        if (result !== 0) $display("FAIL: Test case 8 failed, expected result 0, got %b", result);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule