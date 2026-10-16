`timescale 1ns/1ps

module tb_Mux8by1B;

reg i0, i1, i2, i3, i4, i5, i6, i7;
reg [2:0] s;
wire out;

// Instantiate the Mux8by1B module
Mux8by1B uut (
    .out(out),
    .s(s),
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3),
    .i4(i4),
    .i5(i5),
    .i6(i6),
    .i7(i7)
);

initial begin
    // Initialize inputs
    i0 = 0; i1 = 1; i2 = 0; i3 = 1; 
    i4 = 0; i5 = 1; i6 = 0; i7 = 1;

    // Test all select lines
    s = 3'b000; #10; if (out !== i0) $display("FAIL: Expected %b, got %b for s=%b", i0, out, s);
    s = 3'b001; #10; if (out !== i1) $display("FAIL: Expected %b, got %b for s=%b", i1, out, s);
    s = 3'b010; #10; if (out !== i2) $display("FAIL: Expected %b, got %b for s=%b", i2, out, s);
    s = 3'b011; #10; if (out !== i3) $display("FAIL: Expected %b, got %b for s=%b", i3, out, s);
    s = 3'b100; #10; if (out !== i4) $display("FAIL: Expected %b, got %b for s=%b", i4, out, s);
    s = 3'b101; #10; if (out !== i5) $display("FAIL: Expected %b, got %b for s=%b", i5, out, s);
    s = 3'b110; #10; if (out !== i6) $display("FAIL: Expected %b, got %b for s=%b", i6, out, s);
    s = 3'b111; #10; if (out !== i7) $display("FAIL: Expected %b, got %b for s=%b", i7, out, s);

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule