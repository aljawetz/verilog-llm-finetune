`timescale 1ns/1ps

module tb_mux;

reg [3:0] A;
reg [3:0] B;
reg [3:0] C;
reg [3:0] D;
reg [1:0] S;
wire [3:0] Y;

mux uut (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .S(S),
    .Y(Y)
);

initial begin
    // Test case 1: Select A
    A = 4'b0001; B = 4'b0010; C = 4'b0011; D = 4'b0100; S = 2'b00;
    #10;
    if (Y !== A) $display("FAIL: Test case 1 failed, expected Y = %b, got Y = %b", A, Y);

    // Test case 2: Select B
    S = 2'b01;
    #10;
    if (Y !== B) $display("FAIL: Test case 2 failed, expected Y = %b, got Y = %b", B, Y);

    // Test case 3: Select C
    S = 2'b10;
    #10;
    if (Y !== C) $display("FAIL: Test case 3 failed, expected Y = %b, got Y = %b", C, Y);

    // Test case 4: Select D
    S = 2'b11;
    #10;
    if (Y !== D) $display("FAIL: Test case 4 failed, expected Y = %b, got Y = %b", D, Y);

    // Test case 5: Default case (not applicable in this design, but for completeness)
    S = 2'bxx; // Invalid select
    #10;
    if (Y !== 4'bxxxx) $display("FAIL: Test case 5 failed, expected Y = xxxx, got Y = %b", Y);

    $display("PASS");
    $finish;
end

endmodule