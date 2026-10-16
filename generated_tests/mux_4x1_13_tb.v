`timescale 1ns/1ps

module tb_mux_4x1;

reg I0, I1, I2, I3;
reg [1:0] S;
wire O;

// Instantiate the module under test (uut)
mux_4x1 uut (
    .I0(I0),
    .I1(I1),
    .I2(I2),
    .I3(I3),
    .S(S),
    .O(O)
);

initial begin
    // Initialize inputs
    I0 = 0; I1 = 0; I2 = 0; I3 = 0; S = 2'b00;

    // Test case 1: Select I0
    I0 = 1; I1 = 0; I2 = 0; I3 = 0; S = 2'b00;
    #10;
    if (O !== I0) $display("FAIL: Test case 1 failed, expected O = %b, got O = %b", I0, O);

    // Test case 2: Select I1
    I0 = 0; I1 = 1; I2 = 0; I3 = 0; S = 2'b01;
    #10;
    if (O !== I1) $display("FAIL: Test case 2 failed, expected O = %b, got O = %b", I1, O);

    // Test case 3: Select I2
    I0 = 0; I1 = 0; I2 = 1; I3 = 0; S = 2'b10;
    #10;
    if (O !== I2) $display("FAIL: Test case 3 failed, expected O = %b, got O = %b", I2, O);

    // Test case 4: Select I3
    I0 = 0; I1 = 0; I2 = 0; I3 = 1; S = 2'b11;
    #10;
    if (O !== I3) $display("FAIL: Test case 4 failed, expected O = %b, got O = %b", I3, O);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule