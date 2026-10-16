`timescale 1ns/1ps

module tb_InputTracker;

    reg clk;
    reg rst_n;
    reg [19:0] din;
    reg read;
    reg write;
    wire [19:0] d0_addr;
    wire [19:0] d1_addr;
    wire [19:0] d2_addr;
    wire [19:0] d3_addr;
    wire [19:0] d4_addr;
    wire [19:0] d5_addr;
    wire [19:0] d6_addr;
    wire [19:0] d7_addr;

    // Instantiate the module under test
    InputTracker uut (
        .clk(clk),
        .rst_n(rst_n),
        .din(din),
        .read(read),
        .write(write),
        .d0_addr(d0_addr),
        .d1_addr(d1_addr),
        .d2_addr(d2_addr),
        .d3_addr(d3_addr),
        .d4_addr(d4_addr),
        .d5_addr(d5_addr),
        .d6_addr(d6_addr),
        .d7_addr(d7_addr)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0;
        din = 20'd0;
        read = 0;
        write = 0;

        // Release reset
        #10;
        rst_n = 1;

        // Test 1: Write addresses
        write = 1;
        din = 20'h00001; #10;
        din = 20'h00002; #10;
        din = 20'h00003; #10;
        din = 20'h00004; #10;
        din = 20'h00005; #10;
        din = 20'h00006; #10;
        din = 20'h00007; #10;
        din = 20'h00008; #10;
        write = 0; // Stop writing

        // Test 2: Read addresses
        read = 1; #10;
        if (d0_addr !== 20'h00001) $display("FAIL: d0_addr expected 0x00001, got 0x%h", d0_addr);
        if (d1_addr !== 20'h00002) $display("FAIL: d1_addr expected 0x00002, got 0x%h", d1_addr);
        if (d2_addr !== 20'h00003) $display("FAIL: d2_addr expected 0x00003, got 0x%h", d2_addr);
        if (d3_addr !== 20'h00004) $display("FAIL: d3_addr expected 0x00004, got 0x%h", d3_addr);
        if (d4_addr !== 20'h00005) $display("FAIL: d4_addr expected 0x00005, got 0x%h", d4_addr);
        if (d5_addr !== 20'h00006) $display("FAIL: d5_addr expected 0x00006, got 0x%h", d5_addr);
        if (d6_addr !== 20'h00007) $display("FAIL: d6_addr expected 0x00007, got 0x%h", d6_addr);
        if (d7_addr !== 20'h00008) $display("FAIL: d7_addr expected 0x00008, got 0x%h", d7_addr);
        read = 0; // Stop reading

        // Test 3: Check head and tail after reading
        #10;
        if (uut.head !== 2) $display("FAIL: head expected 2, got %d", uut.head);
        if (uut.tail !== 8) $display("FAIL: tail expected 8, got %d", uut.tail);

        // Test 4: Write more addresses
        write = 1;
        din = 20'h00009; #10;
        din = 20'h0000A; #10;
        din = 20'h0000B; #10;
        din = 20'h0000C; #10;
        write = 0; // Stop writing

        // Test 5: Read again
        read = 1; #10;
        if (d0_addr !== 20'h00009) $display("FAIL: d0_addr expected 0x00009, got 0x%h", d0_addr);
        if (d1_addr !== 20'h0000A) $display("FAIL: d1_addr expected 0x0000A, got 0x%h", d1_addr);
        if (d2_addr !== 20'h0000B) $display("FAIL: d2_addr expected 0x0000B, got 0x%h", d2_addr);
        if (d3_addr !== 20'h0000C) $display("FAIL: d3_addr expected 0x0000C, got 0x%h", d3_addr);
        read = 0; // Stop reading

        // Final check
        #10;
        if (uut.head !== 6) $display("FAIL: head expected 6, got %d", uut.head);
        if (uut.tail !== 12) $display("FAIL: tail expected 12, got %d", uut.tail);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule