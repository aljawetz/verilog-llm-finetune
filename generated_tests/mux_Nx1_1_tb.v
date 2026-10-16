`timescale 1ns/1ps

module tb_mux_Nx1;

parameter N = 5;
reg [N-1:0] I;
reg [$clog2(N)-1:0] S;
wire O;

mux_Nx1 #(N) uut (.I(I), .S(S), .O(O));

initial begin
    // Test case 1: Select the first input
    I = 5'b10101; // Inputs: 1, 0, 1, 0, 1
    S = 3'b000;   // Select input 0
    #10;
    if (O !== I[0]) begin
        $display("FAIL: Test case 1 failed, expected O = %b, got O = %b", I[0], O);
        $finish;
    end

    // Test case 2: Select the second input
    S = 3'b001;   // Select input 1
    #10;
    if (O !== I[1]) begin
        $display("FAIL: Test case 2 failed, expected O = %b, got O = %b", I[1], O);
        $finish;
    end

    // Test case 3: Select the third input
    S = 3'b010;   // Select input 2
    #10;
    if (O !== I[2]) begin
        $display("FAIL: Test case 3 failed, expected O = %b, got O = %b", I[2], O);
        $finish;
    end

    // Test case 4: Select the fourth input
    S = 3'b011;   // Select input 3
    #10;
    if (O !== I[3]) begin
        $display("FAIL: Test case 4 failed, expected O = %b, got O = %b", I[3], O);
        $finish;
    end

    // Test case 5: Select the fifth input
    S = 3'b100;   // Select input 4
    #10;
    if (O !== I[4]) begin
        $display("FAIL: Test case 5 failed, expected O = %b, got O = %b", I[4], O);
        $finish;
    end

    // Test case 6: Select an out-of-bounds input
    S = 3'b101;   // Invalid select
    #10;
    if (O !== 1'b0) begin
        $display("FAIL: Test case 6 failed, expected O = 0, got O = %b", O);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule