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

    // Test case 1: Select D0
    D0 = 1; D1 = 0; D2 = 0; D3 = 0; D4 = 0; D5 = 0; D6 = 0; D7 = 0;
    S0 = 0; S1 = 0; S2 = 0; #10;
    if (out !== D0) $display("FAIL: Expected out = %b, got out = %b", D0, out);

    // Test case 2: Select D1
    D0 = 0; D1 = 1; D2 = 0; D3 = 0; D4 = 0; D5 = 0; D6 = 0; D7 = 0;
    S0 = 1; S1 = 0; S2 = 0; #10;
    if (out !== D1) $display("FAIL: Expected out = %b, got out = %b", D1, out);

    // Test case 3: Select D2
    D0 = 0; D1 = 0; D2 = 1; D3 = 0; D4 = 0; D5 = 0; D6 = 0; D7 = 0;
    S0 = 0; S1 = 1; S2 = 0; #10;
    if (out !== D2) $display("FAIL: Expected out = %b, got out = %b", D2, out);

    // Test case 4: Select D3
    D0 = 0; D1 = 0; D2 = 0; D3 = 1; D4 = 0; D5 = 0; D6 = 0; D7 = 0;
    S0 = 1; S1 = 1; S2 = 0; #10;
    if (out !== D3) $display("FAIL: Expected out = %b, got out = %b", D3, out);

    // Test case 5: Select D4
    D0 = 0; D1 = 0; D2 = 0; D3 = 0; D4 = 1; D5 = 0; D6 = 0; D7 = 0;
    S0 = 0; S1 = 0; S2 = 1; #10;
    if (out !== D4) $display("FAIL: Expected out = %b, got out = %b", D4, out);

    // Test case 6: Select D5
    D0 = 0; D1 = 0; D2 = 0; D3 = 0; D4 = 0; D5 = 1; D6 = 0; D7 = 0;
    S0 = 1; S1 = 0; S2 = 1; #10;
    if (out !== D5) $display("FAIL: Expected out = %b, got out = %b", D5, out);

    // Test case 7: Select D6
    D0 = 0; D1 = 0; D2 = 0; D3 = 0; D4 = 0; D5 = 0; D6 = 1; D7 = 0;
    S0 = 0; S1 = 1; S2 = 1; #10;
    if (out !== D6) $display("FAIL: Expected out = %b, got out = %b", D6, out);

    // Test case 8: Select D7
    D0 = 0; D1 = 0; D2 = 0; D3 = 0; D4 = 0; D5 = 0; D6 = 0; D7 = 1;
    S0 = 1; S1 = 1; S2 = 1; #10;
    if (out !== D7) $display("FAIL: Expected out = %b, got out = %b", D7, out);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule