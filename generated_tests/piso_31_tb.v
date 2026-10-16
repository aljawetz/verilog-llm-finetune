`timescale 1ns/1ps

module tb_piso;

reg [3:0] pi;
reg clk;
reg clr;
reg sel;
wire so;

piso uut (
    .pi(pi),
    .clk(clk),
    .clr(clr),
    .sel(sel),
    .so(so)
);

initial begin
    // Initialize signals
    clk = 0;
    clr = 0;
    sel = 0;
    pi = 4'b0000;

    // Test case 1: Clear the register
    clr = 1; #10;
    if (uut.data !== 4'b0000) begin
        $display("FAIL: Clear did not reset data to zero");
        $finish;
    end

    // Test case 2: Load data into the register
    clr = 0; sel = 0; pi = 4'b1010; #10;
    if (uut.data !== 4'b1010) begin
        $display("FAIL: Load did not set data to pi value");
        $finish;
    end

    // Test case 3: Shift out bits
    sel = 1; #10;
    if (so !== 1'b0) begin
        $display("FAIL: First shifted out bit is incorrect");
        $finish;
    end

    #10;
    if (so !== 1'b1) begin
        $display("FAIL: Second shifted out bit is incorrect");
        $finish;
    end

    #10;
    if (so !== 1'b0) begin
        $display("FAIL: Third shifted out bit is incorrect");
        $finish;
    end

    #10;
    if (so !== 1'b1) begin
        $display("FAIL: Fourth shifted out bit is incorrect");
        $finish;
    end

    // Test case 4: Ensure data is zero after all bits shifted out
    #10;
    if (uut.data !== 4'b0000) begin
        $display("FAIL: Data did not reset to zero after shifting all bits out");
        $finish;
    end

    $display("PASS");
    $finish;
end

always #5 clk = ~clk; // Clock generation

endmodule