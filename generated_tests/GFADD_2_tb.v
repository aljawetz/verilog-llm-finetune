`timescale 1ns/1ps

module tb_GFADD;

reg [7:0] in1;
reg [7:0] in2;
wire [7:0] out;

// Instantiate the module under test (uut)
GFADD uut (
    .in1(in1),
    .in2(in2),
    .out(out)
);

initial begin
    // Test case 1: 0 + 0 = 0
    in1 = 8'b00000000; 
    in2 = 8'b00000000; 
    #10;
    if (out !== 8'b00000000) $display("FAIL: Test case 1 failed");

    // Test case 2: 1 + 1 = 0
    in1 = 8'b00000001; 
    in2 = 8'b00000001; 
    #10;
    if (out !== 8'b00000000) $display("FAIL: Test case 2 failed");

    // Test case 3: 1 + 2 = 3
    in1 = 8'b00000001; 
    in2 = 8'b00000010; 
    #10;
    if (out !== 8'b00000011) $display("FAIL: Test case 3 failed");

    // Test case 4: 255 + 1 = 254
    in1 = 8'b11111111; 
    in2 = 8'b00000001; 
    #10;
    if (out !== 8'b11111110) $display("FAIL: Test case 4 failed");

    // Test case 5: 170 + 85 = 255
    in1 = 8'b10101010; 
    in2 = 8'b01010101; 
    #10;
    if (out !== 8'b11111111) $display("FAIL: Test case 5 failed");

    // Test case 6: 0 + 255 = 255
    in1 = 8'b00000000; 
    in2 = 8'b11111111; 
    #10;
    if (out !== 8'b11111111) $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule