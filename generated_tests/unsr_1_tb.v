`timescale 1ns/1ps

module tb_unsr;

reg clr;
reg clk;
reg [1:0] sel;
reg [3:0] parin;
wire [3:0] out;

unsr uut (
    .clr(clr),
    .clk(clk),
    .sel(sel),
    .parin(parin),
    .out(out)
);

initial begin
    // Initialize signals
    clk = 0;
    clr = 0;
    sel = 2'b00;
    parin = 4'b0000;

    // Test sequence
    // Test 1: Reset functionality
    clr = 1; #10;
    if (out !== 4'b0000) begin
        $display("FAIL: Reset did not clear output");
        $finish;
    end
    clr = 0; #10;

    // Test 2: Keep value (sel = 00)
    parin = 4'b1010; sel = 2'b00; #10;
    if (out !== 4'b0000) begin
        $display("FAIL: Output should remain 0 after keep value");
        $finish;
    end

    // Test 3: Right rotation (sel = 01)
    parin = 4'b1010; sel = 2'b01; #10;
    if (out !== 4'b0101) begin
        $display("FAIL: Right rotation failed");
        $finish;
    end

    // Test 4: Left rotation (sel = 10)
    parin = 4'b1010; sel = 2'b10; #10;
    if (out !== 4'b0101) begin
        $display("FAIL: Left rotation failed");
        $finish;
    end

    // Test 5: Load value (sel = 11)
    parin = 4'b1100; sel = 2'b11; #10;
    if (out !== 4'b1100) begin
        $display("FAIL: Load value failed");
        $finish;
    end

    // Test 6: Check keeping value after loading
    sel = 2'b00; #10;
    if (out !== 4'b1100) begin
        $display("FAIL: Output should remain 1100 after keep value");
        $finish;
    end

    // Test 7: Reset again
    clr = 1; #10;
    if (out !== 4'b0000) begin
        $display("FAIL: Reset did not clear output");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

always #5 clk = ~clk; // Clock generation

endmodule