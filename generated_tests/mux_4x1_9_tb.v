`timescale 1ns/1ps

module tb_mux_4x1;

reg [3:0] in1;
reg [3:0] in2;
reg [3:0] in3;
reg [3:0] in4;
reg [1:0] select;
wire [3:0] op;

mux_4x1 uut (
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .select(select),
    .op(op)
);

initial begin
    // Test case 1: Select in1
    in1 = 4'b0001; in2 = 4'b0010; in3 = 4'b0011; in4 = 4'b0100; select = 2'b00;
    #10;
    if (op !== in1) $display("FAIL: Test case 1 failed, expected %b, got %b", in1, op);

    // Test case 2: Select in2
    select = 2'b01;
    #10;
    if (op !== in2) $display("FAIL: Test case 2 failed, expected %b, got %b", in2, op);

    // Test case 3: Select in3
    select = 2'b10;
    #10;
    if (op !== in3) $display("FAIL: Test case 3 failed, expected %b, got %b", in3, op);

    // Test case 4: Select in4
    select = 2'b11;
    #10;
    if (op !== in4) $display("FAIL: Test case 4 failed, expected %b, got %b", in4, op);

    $display("PASS");
    $finish;
end

endmodule