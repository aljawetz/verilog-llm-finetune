`timescale 1ns/1ps

module tb_demux_8x1;

reg a;
reg [2:0] sel;
wire y0, y1, y2, y3, y4, y5, y6, y7;

// Instantiate the module under test (uut)
demux_8x1 uut (
    .a(a),
    .sel(sel),
    .y0(y0),
    .y1(y1),
    .y2(y2),
    .y3(y3),
    .y4(y4),
    .y5(y5),
    .y6(y6),
    .y7(y7)
);

initial begin
    // Test case 1: Select y0
    a = 1'b1; sel = 3'b000; #10;
    if (y0 !== 1'b1 || y1 !== 1'b0 || y2 !== 1'b0 || y3 !== 1'b0 || 
        y4 !== 1'b0 || y5 !== 1'b0 || y6 !== 1'b0 || y7 !== 1'b0) 
    begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Select y1
    a = 1'b1; sel = 3'b001; #10;
    if (y0 !== 1'b0 || y1 !== 1'b1 || y2 !== 1'b0 || y3 !== 1'b0 || 
        y4 !== 1'b0 || y5 !== 1'b0 || y6 !== 1'b0 || y7 !== 1'b0) 
    begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Select y2
    a = 1'b1; sel = 3'b010; #10;
    if (y0 !== 1'b0 || y1 !== 1'b0 || y2 !== 1'b1 || y3 !== 1'b0 || 
        y4 !== 1'b0 || y5 !== 1'b0 || y6 !== 1'b0 || y7 !== 1'b0) 
    begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: Select y3
    a = 1'b1; sel = 3'b011; #10;
    if (y0 !== 1'b0 || y1 !== 1'b0 || y2 !== 1'b0 || y3 !== 1'b1 || 
        y4 !== 1'b0 || y5 !== 1'b0 || y6 !== 1'b0 || y7 !== 1'b0) 
    begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: Select y4
    a = 1'b1; sel = 3'b100; #10;
    if (y0 !== 1'b0 || y1 !== 1'b0 || y2 !== 1'b0 || y3 !== 1'b0 || 
        y4 !== 1'b1 || y5 !== 1'b0 || y6 !== 1'b0 || y7 !== 1'b0) 
    begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: Select y5
    a = 1'b1; sel = 3'b101; #10;
    if (y0 !== 1'b0 || y1 !== 1'b0 || y2 !== 1'b0 || y3 !== 1'b0 || 
        y4 !== 1'b0 || y5 !== 1'b1 || y6 !== 1'b0 || y7 !== 1'b0) 
    begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    // Test case 7: Select y6
    a = 1'b1; sel = 3'b110; #10;
    if (y0 !== 1'b0 || y1 !== 1'b0 || y2 !== 1'b0 || y3 !== 1'b0 || 
        y4 !== 1'b0 || y5 !== 1'b0 || y6 !== 1'b1 || y7 !== 1'b0) 
    begin
        $display("FAIL: Test case 7 failed");
        $finish;
    end

    // Test case 8: Select y7
    a = 1'b1; sel = 3'b111; #10;
    if (y0 !== 1'b0 || y1 !== 1'b0 || y2 !== 1'b0 || y3 !== 1'b0 || 
        y4 !== 1'b0 || y5 !== 1'b0 || y6 !== 1'b0 || y7 !== 1'b1) 
    begin
        $display("FAIL: Test case 8 failed");
        $finish;
    end

    // Test case 9: Check all outputs are zero when a is 0
    a = 1'b0; sel = 3'b000; #10;
    if (y0 !== 1'b0 || y1 !== 1'b0 || y2 !== 1'b0 || y3 !== 1'b0 || 
        y4 !== 1'b0 || y5 !== 1'b0 || y6 !== 1'b0 || y7 !== 1'b0) 
    begin
        $display("FAIL: Test case 9 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule