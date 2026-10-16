`timescale 1ns/1ps

module tb_CarryGenerator;

    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] c;

    // Instantiate the CarryGenerator module
    CarryGenerator uut (
        .a(a),
        .b(b),
        .cin(cin),
        .c(c)
    );

    initial begin
        // Test case 1: Simple addition with no carry
        a = 4'b0001; // 1
        b = 4'b0001; // 1
        cin = 0;
        #10;
        if (c !== 4'b0000) $display("FAIL: Test case 1 failed, expected c=0000, got c=%b", c);

        // Test case 2: Simple addition with carry
        a = 4'b0001; // 1
        b = 4'b0001; // 1
        cin = 1;
        #10;
        if (c !== 4'b0001) $display("FAIL: Test case 2 failed, expected c=0001, got c=%b", c);

        // Test case 3: All bits set, no carry in
        a = 4'b1111; // 15
        b = 4'b0001; // 1
        cin = 0;
        #10;
        if (c !== 4'b1111) $display("FAIL: Test case 3 failed, expected c=1111, got c=%b", c);

        // Test case 4: All bits set, with carry in
        a = 4'b1111; // 15
        b = 4'b0001; // 1
        cin = 1;
        #10;
        if (c !== 4'b1111) $display("FAIL: Test case 4 failed, expected c=1111, got c=%b", c);

        // Test case 5: Mixed bits with carry
        a = 4'b1010; // 10
        b = 4'b0101; // 5
        cin = 0;
        #10;
        if (c !== 4'b1111) $display("FAIL: Test case 5 failed, expected c=1111, got c=%b", c);

        // Test case 6: Mixed bits with carry in
        a = 4'b1010; // 10
        b = 4'b0101; // 5
        cin = 1;
        #10;
        if (c !== 4'b1111) $display("FAIL: Test case 6 failed, expected c=1111, got c=%b", c);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule