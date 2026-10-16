`timescale 1ns/1ps

module tb_Mux8by1B;

reg i0, i1, i2, i3, i4, i5, i6, i7;
reg [2:0] s;
wire out;

// Instantiate the module under test (uut)
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
    i0 = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0;
    s = 3'b000;

    // Test all inputs
    i0 = 1; s = 3'b000; #10; if (out !== i0) $display("FAIL: Test case 0 failed");
    i1 = 1; s = 3'b001; #10; if (out !== i1) $display("FAIL: Test case 1 failed");
    i2 = 1; s = 3'b010; #10; if (out !== i2) $display("FAIL: Test case 2 failed");
    i3 = 1; s = 3'b011; #10; if (out !== i3) $display("FAIL: Test case 3 failed");
    i4 = 1; s = 3'b100; #10; if (out !== i4) $display("FAIL: Test case 4 failed");
    i5 = 1; s = 3'b101; #10; if (out !== i5) $display("FAIL: Test case 5 failed");
    i6 = 1; s = 3'b110; #10; if (out !== i6) $display("FAIL: Test case 6 failed");
    i7 = 1; s = 3'b111; #10; if (out !== i7) $display("FAIL: Test case 7 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule