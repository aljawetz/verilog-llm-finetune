`timescale 1ns/1ps

module tb_alu;

    reg [31:0] a;
    reg [31:0] b;
    reg [5:0] aluc;
    wire [31:0] r;
    wire zero;
    wire carry;
    wire negative;
    wire overflow;
    wire flag;

    // Instantiate the ALU
    alu uut (
        .a(a),
        .b(b),
        .aluc(aluc),
        .r(r),
        .zero(zero),
        .carry(carry),
        .negative(negative),
        .overflow(overflow),
        .flag(flag)
    );

    initial begin
        // Test ADD
        a = 32'h00000001; b = 32'h00000001; aluc = 6'b100000; // 1 + 1
        #10;
        if (r !== 32'h00000002 || zero !== 1'b0 || carry !== 1'b0 || negative !== 1'b0 || overflow !== 1'b0) 
            $display("FAIL: ADD test failed");

        // Test SUB
        a = 32'h00000002; b = 32'h00000001; aluc = 6'b100010; // 2 - 1
        #10;
        if (r !== 32'h00000001 || zero !== 1'b0 || carry !== 1'b1 || negative !== 1'b0 || overflow !== 1'b0) 
            $display("FAIL: SUB test failed");

        // Test AND
        a = 32'hFFFFFFFF; b = 32'h0F0F0F0F; aluc = 6'b100100; // 0xFFFFFFFF & 0x0F0F0F0F
        #10;
        if (r !== 32'h0F0F0F0F || zero !== 1'b0 || carry !== 1'b0 || negative !== 1'b0 || overflow !== 1'b0) 
            $display("FAIL: AND test failed");

        // Test OR
        a = 32'h00000000; b = 32'h0F0F0F0F; aluc = 6'b100101; // 0x00000000 | 0x0F0F0F0F
        #10;
        if (r !== 32'h0F0F0F0F || zero !== 1'b0 || carry !== 1'b0 || negative !== 1'b0 || overflow !== 1'b0) 
            $display("FAIL: OR test failed");

        // Test XOR
        a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; aluc = 6'b100110; // 0xFFFFFFFF ^ 0xFFFFFFFF
        #10;
        if (r !== 32'h00000000 || zero !== 1'b1 || carry !== 1'b0 || negative !== 1'b0 || overflow !== 1'b0) 
            $display("FAIL: XOR test failed");

        // Test SLT
        a = 32'h00000001; b = 32'h00000002; aluc = 6'b101010; // 1 < 2
        #10;
        if (r !== 32'h00000001 || flag !== 1'b1) 
            $display("FAIL: SLT test failed");

        // Test SLTU
        a = 32'h00000002; b = 32'h00000001; aluc = 6'b101011; // 2 < 1 (unsigned)
        #10;
        if (r !== 32'h00000000 || flag !== 1'b0) 
            $display("FAIL: SLTU test failed");

        // Test SLL
        a = 32'h00000002; b = 32'h00000001; aluc = 6'b000000; // 1 << 2
        #10;
        if (r !== 32'h00000004) 
            $display("FAIL: SLL test failed");

        // Test SRL
        a = 32'h00000002; b = 32'h00000004; aluc = 6'b000010; // 4 >> 2
        #10;
        if (r !== 32'h00000001) 
            $display("FAIL: SRL test failed");

        // Test SRA
        a = 32'h00000002; b = 32'hFFFFFFFC; aluc = 6'b000011; // -4 >> 2
        #10;
        if (r !== 32'hFFFFFFFF) 
            $display("FAIL: SRA test failed");

        // Test LUI
        a = 32'h00000000; b = 32'h0000FFFF; aluc = 6'b001111; // LUI
        #10;
        if (r !== 32'hFFFF0000) 
            $display("FAIL: LUI test failed");

        $display("PASS");
        $finish;
    end

endmodule