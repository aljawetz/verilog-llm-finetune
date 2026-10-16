`timescale 1ns/1ps

module tb_adder_subtractor_behavioral;

    reg [3:0] a;
    reg [3:0] b;
    reg mode;
    wire [3:0] sum;
    wire cout;

    // Instantiate the module under test (uut)
    adder_subtractor_behavioral uut (
        .a(a),
        .b(b),
        .mode(mode),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Test addition
        a = 4'b0011; // 3
        b = 4'b0001; // 1
        mode = 1;   // Addition
        #10;
        if (sum !== 4'b0100 || cout !== 1'b0) $display("FAIL: Addition test failed");

        // Test subtraction
        a = 4'b0100; // 4
        b = 4'b0010; // 2
        mode = 0;   // Subtraction
        #10;
        if (sum !== 4'b0010 || cout !== 1'b0) $display("FAIL: Subtraction test failed");

        // Test subtraction with borrow
        a = 4'b0001; // 1
        b = 4'b0010; // 2
        mode = 0;   // Subtraction
        #10;
        if (sum !== 4'b1111 || cout !== 1'b1) $display("FAIL: Subtraction with borrow test failed");

        // Test addition with carry out
        a = 4'b1111; // 15
        b = 4'b0001; // 1
        mode = 1;   // Addition
        #10;
        if (sum !== 4'b0000 || cout !== 1'b1) $display("FAIL: Addition with carry test failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule