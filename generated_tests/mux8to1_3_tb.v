`timescale 1ns/1ps

module tb_mux8to1;

reg [7:0] I;
reg [2:0] sel;
wire y;

// Instantiate the module under test
mux8to1 uut (
    .I(I),
    .sel(sel),
    .y(y)
);

initial begin
    // Test case 1: Select I[0]
    I = 8'b10101010; sel = 3'b000; #10;
    if (y !== I[0]) $display("FAIL: Expected y = %b, got y = %b for sel = %b", I[0], y, sel);

    // Test case 2: Select I[1]
    sel = 3'b001; #10;
    if (y !== I[1]) $display("FAIL: Expected y = %b, got y = %b for sel = %b", I[1], y, sel);

    // Test case 3: Select I[2]
    sel = 3'b010; #10;
    if (y !== I[2]) $display("FAIL: Expected y = %b, got y = %b for sel = %b", I[2], y, sel);

    // Test case 4: Select I[3]
    sel = 3'b011; #10;
    if (y !== I[3]) $display("FAIL: Expected y = %b, got y = %b for sel = %b", I[3], y, sel);

    // Test case 5: Select I[4]
    sel = 3'b100; #10;
    if (y !== I[4]) $display("FAIL: Expected y = %b, got y = %b for sel = %b", I[4], y, sel);

    // Test case 6: Select I[5]
    sel = 3'b101; #10;
    if (y !== I[5]) $display("FAIL: Expected y = %b, got y = %b for sel = %b", I[5], y, sel);

    // Test case 7: Select I[6]
    sel = 3'b110; #10;
    if (y !== I[6]) $display("FAIL: Expected y = %b, got y = %b for sel = %b", I[6], y, sel);

    // Test case 8: Select I[7]
    sel = 3'b111; #10;
    if (y !== I[7]) $display("FAIL: Expected y = %b, got y = %b for sel = %b", I[7], y, sel);

    // Test case 9: Default case
    sel = 3'bxxx; #10; // Invalid selector
    if (y !== 1'b0) $display("FAIL: Expected y = 0, got y = %b for sel = %b", y, sel);

    $display("PASS");
    $finish;
end

endmodule