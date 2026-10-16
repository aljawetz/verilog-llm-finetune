`timescale 1ns/1ps

module tb_alu;

    reg [31:0] a, b;
    reg [5:0] aluc;
    wire [31:0] r;
    wire zero, carry, negative, overflow, flag;

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
        // Test case 1: Addition
        a = 32'h00000001; b = 32'h00000001; aluc = 6'b100000; // ADD
        #10;
        if (r !== 32'h00000002 || zero !== 1'b0 || carry !== 1'b0 || negative !== 1'b0 || overflow !== 1'b0) 
            $display("FAIL: Addition test failed");

        // Test case 2: Subtraction
        a = 32'h00000002; b = 32'h00000001; aluc = 6'b100010; // SUB
        #10;
        if (r !== 32'h00000001 || zero !== 1'b0 || carry !== 1'b0 || negative !== 1'b0 || overflow !== 1'b0) 
            $display("FAIL: Subtraction test failed");

        // Test case 3: AND
        a = 32'hFFFFFFFF; b = 32'h0F0F0F0F; aluc = 6'b100100; // AND
        #10;
        if (r !== 32'h0F0F0F0F || zero !== 1'b0 || negative !== 1'b0) 
            $display("FAIL: AND test failed");

        // Test case 4: OR
        a = 32'h00000000; b = 32'h0F0F0F0F; aluc = 6'b100101; // OR
        #10;
        if (r !== 32'h0F0F0F0F || zero !== 1'b0 || negative !== 1'b0) 
            $display("FAIL: OR test failed");

        // Test case 5: XOR
        a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; aluc = 6'b100110; // XOR
        #10;
        if (r !== 32'h00000000 || zero !== 1'b1 || negative !== 1'b0) 
            $display("FAIL: XOR test failed");

        // Test case 6: SLT
        a = 32'h00000001; b = 32'h00000002; aluc = 6'b101010; // SLT
        #10;
        if (r !== 32'h00000001 || flag !== 1'b1) 
            $display("FAIL: SLT test failed");

        // Test case 7: SLL
        a = 32'h00000002; b = 32'h00000001; aluc = 6'b000000; // SLL
        #10;
        if (r !== 32'h00000004) 
            $display("FAIL: SLL test failed");

        // Test case 8: SRL
        a = 32'h00000002; b = 32'h00000004; aluc = 6'b000010; // SRL
        #10;
        if (r !== 32'h00000001) 
            $display("FAIL: SRL test failed");

        // Test case 9: Overflow in addition
        a = 32'h7FFFFFFF; b = 32'h00000001; aluc = 6'b100000; // ADD
        #10;
        if (overflow !== 1'b1) 
            $display("FAIL: Overflow test failed");

        // Test case 10: Negative flag
        a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; aluc = 6'b100010; // SUB
        #10;
        if (r !== 32'h00000000 || negative !== 1'b0) 
            $display("FAIL: Negative flag test failed");

        $display("PASS");
        $finish;
    end

endmodule