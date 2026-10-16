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

    // Test 1: Load data into the shift register
    pi = 4'b1010; // Load 1010
    sel = 0; // Select load
    clr = 0; // Clear not active
    #10; // Wait for a clock cycle
    if (uut.data !== 4'b1010) begin
        $display("FAIL: Data not loaded correctly");
        $finish;
    end

    // Test 2: Shift out data
    sel = 1; // Select shift
    #10; // Wait for a clock cycle
    if (so !== 1'b0) begin
        $display("FAIL: First bit shifted out is incorrect");
        $finish;
    end
    #10; // Wait for a clock cycle
    if (so !== 1'b1) begin
        $display("FAIL: Second bit shifted out is incorrect");
        $finish;
    end
    #10; // Wait for a clock cycle
    if (so !== 1'b0) begin
        $display("FAIL: Third bit shifted out is incorrect");
        $finish;
    end
    #10; // Wait for a clock cycle
    if (so !== 1'b1) begin
        $display("FAIL: Fourth bit shifted out is incorrect");
        $finish;
    end

    // Test 3: Clear functionality
    clr = 1; // Activate clear
    #10; // Wait for a clock cycle
    if (uut.data !== 4'b0000) begin
        $display("FAIL: Clear did not reset data");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

always #5 clk = ~clk; // Clock generation

endmodule