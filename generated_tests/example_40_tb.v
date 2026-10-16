`timescale 1ns/1ps

module tb_example;

    // Inputs
    reg [31:0] X;
    reg [31:0] Y;
    reg [31:0] Z;
    reg [31:0] P;
    reg [31:0] Q;
    reg [31:0] R;
    reg [31:0] S;
    reg [31:0] T;

    // Outputs
    wire [31:0] output1;
    wire [31:0] output2;
    wire [31:0] output3;
    wire [31:0] output4;
    wire [31:0] output5;
    wire [31:0] output6;

    // Instantiate the Unit Under Test (UUT)
    example uut (
        .X(X), .Y(Y), .Z(Z), .P(P), .Q(Q), .R(R), .S(S), .T(T),
        .output1(output1), .output2(output2), .output3(output3),
        .output4(output4), .output5(output5), .output6(output6)
    );

    initial begin
        // Test case 1
        X = 2; Y = 3; Z = 4; P = 5; Q = 6; R = 1; S = 7; T = 8;
        #10;
        if (output1 !== 2*3 + 4 + 5) $display("FAIL: Test case 1 output1 failed");
        if (output2 !== 5 + 4 * (6 - 1)) $display("FAIL: Test case 1 output2 failed");
        if (output3 !== 2 + 3 + 7 + 8) $display("FAIL: Test case 1 output3 failed");
        if (output4 !== (3 * 2 + 6) * (5 + 2)) $display("FAIL: Test case 1 output4 failed");
        if (output5 !== 2 * 3 + 5 - (1 + 5 + 2)) $display("FAIL: Test case 1 output5 failed");
        if (output6 !== (2 + 3 + 5) * (6 - 1)) $display("FAIL: Test case 1 output6 failed");

        // Test case 2
        X = 10; Y = 20; Z = 30; P = 40; Q = 50; R = 5; S = 60; T = 70;
        #10;
        if (output1 !== 10*20 + 30 + 40) $display("FAIL: Test case 2 output1 failed");
        if (output2 !== 40 + 30 * (50 - 5)) $display("FAIL: Test case 2 output2 failed");
        if (output3 !== 10 + 20 + 60 + 70) $display("FAIL: Test case 2 output3 failed");
        if (output4 !== (20 * 10 + 50) * (40 + 10)) $display("FAIL: Test case 2 output4 failed");
        if (output5 !== 10 * 20 + 40 - (5 + 40 + 10)) $display("FAIL: Test case 2 output5 failed");
        if (output6 !== (10 + 20 + 40) * (50 - 5)) $display("FAIL: Test case 2 output6 failed");

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule