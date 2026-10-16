`timescale 1ns/1ps

module tb_Logarithmic_Converter;

parameter DataIN_width = 16;
parameter truncation_width = 6;
parameter DataK_width = 4;

reg [DataK_width-1:0] LC_K;
reg [truncation_width:0] LC_X;
wire [DataK_width+truncation_width:0] LC_OP;

Logarithmic_Converter #(DataIN_width, truncation_width, DataK_width) uut (
    .LC_K(LC_K),
    .LC_X(LC_X),
    .LC_OP(LC_OP)
);

initial begin
    // Test case 1
    LC_K = 4'b0001; // Index of first one
    LC_X = 6'b000011; // Fraction part
    #10;
    if (LC_OP !== {LC_K, LC_X}) begin
        $display("FAIL: Test case 1 failed, expected %b, got %b", {LC_K, LC_X}, LC_OP);
        $finish;
    end

    // Test case 2
    LC_K = 4'b0010; // Index of first one
    LC_X = 6'b000101; // Fraction part
    #10;
    if (LC_OP !== {LC_K, LC_X}) begin
        $display("FAIL: Test case 2 failed, expected %b, got %b", {LC_K, LC_X}, LC_OP);
        $finish;
    end

    // Test case 3
    LC_K = 4'b1111; // Index of first one
    LC_X = 6'b111111; // Fraction part
    #10;
    if (LC_OP !== {LC_K, LC_X}) begin
        $display("FAIL: Test case 3 failed, expected %b, got %b", {LC_K, LC_X}, LC_OP);
        $finish;
    end

    // Test case 4
    LC_K = 4'b0000; // Index of first one
    LC_X = 6'b000000; // Fraction part
    #10;
    if (LC_OP !== {LC_K, LC_X}) begin
        $display("FAIL: Test case 4 failed, expected %b, got %b", {LC_K, LC_X}, LC_OP);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule