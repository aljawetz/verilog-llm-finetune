`timescale 1ns/1ps

module tb_mux_Nx1;

parameter N = 5;
reg [N-1:0] I;
reg [$clog2(N)-1:0] S;
wire O;

mux_Nx1 #(N) uut (.I(I), .S(S), .O(O));

initial begin
    // Test case 1: Select valid input
    I = 5'b10101; // Input values
    S = 3'b000;   // Select input 0
    #10;
    if (O !== I[0]) begin
        $display("FAIL: Expected O = %b, got O = %b", I[0], O);
        $finish;
    end

    // Test case 2: Select another valid input
    S = 3'b010;   // Select input 2
    #10;
    if (O !== I[2]) begin
        $display("FAIL: Expected O = %b, got O = %b", I[2], O);
        $finish;
    end

    // Test case 3: Select out of range
    S = 3'b101;   // Select input 5 (out of range)
    #10;
    if (O !== 1'b0) begin
        $display("FAIL: Expected O = 0, got O = %b", O);
        $finish;
    end

    // Test case 4: Select another out of range
    S = 3'b111;   // Select input 7 (out of range)
    #10;
    if (O !== 1'b0) begin
        $display("FAIL: Expected O = 0, got O = %b", O);
        $finish;
    end

    // Test case 5: Select the last valid input
    S = 3'b100;   // Select input 4
    #10;
    if (O !== I[4]) begin
        $display("FAIL: Expected O = %b, got O = %b", I[4], O);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule