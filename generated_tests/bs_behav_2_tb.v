`timescale 1ns/1ps

module tb_bs_behav;

reg [7:0] a;
reg [2:0] s;
wire [7:0] y;

// Instantiate the module under test (uut)
bs_behav uut (
    .a(a),
    .s(s),
    .y(y)
);

initial begin
    // Test case 1: No shift
    a = 8'b10101010; s = 3'b000; #10;
    if (y !== 8'b10101010) $display("FAIL: Test case 1 failed");

    // Test case 2: Shift right by 1
    a = 8'b10101010; s = 3'b001; #10;
    if (y !== 8'b01010101) $display("FAIL: Test case 2 failed");

    // Test case 3: Shift right by 2
    a = 8'b10101010; s = 3'b010; #10;
    if (y !== 8'b00101010) $display("FAIL: Test case 3 failed");

    // Test case 4: Shift right by 3
    a = 8'b10101010; s = 3'b011; #10;
    if (y !== 8'b00010101) $display("FAIL: Test case 4 failed");

    // Test case 5: Shift right by 4
    a = 8'b10101010; s = 3'b100; #10;
    if (y !== 8'b10101010) $display("FAIL: Test case 5 failed");

    // Test case 6: Shift right by 5
    a = 8'b10101010; s = 3'b101; #10;
    if (y !== 8'b01010101) $display("FAIL: Test case 6 failed");

    // Test case 7: Shift right by 6
    a = 8'b10101010; s = 3'b110; #10;
    if (y !== 8'b10101000) $display("FAIL: Test case 7 failed");

    // Test case 8: Shift right by 7
    a = 8'b10101010; s = 3'b111; #10;
    if (y !== 8'b01010101) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule