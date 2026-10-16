`timescale 1ns/1ps

module tb_mux_81;

reg D0, D1, D2, D3, D4, D5, D6, D7;
reg S0, S1, S2;
wire out;

// Instantiate the module under test (uut)
mux_81 uut (
    .out(out),
    .D0(D0),
    .D1(D1),
    .D2(D2),
    .D3(D3),
    .D4(D4),
    .D5(D5),
    .D6(D6),
    .D7(D7),
    .S0(S0),
    .S1(S1),
    .S2(S2)
);

initial begin
    // Initialize inputs
    D0 = 0; D1 = 0; D2 = 0; D3 = 0; D4 = 0; D5 = 0; D6 = 0; D7 = 0;
    S0 = 0; S1 = 0; S2 = 0;

    // Test all combinations of S0, S1, S2
    // Set data inputs
    D0 = 1; D1 = 0; D2 = 1; D3 = 0; D4 = 1; D5 = 0; D6 = 1; D7 = 0;

    // Test case for S = 000
    S0 = 0; S1 = 0; S2 = 0; #10;
    if (out !== D0) $display("FAIL: Expected %b, got %b for S=000", D0, out);

    // Test case for S = 001
    S0 = 1; S1 = 0; S2 = 0; #10;
    if (out !== D1) $display("FAIL: Expected %b, got %b for S=001", D1, out);

    // Test case for S = 010
    S0 = 0; S1 = 1; S2 = 0; #10;
    if (out !== D2) $display("FAIL: Expected %b, got %b for S=010", D2, out);

    // Test case for S = 011
    S0 = 1; S1 = 1; S2 = 0; #10;
    if (out !== D3) $display("FAIL: Expected %b, got %b for S=011", D3, out);

    // Test case for S = 100
    S0 = 0; S1 = 0; S2 = 1; #10;
    if (out !== D4) $display("FAIL: Expected %b, got %b for S=100", D4, out);

    // Test case for S = 101
    S0 = 1; S1 = 0; S2 = 1; #10;
    if (out !== D5) $display("FAIL: Expected %b, got %b for S=101", D5, out);

    // Test case for S = 110
    S0 = 0; S1 = 1; S2 = 1; #10;
    if (out !== D6) $display("FAIL: Expected %b, got %b for S=110", D6, out);

    // Test case for S = 111
    S0 = 1; S1 = 1; S2 = 1; #10;
    if (out !== D7) $display("FAIL: Expected %b, got %b for S=111", D7, out);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule