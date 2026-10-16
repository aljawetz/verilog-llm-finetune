`timescale 1ns/1ps

module tb_mac_2;

parameter DATA_WIDTH = 2;
reg [DATA_WIDTH - 1 : 0] a, b, c;
wire [DATA_WIDTH - 1 : 0] out;

mac_2 #(.DATA_WIDTH(DATA_WIDTH)) uut (
    .a(a),
    .b(b),
    .c(c),
    .out(out)
);

initial begin
    // Test case 1: Basic multiplication and addition
    a = 2'b01; b = 2'b10; c = 2'b00; #10;
    if (out !== (a * b + c)) $display("FAIL: Test case 1 failed, expected %b, got %b", (a * b + c), out);

    // Test case 2: Check with different values
    a = 2'b11; b = 2'b01; c = 2'b01; #10;
    if (out !== (a * b + c)) $display("FAIL: Test case 2 failed, expected %b, got %b", (a * b + c), out);

    // Test case 3: Check with zero
    a = 2'b00; b = 2'b11; c = 2'b10; #10;
    if (out !== (a * b + c)) $display("FAIL: Test case 3 failed, expected %b, got %b", (a * b + c), out);

    // Test case 4: Maximum values
    a = 2'b11; b = 2'b11; c = 2'b11; #10;
    if (out !== (a * b + c)) $display("FAIL: Test case 4 failed, expected %b, got %b", (a * b + c), out);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule