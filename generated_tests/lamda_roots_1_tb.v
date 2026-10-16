`timescale 1ns/1ps

module tb_lamda_roots;

    reg CE;
    reg clk;
    reg reset;
    reg [7:0] Lc0, Lc1, Lc2, Lc3, Lc4, Lc5, Lc6, Lc7, Lc8;
    reg [7:0] power;
    reg [7:0] decimal0, decimal1, decimal2;
    wire [7:0] add_GF_ascending;
    wire [7:0] add_GF_dec0, add_GF_dec1, add_GF_dec2;
    wire CEO;
    wire [3:0] root_cnt;
    wire [7:0] r1, r2, r3, r4, r5, r6, r7, r8;

    lamda_roots uut (
        .CE(CE),
        .clk(clk),
        .reset(reset),
        .Lc0(Lc0),
        .Lc1(Lc1),
        .Lc2(Lc2),
        .Lc3(Lc3),
        .Lc4(Lc4),
        .Lc5(Lc5),
        .Lc6(Lc6),
        .Lc7(Lc7),
        .Lc8(Lc8),
        .add_GF_ascending(add_GF_ascending),
        .add_GF_dec0(add_GF_dec0),
        .add_GF_dec1(add_GF_dec1),
        .add_GF_dec2(add_GF_dec2),
        .power(power),
        .decimal0(decimal0),
        .decimal1(decimal1),
        .decimal2(decimal2),
        .CEO(CEO),
        .root_cnt(root_cnt),
        .r1(r1),
        .r2(r2),
        .r3(r3),
        .r4(r4),
        .r5(r5),
        .r6(r6),
        .r7(r7),
        .r8(r8)
    );

    initial begin
        clk = 0;
        reset = 1;
        CE = 0;
        Lc0 = 8'h01; Lc1 = 8'h02; Lc2 = 8'h03; Lc3 = 8'h04; 
        Lc4 = 8'h05; Lc5 = 8'h06; Lc6 = 8'h07; Lc7 = 8'h08; 
        Lc8 = 8'h09;
        power = 8'h0A;
        decimal0 = 8'h0B; decimal1 = 8'h0C; decimal2 = 8'h0D;

        #10 reset = 0; // Release reset
        #10 CE = 1; // Enable the module
        #10 CE = 0; // Disable the module

        // Wait for CEO signal to go high
        wait(CEO);
        #10;

        // Check root count
        if (root_cnt != 0) begin
            $display("FAIL: Expected root count to be 0, got %d", root_cnt);
            $finish;
        end

        // Check values of r1 to r8
        if (r1 != 0 || r2 != 0 || r3 != 0 || r4 != 0 || 
            r5 != 0 || r6 != 0 || r7 != 0 || r8 != 0) begin
            $display("FAIL: Expected all roots to be 0, got r1=%d, r2=%d, r3=%d, r4=%d, r5=%d, r6=%d, r7=%d, r8=%d", 
                     r1, r2, r3, r4, r5, r6, r7, r8);
            $finish;
        end

        // Further tests can be added here...

        $display("PASS");
        $finish;
    end

    always #5 clk = ~clk; // Clock generation

endmodule