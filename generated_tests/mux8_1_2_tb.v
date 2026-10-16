`timescale 1ns/1ps

module tb_mux8_1;

reg s0, s1, s2;
reg i0, i1, i2, i3, i4, i5, i6, i7;
wire out;

// Instantiate the module under test
mux8_1 uut (
    .s0(s0),
    .s1(s1),
    .s2(s2),
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3),
    .i4(i4),
    .i5(i5),
    .i6(i6),
    .i7(i7),
    .out(out)
);

initial begin
    // Test inputs
    i0 = 1'b0; i1 = 1'b1; i2 = 1'b0; i3 = 1'b1;
    i4 = 1'b0; i5 = 1'b1; i6 = 1'b0; i7 = 1'b1;

    // Test case 1: Select i0
    {s2, s1, s0} = 3'b000; #10;
    if (out !== i0) $display("FAIL: Expected %b, got %b for select %b", i0, out, {s2, s1, s0});

    // Test case 2: Select i1
    {s2, s1, s0} = 3'b001; #10;
    if (out !== i1) $display("FAIL: Expected %b, got %b for select %b", i1, out, {s2, s1, s0});

    // Test case 3: Select i2
    {s2, s1, s0} = 3'b010; #10;
    if (out !== i2) $display("FAIL: Expected %b, got %b for select %b", i2, out, {s2, s1, s0});

    // Test case 4: Select i3
    {s2, s1, s0} = 3'b011; #10;
    if (out !== i3) $display("FAIL: Expected %b, got %b for select %b", i3, out, {s2, s1, s0});

    // Test case 5: Select i4
    {s2, s1, s0} = 3'b100; #10;
    if (out !== i4) $display("FAIL: Expected %b, got %b for select %b", i4, out, {s2, s1, s0});

    // Test case 6: Select i5
    {s2, s1, s0} = 3'b101; #10;
    if (out !== i5) $display("FAIL: Expected %b, got %b for select %b", i5, out, {s2, s1, s0});

    // Test case 7: Select i6
    {s2, s1, s0} = 3'b110; #10;
    if (out !== i6) $display("FAIL: Expected %b, got %b for select %b", i6, out, {s2, s1, s0});

    // Test case 8: Select i7
    {s2, s1, s0} = 3'b111; #10;
    if (out !== i7) $display("FAIL: Expected %b, got %b for select %b", i7, out, {s2, s1, s0});

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule