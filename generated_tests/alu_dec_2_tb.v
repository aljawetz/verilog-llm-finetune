`timescale 1ns/1ps

module tb_alu_dec;

    reg [5:0] funct;
    reg [1:0] op;
    wire [2:0] alucontrol;

    alu_dec uut (
        .funct(funct),
        .op(op),
        .alucontrol(alucontrol)
    );

    initial begin
        // Test case 1: op = 00 (add)
        op = 2'b00; funct = 6'bxxxxxx; // funct doesn't matter
        #10;
        if (alucontrol !== 3'b010) begin
            $display("FAIL: Test case 1 failed, expected 3'b010, got %b", alucontrol);
            $finish;
        end

        // Test case 2: op = 01 (sub)
        op = 2'b01; funct = 6'bxxxxxx; // funct doesn't matter
        #10;
        if (alucontrol !== 3'b110) begin
            $display("FAIL: Test case 2 failed, expected 3'b110, got %b", alucontrol);
            $finish;
        end

        // Test case 3: op = 10, funct = 100000 (add)
        op = 2'b10; funct = 6'b100000;
        #10;
        if (alucontrol !== 3'b010) begin
            $display("FAIL: Test case 3 failed, expected 3'b010, got %b", alucontrol);
            $finish;
        end

        // Test case 4: op = 10, funct = 100010 (sub)
        op = 2'b10; funct = 6'b100010;
        #10;
        if (alucontrol !== 3'b110) begin
            $display("FAIL: Test case 4 failed, expected 3'b110, got %b", alucontrol);
            $finish;
        end

        // Test case 5: op = 10, funct = 100100 (AND)
        op = 2'b10; funct = 6'b100100;
        #10;
        if (alucontrol !== 3'b000) begin
            $display("FAIL: Test case 5 failed, expected 3'b000, got %b", alucontrol);
            $finish;
        end

        // Test case 6: op = 10, funct = 100101 (OR)
        op = 2'b10; funct = 6'b100101;
        #10;
        if (alucontrol !== 3'b001) begin
            $display("FAIL: Test case 6 failed, expected 3'b001, got %b", alucontrol);
            $finish;
        end

        // Test case 7: op = 10, funct = 101010 (set on less than)
        op = 2'b10; funct = 6'b101010;
        #10;
        if (alucontrol !== 3'b111) begin
            $display("FAIL: Test case 7 failed, expected 3'b111, got %b", alucontrol);
            $finish;
        end

        // Test case 8: op = 10, funct = invalid value
        op = 2'b10; funct = 6'b111111; // invalid funct
        #10;
        if (alucontrol !== 3'b000) begin
            $display("FAIL: Test case 8 failed, expected 3'b000, got %b", alucontrol);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule