`timescale 1ns/1ps

module tb_mux_4x1;

reg [3:0] in;
reg [1:0] sel;
wire y;

// Instantiate the module under test
mux_4x1 uut (
    .y(y),
    .in(in),
    .sel(sel)
);

initial begin
    // Test case 1: Select input 0
    in = 4'b0001; sel = 2'b00; #10;
    if (y !== 1'b1) $display("FAIL: Test case 1 failed, expected y=1, got y=%b", y);

    // Test case 2: Select input 1
    in = 4'b0010; sel = 2'b01; #10;
    if (y !== 1'b1) $display("FAIL: Test case 2 failed, expected y=1, got y=%b", y);

    // Test case 3: Select input 2
    in = 4'b0100; sel = 2'b10; #10;
    if (y !== 1'b1) $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);

    // Test case 4: Select input 3
    in = 4'b1000; sel = 2'b11; #10;
    if (y !== 1'b1) $display("FAIL: Test case 4 failed, expected y=1, got y=%b", y);

    // Test case 5: All inputs low
    in = 4'b0000; sel = 2'b00; #10;
    if (y !== 1'b0) $display("FAIL: Test case 5 failed, expected y=0, got y=%b", y);

    // Test case 6: All inputs low with different select
    in = 4'b0000; sel = 2'b11; #10;
    if (y !== 1'b0) $display("FAIL: Test case 6 failed, expected y=0, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule