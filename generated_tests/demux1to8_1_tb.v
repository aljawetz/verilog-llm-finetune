`timescale 1ns/1ps

module tb_demux1to8;

reg in;
reg [2:0] sel;
wire d0, d1, d2, d3, d4, d5, d6, d7;

// Instantiate the demux1to8 module
demux1to8 uut (
    .in(in),
    .sel(sel),
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
    // Test case 1: Select 0, input 1
    in = 1; sel = 3'b000;
    #10;
    if (d0 !== 1 || d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 0 || d5 !== 0 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 1 failed");
    
    // Test case 2: Select 1, input 1
    in = 1; sel = 3'b001;
    #10;
    if (d0 !== 0 || d1 !== 1 || d2 !== 0 || d3 !== 0 || d4 !== 0 || d5 !== 0 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 2 failed");

    // Test case 3: Select 2, input 1
    in = 1; sel = 3'b010;
    #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 1 || d3 !== 0 || d4 !== 0 || d5 !== 0 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 3 failed");

    // Test case 4: Select 3, input 1
    in = 1; sel = 3'b011;
    #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 1 || d4 !== 0 || d5 !== 0 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 4 failed");

    // Test case 5: Select 4, input 1
    in = 1; sel = 3'b100;
    #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 1 || d5 !== 0 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 5 failed");

    // Test case 6: Select 5, input 1
    in = 1; sel = 3'b101;
    #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 0 || d5 !== 1 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 6 failed");

    // Test case 7: Select 6, input 1
    in = 1; sel = 3'b110;
    #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 0 || d5 !== 0 || d6 !== 1 || d7 !== 0) 
        $display("FAIL: Test case 7 failed");

    // Test case 8: Select 7, input 1
    in = 1; sel = 3'b111;
    #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 0 || d5 !== 0 || d6 !== 0 || d7 !== 1) 
        $display("FAIL: Test case 8 failed");

    // Test case 9: Select 0, input 0
    in = 0; sel = 3'b000;
    #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 0 || d5 !== 0 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 9 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule