`timescale 1ns/1ps

module tb_mux8x1;

reg [3:0] a1, a2, a3, a4, a5, a6, a7, a8;
reg [2:0] sel;
wire [3:0] out;

// Instantiate the module under test (uut)
mux8x1 uut (
    .a1(a1),
    .a2(a2),
    .a3(a3),
    .a4(a4),
    .a5(a5),
    .a6(a6),
    .a7(a7),
    .a8(a8),
    .sel(sel),
    .out(out)
);

initial begin
    // Initialize inputs
    a1 = 4'b0001; a2 = 4'b0010; a3 = 4'b0011; a4 = 4'b0100;
    a5 = 4'b0101; a6 = 4'b0110; a7 = 4'b0111; a8 = 4'b1000;

    // Test all select lines
    sel = 3'b000; #10; if (out !== a1) $display("FAIL: Expected %b, got %b for sel=%b", a1, out, sel);
    sel = 3'b001; #10; if (out !== a2) $display("FAIL: Expected %b, got %b for sel=%b", a2, out, sel);
    sel = 3'b010; #10; if (out !== a3) $display("FAIL: Expected %b, got %b for sel=%b", a3, out, sel);
    sel = 3'b011; #10; if (out !== a4) $display("FAIL: Expected %b, got %b for sel=%b", a4, out, sel);
    sel = 3'b100; #10; if (out !== a5) $display("FAIL: Expected %b, got %b for sel=%b", a5, out, sel);
    sel = 3'b101; #10; if (out !== a6) $display("FAIL: Expected %b, got %b for sel=%b", a6, out, sel);
    sel = 3'b110; #10; if (out !== a7) $display("FAIL: Expected %b, got %b for sel=%b", a7, out, sel);
    sel = 3'b111; #10; if (out !== a8) $display("FAIL: Expected %b, got %b for sel=%b", a8, out, sel);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule