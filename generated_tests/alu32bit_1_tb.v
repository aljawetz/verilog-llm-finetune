`timescale 1ns/1ps

module tb_alu32bit;

    reg [31:0] in_a, in_b;
    reg in_c;
    reg [1:0] ctrl;
    wire [31:0] alu_out;
    wire c_out;

    alu32bit uut (
        .in_a(in_a),
        .in_b(in_b),
        .in_c(in_c),
        .ctrl(ctrl),
        .alu_out(alu_out),
        .c_out(c_out)
    );

    initial begin
        // Test Addition
        in_a = 32'h00000001; 
        in_b = 32'h00000001; 
        in_c = 1'b0; 
        ctrl = 2'b00; // ADD
        #10;
        if (alu_out !== 32'h00000002 || c_out !== 1'b0) begin
            $display("FAIL: Addition test failed");
            $finish;
        end

        // Test Addition with carry
        in_a = 32'hFFFFFFFF; 
        in_b = 32'h00000001; 
        in_c = 1'b0; 
        ctrl = 2'b00; // ADD
        #10;
        if (alu_out !== 32'h00000000 || c_out !== 1'b1) begin
            $display("FAIL: Addition with carry test failed");
            $finish;
        end

        // Test Subtraction
        in_a = 32'h00000002; 
        in_b = 32'h00000001; 
        in_c = 1'b0; 
        ctrl = 2'b01; // SUB
        #10;
        if (alu_out !== 32'h00000001 || c_out !== 1'b0) begin
            $display("FAIL: Subtraction test failed");
            $finish;
        end

        // Test Subtraction with borrow
        in_a = 32'h00000001; 
        in_b = 32'h00000002; 
        in_c = 1'b0; 
        ctrl = 2'b01; // SUB
        #10;
        if (alu_out !== 32'hFFFFFFFF || c_out !== 1'b1) begin
            $display("FAIL: Subtraction with borrow test failed");
            $finish;
        end

        // Test Bitwise OR
        in_a = 32'hAAAAAAAA; 
        in_b = 32'h55555555; 
        in_c = 1'b0; 
        ctrl = 2'b10; // OR
        #10;
        if (alu_out !== 32'hFFFFFFFF || c_out !== 1'b0) begin
            $display("FAIL: Bitwise OR test failed");
            $finish;
        end

        // Test Bitwise AND
        in_a = 32'hFFFFFFFF; 
        in_b = 32'h00000000; 
        in_c = 1'b0; 
        ctrl = 2'b11; // AND
        #10;
        if (alu_out !== 32'h00000000 || c_out !== 1'b0) begin
            $display("FAIL: Bitwise AND test failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule