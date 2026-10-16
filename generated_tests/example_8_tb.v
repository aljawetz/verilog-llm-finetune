`timescale 1ns/1ps

module tb_example;

    reg [31:0] X, Y, Z, P, Q, R, S, T;
    wire [31:0] output1, output2, output3, output4, output5, output6;

    // Instantiate the module under test
    example uut (
        .X(X), .Y(Y), .Z(Z), .P(P), .Q(Q), .R(R), .S(S), .T(T),
        .output1(output1), .output2(output2), .output3(output3),
        .output4(output4), .output5(output5), .output6(output6)
    );

    initial begin
        // Test case 1
        X = 2; Y = 3; Z = 4; P = 5; Q = 6; R = 1; S = 7; T = 8;
        #10;
        if (output1 !== 2*3 + 4 + 5) $display("FAIL: Test case 1, output1 mismatch");
        if (output2 !== 5 + 4 * (6 - 1)) $display("FAIL: Test case 1, output2 mismatch");
        if (output3 !== 2 + 3 + 7 + 8) $display("FAIL: Test case 1, output3 mismatch");
        if (output4 !== (3 * 2 + 6) * (5 + 2)) $display("FAIL: Test case 1, output4 mismatch");
        if (output5 !== 2 * 3 + 5 - (1 + 5 + 2)) $display("FAIL: Test case 1, output5 mismatch");
        if (output6 !== (2 + 3 + 5) * (6 - 1)) $display("FAIL: Test case 1, output6 mismatch");

        // Test case 2
        X = 10; Y = 20; Z = 30; P = 40; Q = 50; R = 60; S = 70; T = 80;
        #10;
        if (output1 !== 10*20 + 30 + 40) $display("FAIL: Test case 2, output1 mismatch");
        if (output2 !== 40 + 30 * (50 - 60)) $display("FAIL: Test case 2, output2 mismatch");
        if (output3 !== 10 + 20 + 70 + 80) $display("FAIL: Test case 2, output3 mismatch");
        if (output4 !== (20 * 10 + 50) * (40 + 10)) $display("FAIL: Test case 2, output4 mismatch");
        if (output5 !== 10 * 20 + 40 - (60 + 40 + 10)) $display("FAIL: Test case 2, output5 mismatch");
        if (output6 !== (10 + 20 + 40) * (50 - 60)) $display("FAIL: Test case 2, output6 mismatch");

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule