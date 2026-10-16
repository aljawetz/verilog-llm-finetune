`timescale 1ns/1ps

module tb_JK;

reg clock;
reg rst;
reg j;
reg k;
wire q;
wire q_bar;

// Instantiate the JK flip-flop
JK uut (
    .clock(clock),
    .rst(rst),
    .j(j),
    .k(k),
    .q(q),
    .q_bar(q_bar)
);

// Clock generation
always begin
    #5 clock = ~clock; // 10ns clock period
end

initial begin
    // Initialize signals
    clock = 0;
    rst = 0;
    j = 0;
    k = 0;

    // Test sequence
    // Test 1: Reset
    rst = 1; #10;
    if (q !== 0 || q_bar !== 1) begin
        $display("FAIL: Reset failed");
        $finish;
    end

    // Test 2: Set (j=1, k=0)
    rst = 0; j = 1; k = 0; #10;
    if (q !== 1 || q_bar !== 0) begin
        $display("FAIL: Set failed");
        $finish;
    end

    // Test 3: No Change (j=0, k=0)
    j = 0; k = 0; #10;
    if (q !== 1 || q_bar !== 0) begin
        $display("FAIL: No Change failed");
        $finish;
    end

    // Test 4: Reset (j=0, k=1)
    j = 0; k = 1; #10;
    if (q !== 0 || q_bar !== 1) begin
        $display("FAIL: Reset failed");
        $finish;
    end

    // Test 5: Toggle (j=1, k=1)
    j = 1; k = 1; #10;
    if (q !== 1 || q_bar !== 0) begin
        $display("FAIL: Toggle failed");
        $finish;
    end
    #10; // Wait for next clock edge
    if (q !== 0 || q_bar !== 1) begin
        $display("FAIL: Toggle failed on next clock");
        $finish;
    end

    // Test 6: No Change (j=0, k=0)
    j = 0; k = 0; #10;
    if (q !== 0 || q_bar !== 1) begin
        $display("FAIL: No Change failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule