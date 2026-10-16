`timescale 1ns/1ps

module tb_ALU_Control;

    reg [9:0] funct_i;
    reg [1:0] ALUOp_i;
    wire [2:0] ALUCtrl_o;

    // Instantiate the ALU_Control module
    ALU_Control uut (
        .funct_i(funct_i),
        .ALUOp_i(ALUOp_i),
        .ALUCtrl_o(ALUCtrl_o)
    );

    initial begin
        // Test case 1: ALUOp = 2'b11 (add)
        ALUOp_i = 2'b11; funct_i = 10'b0000000000; // Should output 3'b001
        #10;
        if (ALUCtrl_o !== 3'b001) begin
            $display("FAIL: Test case 1 failed, expected 3'b001 but got %b", ALUCtrl_o);
            $finish;
        end

        // Test case 2: ALUOp = 2'b10, funct_i = 10'b0000000000 (add)
        ALUOp_i = 2'b10; funct_i = 10'b0000000000; // Should output 3'b001
        #10;
        if (ALUCtrl_o !== 3'b001) begin
            $display("FAIL: Test case 2 failed, expected 3'b001 but got %b", ALUCtrl_o);
            $finish;
        end

        // Test case 3: ALUOp = 2'b10, funct_i = 10'b0100000000 (sub)
        ALUOp_i = 2'b10; funct_i = 10'b0100000000; // Should output 3'b010
        #10;
        if (ALUCtrl_o !== 3'b010) begin
            $display("FAIL: Test case 3 failed, expected 3'b010 but got %b", ALUCtrl_o);
            $finish;
        end

        // Test case 4: ALUOp = 2'b10, funct_i = 10'b0000001000 (mul)
        ALUOp_i = 2'b10; funct_i = 10'b0000001000; // Should output 3'b110
        #10;
        if (ALUCtrl_o !== 3'b110) begin
            $display("FAIL: Test case 4 failed, expected 3'b110 but got %b", ALUCtrl_o);
            $finish;
        end

        // Test case 5: ALUOp = 2'b10, funct_i = 10'b0000000110 (OR)
        ALUOp_i = 2'b10; funct_i = 10'b0000000110; // Should output 3'b100
        #10;
        if (ALUCtrl_o !== 3'b100) begin
            $display("FAIL: Test case 5 failed, expected 3'b100 but got %b", ALUCtrl_o);
            $finish;
        end

        // Test case 6: ALUOp = 2'b10, funct_i = 10'b0000000111 (AND)
        ALUOp_i = 2'b10; funct_i = 10'b0000000111; // Should output 3'b011
        #10;
        if (ALUCtrl_o !== 3'b011) begin
            $display("FAIL: Test case 6 failed, expected 3'b011 but got %b", ALUCtrl_o);
            $finish;
        end

        // Test case 7: ALUOp = 2'b01 (beq, should output sub)
        ALUOp_i = 2'b01; funct_i = 10'b0000000000; // Should output 3'b010
        #10;
        if (ALUCtrl_o !== 3'b010) begin
            $display("FAIL: Test case 7 failed, expected 3'b010 but got %b", ALUCtrl_o);
            $finish;
        end

        // Test case 8: ALUOp = 2'b00 (default case, should output add)
        ALUOp_i = 2'b00; funct_i = 10'b0000000000; // Should output 3'b001
        #10;
        if (ALUCtrl_o !== 3'b001) begin
            $display("FAIL: Test case 8 failed, expected 3'b001 but got %b", ALUCtrl_o);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule