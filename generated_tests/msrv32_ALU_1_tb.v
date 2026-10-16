`timescale 1ns/1ps

module tb_msrv32_ALU;

    reg [31:0] op_1;
    reg [31:0] op_2;
    reg [3:0] opcode;
    wire [31:0] result;

    // Instantiate the ALU
    msrv32_ALU uut (
        .op_1_in(op_1),
        .op_2_in(op_2),
        .opcode_in(opcode),
        .result_out(result)
    );

    initial begin
        // Test addition
        op_1 = 32'h00000005; 
        op_2 = 32'h00000003; 
        opcode = 4'b0000; 
        #10;
        if (result !== 32'h00000008) $display("FAIL: Addition failed");

        // Test subtraction
        op_1 = 32'h00000005; 
        op_2 = 32'h00000003; 
        opcode = 4'b1000; 
        #10;
        if (result !== 32'h00000002) $display("FAIL: Subtraction failed");

        // Test less than (unsigned)
        op_1 = 32'h00000002; 
        op_2 = 32'h00000003; 
        opcode = 4'b0011; 
        #10;
        if (result !== 32'h00000001) $display("FAIL: Less than comparison failed");

        // Test bitwise AND
        op_1 = 32'hFFFFFFFF; 
        op_2 = 32'h0F0F0F0F; 
        opcode = 4'b0111; 
        #10;
        if (result !== 32'h0F0F0F0F) $display("FAIL: Bitwise AND failed");

        // Test bitwise OR
        op_1 = 32'h0F0F0F0F; 
        op_2 = 32'hFFFFFFFF; 
        opcode = 4'b0110; 
        #10;
        if (result !== 32'hFFFFFFFF) $display("FAIL: Bitwise OR failed");

        // Test bitwise XOR
        op_1 = 32'h0F0F0F0F; 
        op_2 = 32'hFFFFFFFF; 
        opcode = 4'b0100; 
        #10;
        if (result !== 32'hF0F0F0F0) $display("FAIL: Bitwise XOR failed");

        // Test left shift
        op_1 = 32'h00000001; 
        op_2 = 32'h00000002; 
        opcode = 4'b0001; 
        #10;
        if (result !== 32'h00000004) $display("FAIL: Left shift failed");

        // Test right shift
        op_1 = 32'h00000004; 
        op_2 = 32'h00000002; 
        opcode = 4'b0101; 
        #10;
        if (result !== 32'h00000001) $display("FAIL: Right shift failed");

        // Test arithmetic right shift
        op_1 = 32'hFFFFFFFC; 
        op_2 = 32'h00000002; 
        opcode = 4'b1101; 
        #10;
        if (result !== 32'hFFFFFFFF) $display("FAIL: Arithmetic right shift failed");

        // Test less than with sign
        op_1 = 32'hFFFFFFFF; 
        op_2 = 32'h00000001; 
        opcode = 4'b0010; 
        #10;
        if (result !== 32'h00000000) $display("FAIL: Signed less than comparison failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule