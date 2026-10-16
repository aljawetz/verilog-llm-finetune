`timescale 1ns/1ps

module tb_m81;

reg I0, I1, I2, I3, I4, I5, I6, I7;
reg S0, S1, S2;
wire out;

// Instantiate the module under test
m81 uut (
    .out(out),
    .I0(I0),
    .I1(I1),
    .I2(I2),
    .I3(I3),
    .I4(I4),
    .I5(I5),
    .I6(I6),
    .I7(I7),
    .S0(S0),
    .S1(S1),
    .S2(S2)
);

initial begin
    // Test all combinations of inputs and select lines
    I0 = 1'b0; I1 = 1'b0; I2 = 1'b0; I3 = 1'b0; 
    I4 = 1'b0; I5 = 1'b0; I6 = 1'b0; I7 = 1'b0;

    // Test case 1: Select I0
    S0 = 1'b0; S1 = 1'b0; S2 = 1'b0; #10;
    if (out !== I0) $display("FAIL: Expected out = %b, got out = %b", I0, out);

    // Test case 2: Select I1
    I1 = 1'b1; #10;
    S0 = 1'b1; S1 = 1'b0; S2 = 1'b0; #10;
    if (out !== I1) $display("FAIL: Expected out = %b, got out = %b", I1, out);

    // Test case 3: Select I2
    I2 = 1'b1; #10;
    S0 = 1'b0; S1 = 1'b1; S2 = 1'b0; #10;
    if (out !== I2) $display("FAIL: Expected out = %b, got out = %b", I2, out);

    // Test case 4: Select I3
    I3 = 1'b1; #10;
    S0 = 1'b1; S1 = 1'b1; S2 = 1'b0; #10;
    if (out !== I3) $display("FAIL: Expected out = %b, got out = %b", I3, out);

    // Test case 5: Select I4
    I4 = 1'b1; #10;
    S0 = 1'b0; S1 = 1'b0; S2 = 1'b1; #10;
    if (out !== I4) $display("FAIL: Expected out = %b, got out = %b", I4, out);

    // Test case 6: Select I5
    I5 = 1'b1; #10;
    S0 = 1'b1; S1 = 1'b0; S2 = 1'b1; #10;
    if (out !== I5) $display("FAIL: Expected out = %b, got out = %b", I5, out);

    // Test case 7: Select I6
    I6 = 1'b1; #10;
    S0 = 1'b0; S1 = 1'b1; S2 = 1'b1; #10;
    if (out !== I6) $display("FAIL: Expected out = %b, got out = %b", I6, out);

    // Test case 8: Select I7
    I7 = 1'b1; #10;
    S0 = 1'b1; S1 = 1'b1; S2 = 1'b1; #10;
    if (out !== I7) $display("FAIL: Expected out = %b, got out = %b", I7, out);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule