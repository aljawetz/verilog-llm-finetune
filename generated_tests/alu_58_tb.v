`timescale 1ns/1ps

module tb_alu;

    reg [7:0] a;
    reg [7:0] b;
    reg sel;
    wire [7:0] alu_result;

    // Instantiate the ALU module
    alu uut (
        .a(a),
        .b(b),
        .sel(sel),
        .alu_result(alu_result)
    );

    initial begin
        // Test case 1: AND operation
        a = 8'b10101010; 
        b = 8'b11001100; 
        sel = 1'b0; 
        #10;
        if (alu_result !== (a & b)) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: ADD operation (sel = 1)
        a = 8'b00001111; 
        b = 8'b00000001; 
        sel = 1'b1; 
        #10;
        if (alu_result !== (a + b - b)) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: AND operation with zero
        a = 8'b00000000; 
        b = 8'b11111111; 
        sel = 1'b0; 
        #10;
        if (alu_result !== (a & b)) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: ADD operation with zero
        a = 8'b00000000; 
        b = 8'b00000000; 
        sel = 1'b1; 
        #10;
        if (alu_result !== (a + b - b)) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: AND operation with all ones
        a = 8'b11111111; 
        b = 8'b11111111; 
        sel = 1'b0; 
        #10;
        if (alu_result !== (a & b)) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: ADD operation with carry
        a = 8'b11111111; 
        b = 8'b00000001; 
        sel = 1'b1; 
        #10;
        if (alu_result !== (a + b - b)) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule