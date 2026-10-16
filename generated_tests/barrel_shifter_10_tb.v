`timescale 1ns/1ps

module tb_barrel_shifter;

reg [7:0] a;
reg [2:0] range;
reg RL, RR;
wire [7:0] out;

// Instantiate the barrel shifter
barrel_shifter uut (
    .a(a),
    .range(range),
    .RL(RL),
    .RR(RR),
    .out(out)
);

initial begin
    // Test case 1: Rotate right by 1
    a = 8'b10101010; range = 3'b001; RL = 0; RR = 1;
    #10;
    if (out !== 8'b01010101) $display("FAIL: Test case 1 failed");

    // Test case 2: Rotate left by 1
    a = 8'b10101010; range = 3'b001; RL = 1; RR = 0;
    #10;
    if (out !== 8'b01010101) $display("FAIL: Test case 2 failed");

    // Test case 3: Rotate right by 3
    a = 8'b10101010; range = 3'b011; RL = 0; RR = 1;
    #10;
    if (out !== 8'b01010101) $display("FAIL: Test case 3 failed");

    // Test case 4: Rotate left by 3
    a = 8'b10101010; range = 3'b011; RL = 1; RR = 0;
    #10;
    if (out !== 8'b10101010) $display("FAIL: Test case 4 failed");

    // Test case 5: Rotate right by 7
    a = 8'b10101010; range = 3'b111; RL = 0; RR = 1;
    #10;
    if (out !== 8'b01010101) $display("FAIL: Test case 5 failed");

    // Test case 6: Rotate left by 7
    a = 8'b10101010; range = 3'b111; RL = 1; RR = 0;
    #10;
    if (out !== 8'b10101010) $display("FAIL: Test case 6 failed");

    // Test case 7: No rotation
    a = 8'b10101010; range = 3'b000; RL = 0; RR = 1;
    #10;
    if (out !== 8'b10101010) $display("FAIL: Test case 7 failed");

    // Test case 8: No rotation
    a = 8'b10101010; range = 3'b000; RL = 1; RR = 0;
    #10;
    if (out !== 8'b10101010) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule