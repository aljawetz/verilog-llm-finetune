`timescale 1ns/1ps

module tb_alu;

    reg [3:0] a;
    reg [3:0] b;
    reg [2:0] sel;
    wire [3:0] result;
    wire carry;
    wire borrow;

    // Instantiate the ALU module
    alu uut (
        .a(a),
        .b(b),
        .sel(sel),
        .carry(carry),
        .result(result),
        .borrow(borrow)
    );

    initial begin
        // Test Addition
        a = 4'b0011; // 3
        b = 4'b0001; // 1
        sel = 3'b000; // Select addition
        #10;
        if (result !== 4'b0100 || carry !== 1'b0) $display("FAIL: Addition test failed");

        // Test Subtraction
        a = 4'b0100; // 4
        b = 4'b0011; // 3
        sel = 3'b001; // Select subtraction
        #10;
        if (result !== 4'b0001 || borrow !== 1'b0) $display("FAIL: Subtraction test failed");

        // Test AND
        a = 4'b1100; // 12
        b = 4'b1010; // 10
        sel = 3'b010; // Select AND
        #10;
        if (result !== 4'b1000) $display("FAIL: AND test failed");

        // Test OR
        a = 4'b1100; // 12
        b = 4'b1010; // 10
        sel = 3'b011; // Select OR
        #10;
        if (result !== 4'b1110) $display("FAIL: OR test failed");

        // Test XOR
        a = 4'b1100; // 12
        b = 4'b1010; // 10
        sel = 3'b100; // Select XOR
        #10;
        if (result !== 4'b0110) $display("FAIL: XOR test failed");

        // Test Logical AND
        a = 4'b1100; // 12
        b = 4'b1010; // 10
        sel = 3'b101; // Select Logical AND
        #10;
        if (result !== 4'b0000) $display("FAIL: Logical AND test failed");

        // Test Logical OR
        a = 4'b1100; // 12
        b = 4'b1010; // 10
        sel = 3'b110; // Select Logical OR
        #10;
        if (result !== 4'b1111) $display("FAIL: Logical OR test failed");

        // Test default case
        a = 4'b0000; 
        b = 4'b0000; 
        sel = 3'b111; // Select default
        #10;
        if (result !== 4'b0000) $display("FAIL: Default case test failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule