`timescale 1ns/1ps

module tb_example;

    // Inputs
    reg [1:0] a;
    reg [1:0] b;
    reg c;

    // Output
    wire [1:0] o;

    // Instantiate the Unit Under Test (UUT)
    example uut (
        .a(a),
        .b(b),
        .c(c),
        .o(o)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0
        a = 2'b00; b = 2'b00; c = 1'b0;
        #10;
        if (o !== 2'b00) $display("FAIL: Test case 1 failed, expected 00, got %b", o);

        // Test case 2: 1 + 0 + 0 = 1
        a = 2'b01; b = 2'b00; c = 1'b0;
        #10;
        if (o !== 2'b01) $display("FAIL: Test case 2 failed, expected 01, got %b", o);

        // Test case 3: 1 + 1 + 0 = 2
        a = 2'b01; b = 2'b01; c = 1'b0;
        #10;
        if (o !== 2'b10) $display("FAIL: Test case 3 failed, expected 10, got %b", o);

        // Test case 4: 2 + 1 + 0 = 3
        a = 2'b10; b = 2'b01; c = 1'b0;
        #10;
        if (o !== 2'b11) $display("FAIL: Test case 4 failed, expected 11, got %b", o);

        // Test case 5: 2 + 2 + 0 = 4 (output should be 0 due to 2-bit limit)
        a = 2'b10; b = 2'b10; c = 1'b0;
        #10;
        if (o !== 2'b00) $display("FAIL: Test case 5 failed, expected 00, got %b", o);

        // Test case 6: 1 + 1 + 1 = 3
        a = 2'b01; b = 2'b01; c = 1'b1;
        #10;
        if (o !== 2'b11) $display("FAIL: Test case 6 failed, expected 11, got %b", o);

        // Test case 7: 2 + 2 + 1 = 5 (output should be 1 due to 2-bit limit)
        a = 2'b10; b = 2'b10; c = 1'b1;
        #10;
        if (o !== 2'b01) $display("FAIL: Test case 7 failed, expected 01, got %b", o);

        // Test case 8: 3 + 3 + 1 = 7 (output should be 3 due to 2-bit limit)
        a = 2'b11; b = 2'b11; c = 1'b1;
        #10;
        if (o !== 2'b11) $display("FAIL: Test case 8 failed, expected 11, got %b", o);

        $display("PASS");
        $finish;
    end

endmodule