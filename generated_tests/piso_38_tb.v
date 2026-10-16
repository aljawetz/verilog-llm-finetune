`timescale 1ns/1ps

module tb_piso;

reg clk;
reg reset;
reg load;
reg [3:0] di;
wire do;

piso uut (
    .reset(reset),
    .clk(clk),
    .load(load),
    .di(di),
    .do(do)
);

initial begin
    // Initialize signals
    clk = 0;
    reset = 1;
    load = 0;
    di = 4'b0000;

    // Wait for a time to observe reset
    #5;
    reset = 0; // Release reset

    // Test 1: Load value 4'b1010
    di = 4'b1010;
    load = 1;
    #10; // Wait for one clock cycle
    load = 0;

    // Test 2: Shift out bits
    #10; // Wait for one clock cycle
    if (do !== 0) begin
        $display("FAIL: Expected do = 0 after first shift, got %b", do);
        $finish;
    end

    #10; // Wait for one clock cycle
    if (do !== 1) begin
        $display("FAIL: Expected do = 1 after second shift, got %b", do);
        $finish;
    end

    #10; // Wait for one clock cycle
    if (do !== 0) begin
        $display("FAIL: Expected do = 0 after third shift, got %b", do);
        $finish;
    end

    #10; // Wait for one clock cycle
    if (do !== 1) begin
        $display("FAIL: Expected do = 1 after fourth shift, got %b", do);
        $finish;
    end

    // Test 3: Reset the module
    reset = 1;
    #5; // Wait for reset to take effect
    reset = 0;

    // Test 4: Load new value 4'b1111
    di = 4'b1111;
    load = 1;
    #10; // Wait for one clock cycle
    load = 0;

    // Shift out new bits
    #10; // Wait for one clock cycle
    if (do !== 1) begin
        $display("FAIL: Expected do = 1 after first shift, got %b", do);
        $finish;
    end

    #10; // Wait for one clock cycle
    if (do !== 1) begin
        $display("FAIL: Expected do = 1 after second shift, got %b", do);
        $finish;
    end

    #10; // Wait for one clock cycle
    if (do !== 1) begin
        $display("FAIL: Expected do = 1 after third shift, got %b", do);
        $finish;
    end

    #10; // Wait for one clock cycle
    if (do !== 1) begin
        $display("FAIL: Expected do = 1 after fourth shift, got %b", do);
        $finish;
    end

    $display("PASS");
    $finish;
end

always #5 clk = ~clk; // Generate clock

endmodule