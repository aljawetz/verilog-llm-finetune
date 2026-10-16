`timescale 1ns/1ps

module tb_decoder_3to8;

reg en;
reg x, y, z;
wire d0, d1, d2, d3, d4, d5, d6, d7;

// Instantiate the module under test (uut)
decoder_3to8 uut (
    .en(en),
    .x(x),
    .y(y),
    .z(z),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .d4(d4),
    .d5(d5),
    .d6(d6),
    .d7(d7)
);

initial begin
    // Initialize inputs
    en = 0; x = 0; y = 0; z = 0;

    // Test all combinations of x, y, z with enable
    en = 1;

    // Check for each combination
    #10; x = 0; y = 0; z = 0; #10; if ({d7, d6, d5, d4, d3, d2, d1, d0} !== 8'b00000001) $display("FAIL: Expected 00000001 for (0,0,0)");
    #10; x = 0; y = 0; z = 1; #10; if ({d7, d6, d5, d4, d3, d2, d1, d0} !== 8'b00000010) $display("FAIL: Expected 00000010 for (0,0,1)");
    #10; x = 0; y = 1; z = 0; #10; if ({d7, d6, d5, d4, d3, d2, d1, d0} !== 8'b00000100) $display("FAIL: Expected 00000100 for (0,1,0)");
    #10; x = 0; y = 1; z = 1; #10; if ({d7, d6, d5, d4, d3, d2, d1, d0} !== 8'b00001000) $display("FAIL: Expected 00001000 for (0,1,1)");
    #10; x = 1; y = 0; z = 0; #10; if ({d7, d6, d5, d4, d3, d2, d1, d0} !== 8'b00010000) $display("FAIL: Expected 00010000 for (1,0,0)");
    #10; x = 1; y = 0; z = 1; #10; if ({d7, d6, d5, d4, d3, d2, d1, d0} !== 8'b00100000) $display("FAIL: Expected 00100000 for (1,0,1)");
    #10; x = 1; y = 1; z = 0; #10; if ({d7, d6, d5, d4, d3, d2, d1, d0} !== 8'b01000000) $display("FAIL: Expected 01000000 for (1,1,0)");
    #10; x = 1; y = 1; z = 1; #10; if ({d7, d6, d5, d4, d3, d2, d1, d0} !== 8'b10000000) $display("FAIL: Expected 10000000 for (1,1,1)");

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule