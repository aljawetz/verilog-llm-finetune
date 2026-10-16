`timescale 1ns/1ps

module tb_cla_block;

    reg [3:0] P;
    reg [3:0] G;
    reg cin;
    wire [4:0] C;

    // Instantiate the Unit Under Test (UUT)
    cla_block uut (
        .P(P),
        .G(G),
        .cin(cin),
        .C(C)
    );

    initial begin
        // Test case 1: P = 4'b0000, G = 4'b0000, cin = 0
        P = 4'b0000; G = 4'b0000; cin = 0;
        #10;
        if (C !== 5'b00000) $display("FAIL: Test case 1 failed, expected C = 00000, got C = %b", C);

        // Test case 2: P = 4'b1111, G = 4'b0000, cin = 0
        P = 4'b1111; G = 4'b0000; cin = 0;
        #10;
        if (C !== 5'b00000) $display("FAIL: Test case 2 failed, expected C = 00000, got C = %b", C);

        // Test case 3: P = 4'b0000, G = 4'b1111, cin = 0
        P = 4'b0000; G = 4'b1111; cin = 0;
        #10;
        if (C !== 5'b01111) $display("FAIL: Test case 3 failed, expected C = 01111, got C = %b", C);

        // Test case 4: P = 4'b1010, G = 4'b0101, cin = 1
        P = 4'b1010; G = 4'b0101; cin = 1;
        #10;
        if (C !== 5'b11111) $display("FAIL: Test case 4 failed, expected C = 11111, got C = %b", C);

        // Test case 5: P = 4'b1100, G = 4'b0011, cin = 1
        P = 4'b1100; G = 4'b0011; cin = 1;
        #10;
        if (C !== 5'b11110) $display("FAIL: Test case 5 failed, expected C = 11110, got C = %b", C);

        // Test case 6: P = 4'b1111, G = 4'b1111, cin = 1
        P = 4'b1111; G = 4'b1111; cin = 1;
        #10;
        if (C !== 5'b11111) $display("FAIL: Test case 6 failed, expected C = 11111, got C = %b", C);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule