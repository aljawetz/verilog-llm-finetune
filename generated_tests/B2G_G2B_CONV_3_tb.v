`timescale 1ns/1ps

module tb_B2G_G2B_CONV;

reg chooser;
reg [3:0] in;
wire [3:0] out;

// Instantiate the module under test
B2G_G2B_CONV uut (
    .chooser(chooser),
    .in(in),
    .out(out)
);

initial begin
    // Test Binary to Gray conversion
    chooser = 1'b1; // Set chooser for B2G
    in = 4'b0000;   // Test input 0
    #10;
    if (out !== 4'b0000) begin
        $display("FAIL: B2G conversion failed for input 0");
        $finish;
    end

    in = 4'b0001;   // Test input 1
    #10;
    if (out !== 4'b0001) begin
        $display("FAIL: B2G conversion failed for input 1");
        $finish;
    end

    in = 4'b0010;   // Test input 2
    #10;
    if (out !== 4'b0011) begin
        $display("FAIL: B2G conversion failed for input 2");
        $finish;
    end

    in = 4'b0011;   // Test input 3
    #10;
    if (out !== 4'b0010) begin
        $display("FAIL: B2G conversion failed for input 3");
        $finish;
    end

    in = 4'b0100;   // Test input 4
    #10;
    if (out !== 4'b0110) begin
        $display("FAIL: B2G conversion failed for input 4");
        $finish;
    end

    in = 4'b1111;   // Test input 15
    #10;
    if (out !== 4'b1000) begin
        $display("FAIL: B2G conversion failed for input 15");
        $finish;
    end

    // Test Gray to Binary conversion
    chooser = 1'b0; // Set chooser for G2B
    in = 4'b0000;   // Test input 0
    #10;
    if (out !== 4'b0000) begin
        $display("FAIL: G2B conversion failed for input 0");
        $finish;
    end

    in = 4'b0001;   // Test input 1
    #10;
    if (out !== 4'b0001) begin
        $display("FAIL: G2B conversion failed for input 1");
        $finish;
    end

    in = 4'b0011;   // Test input 3
    #10;
    if (out !== 4'b0010) begin
        $display("FAIL: G2B conversion failed for input 3");
        $finish;
    end

    in = 4'b0110;   // Test input 6
    #10;
    if (out !== 4'b0100) begin
        $display("FAIL: G2B conversion failed for input 6");
        $finish;
    end

    in = 4'b1000;   // Test input 8
    #10;
    if (out !== 4'b1111) begin
        $display("FAIL: G2B conversion failed for input 8");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule