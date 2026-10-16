`timescale 1ns/1ps

module tb_expbot_muxpaed;

reg [3:0] ef;
wire [1:0] muxpaed_a, muxpaed_b, muxpaed_c;

// Instantiate the module under test (uut)
expbot_muxpaed uut (
    .ef(ef),
    .muxpaed_a(muxpaed_a),
    .muxpaed_b(muxpaed_b),
    .muxpaed_c(muxpaed_c)
);

initial begin
    // Test case 1: ef = 4'h4
    ef = 4'h4;
    #10;
    if (muxpaed_a !== 2'h3) $display("FAIL: muxpaed_a should be 2'h3 when ef is 4'h4");
    if (muxpaed_b !== 2'h3) $display("FAIL: muxpaed_b should be 2'h3 when ef is 4'h4");
    if (muxpaed_c !== 2'h3) $display("FAIL: muxpaed_c should be 2'h3 when ef is 4'h4");

    // Test case 2: ef = 4'h8
    ef = 4'h8;
    #10;
    if (muxpaed_a !== 2'h0) $display("FAIL: muxpaed_a should be 2'h0 when ef is 4'h8");
    if (muxpaed_b !== 2'h2) $display("FAIL: muxpaed_b should be 2'h2 when ef is 4'h8");
    if (muxpaed_c !== 2'h1) $display("FAIL: muxpaed_c should be 2'h1 when ef is 4'h8");

    // Test case 3: ef = 4'h0
    ef = 4'h0;
    #10;
    if (muxpaed_a !== 2'h1) $display("FAIL: muxpaed_a should be 2'h1 when ef is 4'h0");
    if (muxpaed_b !== 2'h1) $display("FAIL: muxpaed_b should be 2'h1 when ef is 4'h0");
    if (muxpaed_c !== 2'h1) $display("FAIL: muxpaed_c should be 2'h1 when ef is 4'h0");

    // Test case 4: ef = 4'hF
    ef = 4'hF;
    #10;
    if (muxpaed_a !== 2'h1) $display("FAIL: muxpaed_a should be 2'h1 when ef is 4'hF");
    if (muxpaed_b !== 2'h1) $display("FAIL: muxpaed_b should be 2'h1 when ef is 4'hF");
    if (muxpaed_c !== 2'h1) $display("FAIL: muxpaed_c should be 2'h1 when ef is 4'hF");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule